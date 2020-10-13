import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/data/sorting.dart';
import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/pages/country_page.dart';
import 'package:coronatracker/widgets/hero_flag.dart';
import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final Country _country;
  final int _index;
  final SortingType _sortingType;

  const CountryTile(
      {@required Country country, @required SortingType sortingType, int index})
      : this._country = country,
        this._sortingType = sortingType,
        this._index = index,
        assert(country != null),
        assert(sortingType != null);

  @override
  Widget build(BuildContext context) {
    Widget typeChip() {
      Widget label = Text("Cases: ${_country.cases}");
      if (_sortingType == SortingType.NAME) {
        label = Text("Cases: ${_country.cases}");
      } else if (_sortingType == SortingType.CASES) {
        label = Text("Cases: ${_country.cases}");
      } else if (_sortingType == SortingType.DEATHS) {
        label = Text("Deaths: ${_country.deaths}");
      } else if (_sortingType == SortingType.ACTIVE) {
        label = Text("Active: ${_country.active}");
      } else if (_sortingType == SortingType.RECOVERED) {
        label = label = Text("Recovered: ${_country.recovered}");
      }

      return Chip(
        label: label,
      );
    }

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
                builder: (BuildContext context) => CountryPage(
                  country: _country,
                  index: _index,
                ),
              ),
            );
          },
          child: ListTile(
            title: Text(
              _country.country,
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  typeChip(),
                ],
              ),
            ),
            trailing: SizedBox(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: HeroFlag(
                  country: _country,
                ),
              ),
            ),
            leading: _index == null
                ? null
                : Text(
                    "${_index + 1}",
                    style: TextStyle(fontSize: 24.0),
                  ),
          ),
        ),
      ),
    );
  }
}
