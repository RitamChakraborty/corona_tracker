import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/widgets/statistics_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountryDetails extends StatelessWidget {
  final GlobalData _globalData;
  final CountryData _country;
  final bool _isContinent;

  const CountryDetails(
      {@required GlobalData globalData,
      @required CountryData country,
      @required bool isContinent})
      : this._globalData = globalData,
        this._country = country,
        this._isContinent = isContinent,
        assert(globalData != null),
        assert(country != null),
        assert(isContinent != null);

  /// Custom [Card] widget
  Widget card({@required Widget child}) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          elevation: 0,
          child: child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      card(
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Cases: ${_country.cases}",
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Today Cases: ${_country.todayCases}",
                ),
                !_isContinent
                    ? Text(
                        "Cases per one million: ${_country.casesPerOneMillion}",
                      )
                    : Container(),
              ],
            ),
          ),
          trailing: Text(
            "${(_country.cases * 100 / _globalData.cases).toStringAsFixed(2)} %\nof global cases",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      card(
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Deaths: ${_country.deaths}"),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Today Deaths: ${_country.todayDeaths}",
                ),
                !_isContinent
                    ? Text(
                        "Deaths per one million: ${_country.deathsPerOneMillion}",
                      )
                    : Container(),
              ],
            ),
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
    ];

    if (!_isContinent) {
      children.add(
        card(
          child: ListTile(
            title: Text(
              "Tests: ${_country.totalTests}",
            ),
            subtitle: Text(
              "Tests per one million: ${_country.testsPerOneMillion}",
            ),
          ),
        ),
      );
    }

    children.add(SizedBox(
      height: 250,
      child: StatisticsChart(
        _country.seriesList,
      ),
    ));

    print(_isContinent);
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_country.country),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.5,
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(physics: SCROLL_PHYSICS, children: children),
        ),
      ),
    );
  }
}
