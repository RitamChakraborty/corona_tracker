import 'package:coronatracker/data/constants.dart';
import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final String _label;
  final String _value;

  const DataTile({@required String label, @required String value})
      : this._label = label,
        this._value = value,
        assert(label != null),
        assert(value != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        elevation: 10.0,
        shape: SHAPE,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[50]
            : Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text("$_label"),
            trailing: Text("$_value"),
          ),
        ),
      ),
    );
  }
}
