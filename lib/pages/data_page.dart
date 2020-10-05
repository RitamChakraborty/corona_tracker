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
    return Material(
      color: _color,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_heading),
          elevation: 0.0,
          backgroundColor: _color,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Text(
            NumberFormat("###,###,###,###").format(int.parse(_value)),
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
