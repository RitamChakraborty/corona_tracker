import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/widgets/statistics_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
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
                    "${(_country.cases * 100 / _globalData.cases).toStringAsFixed(2)} %\nof global cases",
                    textAlign: TextAlign.center,
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
                    "${(_country.deathPercentage).toStringAsFixed(2)} %\nof total cases",
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
                    "${(_country.activePercentage).toStringAsFixed(2)} %\nof total cases",
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
                    "${(_country.criticalPercentage).toStringAsFixed(2)} %\nof total cases",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              card(
                child: ListTile(
                  title: Text(
                    "Recovered: ${_country.recovered}",
                  ),
                  trailing: Text(
                    "${(_country.recoveredPercentage).toStringAsFixed(2)} %\nof total cases",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: StatisticsChart(
                  _country.seriesList,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
