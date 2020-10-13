import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/pages/continent_page.dart';
import 'package:flutter/material.dart';

class ContinentTile extends StatelessWidget {
  final Continent _continent;
  final int _index;

  const ContinentTile({@required Continent continent, @required int index})
      : this._continent = continent,
        this._index = index,
        assert(continent != null),
        assert(index != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Card(
        elevation: 10.0,
        shape: SHAPE,
        child: MaterialButton(
          shape: SHAPE,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ContinentPage(
                  continent: _continent,
                  index: _index,
                ),
              ),
            );
          },
          child: ListTile(
            title: Text(
              _continent.continent,
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Row(
              children: <Widget>[
                Chip(
                  label: Text("Cases: ${_continent.cases}"),
                )
              ],
            ),
            leading: Text(
              "${_index + 1}",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
