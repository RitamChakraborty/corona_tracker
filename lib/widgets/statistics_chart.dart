import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StatisticsChart extends StatelessWidget {
  final List<charts.Series> seriesList;

  StatisticsChart(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: true,
      animationDuration: Duration(seconds: 1),
      behaviors: [new charts.DatumLegend()],
    );
  }
}
