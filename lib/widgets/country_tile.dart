import 'package:coronatracker/models/country.dart';
import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final Country _country;
  final int _index;

  const CountryTile({@required Country country, @required int index})
      : this._country = country,
        this._index = index + 1,
        assert(country != null),
        assert(index != null);

  @override
  Widget build(BuildContext context) {
    Widget image = Image(
      fit: BoxFit.cover,
      image: NetworkImage(
        _country.countryInfo.flag,
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
          leading: SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: image,
            ),
          ),
            title: Text(
              _country.country,
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Row(
              children: <Widget>[
                Chip(
                  label: Text("Cases: ${_country.cases}"),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Chip(
                  label: Text("Deaths: ${_country.deaths}"),
                )
              ],
            ),
            trailing: Text("$_index", style: TextStyle(fontSize: 24.0),),
          ),
        ),
      ),
    );
  }
}
