import 'package:coronatracker/data/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPage extends StatelessWidget {
  final String _heading;
  final String _value;
  final Color _color;

  const DataPage(
      {@required String heading, @required String value, @required Color color})
      : this._heading = heading,
        this._value = value,
        this._color = color,
        assert(heading != null),
        assert(value != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Widget text = Text(
      NumberFormat("###,###,###,###").format(int.parse(_value)),
      style: TextStyle(
        color: Colors.white,
        fontSize: Theme.of(context).textTheme.headline3.fontSize,
      ),
    );

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
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: EdgeInsets.only(top: size.height / 10),
              height: size.height / 2,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [_color, Theme.of(context).canvasColor],
                ),
              ),
              child: text,
            ),
            Container(
              margin: EdgeInsets.only(top: size.height / 3),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: SHAPE,
                child: ListTile(
                  title: Text(
                    "Loading past records",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: LinearProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
