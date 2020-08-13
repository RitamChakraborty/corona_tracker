import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/pages/country_page.dart';
import 'package:coronatracker/widgets/hero_flag.dart';
import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final Country _country;
  final int _index;

  const CountryTile({@required Country country, int index})
      : this._country = country,
  this._index = index,
        assert(country != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: MaterialButton(
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
            title: Text(
              _country.country,
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
            ),
            leading: _index == null ? null : Text(
              "${_index + 1}",
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
