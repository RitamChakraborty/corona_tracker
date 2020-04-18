import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

/// Model for the `API`
///
/// [country] name of the country
/// [cases] number of `COVID-19` cases
/// [todayCases] number of `COVID-19` cases on that day
/// [deaths] number of deaths
/// [todayDeaths] number of deaths on that day
/// [recovered] number of people recovered
/// [active] number of active cases
/// [critical] number of people who are still in critical condition
/// [casesPerOneMillion] number of people affected in one million
/// [deathsPerOneMillion] number of people died per million
/// [totalTests] number of people has be tested for `COVID-19`
/// [testsPerOneMillion] number of people tested per million
class CountryData {
  final String country;
  final int cases;
  final int todayCases;
  final int casesPerOneMillion;
  final int deaths;
  final int todayDeaths;
  final int deathsPerOneMillion;
  final int recovered;
  final int active;
  final int critical;
  final int totalTests;
  final int testsPerOneMillion;

  CountryData(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.totalTests,
      this.testsPerOneMillion});

  /// Return percentage of people died among total number of cases
  double get deathPercentage => deaths * 100 / cases;

  /// Return percentage of people recovered among total number of cases
  double get recoveredPercentage => recovered * 100 / cases;

  /// Return percentage of active cases among total number of cases
  double get activePercentage => active * 100 / cases;

  /// Return percentage of people in critical conditions among total active cases
  double get criticalPercentage => critical * 100 / active;

  List<charts.Series<DataClass, String>> get seriesList => [
        charts.Series<DataClass, String>(
          id: 'Chart',
          domainFn: (dataClass, _) => dataClass.name,
          measureFn: (dataClass, _) => dataClass.value,
          data: [
            DataClass("Deaths", deathPercentage),
            DataClass("Recovered", recoveredPercentage),
            DataClass("Active", activePercentage),
            DataClass("Critical", criticalPercentage),
          ],
          labelAccessorFn: (dataClass, _) =>
              "${dataClass.name}\n ${dataClass.value.toStringAsFixed(2)} %",
          colorFn: (dataClass, i) =>
              charts.ColorUtil.fromDartColor(Colors.green[(i + 1) * 2 * 100]),
        ),
      ];
}

/// A model for the `flutter charts`
///
/// [name] name of the bar in the chart
/// [value] value of the bar in the chart
class DataClass {
  final String name;
  final double value;

  DataClass(this.name, this.value);
}
