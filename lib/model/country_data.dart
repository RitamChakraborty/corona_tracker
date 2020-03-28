import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CountryData {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;

  CountryData(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical});

  factory CountryData.fromJson(Map<String, dynamic> data) {
    var countryData = CountryData(
        country: data['country'],
        cases: data['cases'],
        todayCases: data['todayCases'],
        deaths: data['deaths'],
        todayDeaths: data['todayDeaths'],
        recovered: data['recovered'],
        active: data['active'],
        critical: data['critical']);
    print(countryData);
    return countryData;
  }

  double get deathPercentage => deaths * 100 / cases;

  double get recoveredPercentage => recovered * 100 / cases;

  double get activePercentage => active * 100 / cases;

  double get criticalPercentage => critical * 100 / cases;

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

  @override
  String toString() {
    return country;
  }
}

class DataClass {
  final String name;
  final double value;

  DataClass(this.name, this.value);
}
