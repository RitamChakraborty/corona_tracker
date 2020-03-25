import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  final GlobalData _globalData;
  final CountryData _country;

  const CountryDetails({GlobalData globalData, CountryData country})
      : this._globalData = globalData,
        this._country = country,
        assert(globalData != null),
        assert(country != null);

  Widget card({Widget child}) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          elevation: 0,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_country.country),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              card(
                child: ListTile(
                  title: Text(
                    "Cases: ${_country.cases}",
                  ),
                  subtitle: Text(
                    "Today Cases: ${_country.todayCases}",
                  ),
                  trailing: Text(
                    "${(_country.cases * 100 / _globalData.cases).toStringAsFixed(2)}",
                  ),
                ),
              ),
              card(
                child: ListTile(
                  title: Text("Deaths: ${_country.deaths}"),
                  subtitle: Text(
                    "Today Deaths: ${_country.todayDeaths}",
                  ),
                  trailing: Text(
                    "${(_country.deaths * 100 / _country.cases).toStringAsFixed(2)} %\nof total cases",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              card(
                child: ListTile(
                  title: Text(
                    "Active: ${_country.active}",
                  ),
                  trailing: Text(
                    "${(_country.active * 100 / _country.cases).toStringAsFixed(2)} %\nof total cases",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              card(
                child: ListTile(
                  title: Text(
                    "Critical: ${_country.critical}",
                  ),
                  trailing: Text(
                    "${(_country.critical * 100 / _country.cases).toStringAsFixed(2)} %\nof total cases",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              card(
                child: ListTile(
                  title: Text(
                    "Recovered: ${_country.recovered}",
                  ),
                  subtitle: Text(
                    "${(_country.critical * 100 / _country.cases).toStringAsFixed(2)}",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
