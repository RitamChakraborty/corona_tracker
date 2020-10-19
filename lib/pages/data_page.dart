import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/models/history.dart';
import 'package:coronatracker/models/single_record.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DataPage extends StatelessWidget {
  final String _heading;
  final String _value;
  final Color _color;
  final bool _showHistory;

  const DataPage(
      {@required String heading,
      @required String value,
      @required Color color,
      bool showHistory})
      : this._heading = heading,
        this._value = value,
        this._color = color,
        this._showHistory = showHistory,
        assert(heading != null),
        assert(value != null),
        assert(color != null),
        assert(showHistory != null);

  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    Size size = MediaQuery.of(context).size;
    String type = _heading.toLowerCase();

    final Widget text = Text(
      NumberFormat("###,###,###,###").format(int.parse(_value)),
      style: TextStyle(
        color: Colors.white,
        fontSize: Theme.of(context).textTheme.headline3.fontSize,
        fontWeight: FontWeight.bold,
      ),
    );

    final loadingWidget = Card(
      shape: SHAPE,
      child: ListTile(
        title: Text(
          "Loading past records",
          textAlign: TextAlign.center,
        ),
        subtitle: LinearProgressIndicator(),
      ),
    );

    final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [_color, Theme.of(context).canvasColor],
      ),
    );

    Widget recordWidget({@required SingleRecord record}) => Card(
          shape: SHAPE,
          child: ListTile(
            title: Text("Date: ${record.date}"),
            trailing: Text("${record.value.toString()}"),
          ),
        );

    Widget body() {
      if (_showHistory) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: EdgeInsets.only(top: size.height / 10),
              height: size.height / 2,
              alignment: Alignment.topCenter,
              decoration: boxDecoration,
              child: text,
            ),
            Container(
              margin: EdgeInsets.only(top: size.height / 3),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder(
                future: serviceProvider.getHistory(type: type),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return loadingWidget;
                  }

                  History history = snapshot.data;
                  List<SingleRecord> records =
                      history.records.reversed.toList();

                  return ListView.builder(
                    itemCount: history.records.length,
                    itemBuilder: (BuildContext context, int index) {
                      return recordWidget(record: records[index]);
                    },
                  );
                },
              ),
            )
          ],
        );
      }

      return Container(
        padding: EdgeInsets.only(bottom: 100.0),
        alignment: Alignment.center,
        decoration: boxDecoration,
        child: text,
      );
    }

    return Material(
      color: _color,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _heading,
            style: TextStyle(color: Colors.white),
          ),
          leading: BackButton(
            color: Colors.white,
          ),
          elevation: 0.0,
          backgroundColor: _color,
          centerTitle: true,
        ),
        body: body(),
      ),
    );
  }
}
