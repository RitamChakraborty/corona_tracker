import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String _label;
  final String _value;
  final Color _color;

  const DataCard(
      {@required String label, @required String value, @required Color color})
      : this._label = label,
        this._value = value,
        this._color = color,
        assert(label != null),
        assert(value != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: _color,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _label,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 32.0),
                Text(
                  _value,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}