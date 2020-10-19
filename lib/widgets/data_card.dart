import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/pages/data_page.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String _label;
  final String _value;
  final Color _color;
  final bool _showHistory;
  final Country _country;

  const DataCard({
    @required String label,
    @required String value,
    @required Color color,
    bool showHistory,
    Country country,
  })  : this._label = label,
        this._value = value,
        this._color = color,
        this._showHistory = showHistory ?? false,
        this._country = country,
        assert(label != null),
        assert(value != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => DataPage(
                  heading: _label,
                  value: _value,
                  color: _color,
                  showHistory: _showHistory,
                  country: _country,
                ),
              ),
            );
          },
          color: _color,
          shape: SHAPE,
          elevation: 10,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _label,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 32.0),
                Text(
                  NUMBER_FORMAT.format(int.parse(_value)),
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
