import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:coronatracker/widgets/data_card.dart';
import 'package:coronatracker/widgets/data_tile.dart';
import 'package:coronatracker/widgets/hero_flag.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  final Country _country;
  final int _index;

  const CountryPage({@required Country country, @required int index})
      : this._country = country,
        this._index = index,
        assert(country != null),
        assert(index != null);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> children = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DataCard(
              label: "Total Cases",
              value: _country.cases.toString(),
              color: Colors.purple,
            ),
            DataCard(
              label: "Deaths",
              value: _country.deaths.toString(),
              color: Colors.pink,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DataCard(
              label: "Active",
              value: _country.active.toString(),
              color: Colors.deepOrangeAccent,
            ),
            DataCard(
              label: "Critical",
              value: _country.critical.toString(),
              color: Colors.grey,
            ),
            DataCard(
              label: "Recovered",
              value: _country.recovered.toString(),
              color: Colors.green,
            ),
          ],
        ),
      ),
      DataTile(
        label: "Today Cases",
        value: _country.todayCases.toString(),
      ),
      DataTile(
        label: "Cases per one million",
        value: _country.casesPerOneMillion.toStringAsFixed(2),
      ),
//      DataTile(
//        label: "Percentage of cases among total population",
//        value: _country.totalAffectedPercentage.toStringAsFixed(2) + "%",
//      ),
      DataTile(
        label: "Today Deaths",
        value: _country.todayDeaths.toString(),
      ),
      DataTile(
        label: "Deaths per One Million",
        value: _country.deathsPerOneMillion.toStringAsFixed(2),
      ),
//      DataTile(
//        label: "Percentage of deaths among total cases",
//        value: _country.deathsPercentage.toStringAsFixed(2) + "%",
//      ),
      DataTile(
        label: "Today Recovered",
        value: _country.todayRecovered.toString(),
      ),
      DataTile(
        label: "Recovered per one million",
        value: _country.recoveredPerOneMillion.toStringAsFixed(2),
      ),
//      DataTile(
//        label: "Percentage of recovered people among total cases",
//        value: _country.recoveryPercentage.toStringAsFixed(2) + "%",
//      ),
      DataTile(
        label: "Active cases per one million",
        value: _country.activePerOneMillion.toStringAsFixed(2),
      ),
//      DataTile(
//        label: "Percentage of active cases among total cases",
//        value: _country.activeCasesPercentage.toStringAsFixed(2) + "%",
//      ),
      DataTile(
        label: "Critical cases per one million",
        value: _country.criticalPerOneMillion.toStringAsFixed(2),
      ),
//      DataTile(
//        label: "Percentage of critical cases among total active cases",
//        value: _country.criticalCasesPercentage.toStringAsFixed(2) + "%",
//      ),
      DataTile(
        label: "Total tests done",
        value: _country.tests.toString(),
      ),
      DataTile(
        label: "Test per one million",
        value: _country.testsPerOneMillion.toStringAsFixed(2),
      ),
//      DataTile(
//        label: "Percentage of people tested among total population",
//        value: _country.testsPercentage.toStringAsFixed(2) + "%",
//      ),
//      DataTile(
//        label: "Total affected countries",
//        value: _country.affectedCountries.toString(),
//      ),
    ];

    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: size.height / 4,
            flexibleSpace: ClipPath(
              clipper: BezierClipper(),
              child: FlexibleSpaceBar(
                centerTitle: true,
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    HeroFlag(
                      country: _country,
                    ),
                    SizedBox.expand(
                      child: Container(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 64.0),
                  child: Text("${_country.country}"),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              children,
            ),
          )
        ],
      ),
    );
  }
}
