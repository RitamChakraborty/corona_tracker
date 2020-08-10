import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/widgets/data_card.dart';
import 'package:coronatracker/widgets/data_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContinentPage extends StatelessWidget {
  final Continent _continent;
  final int _index;

  const ContinentPage({@required Continent continent, @required int index})
      : this._continent = continent,
        this._index = index,
        assert(continent != null),
        assert(index != null);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DataCard(
              label: "Total Cases",
              value: _continent.cases.toString(),
              color: Colors.purple,
            ),
            DataCard(
              label: "Deaths",
              value: _continent.deaths.toString(),
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
              value: _continent.active.toString(),
              color: Colors.deepOrangeAccent,
            ),
            DataCard(
              label: "Critical",
              value: _continent.critical.toString(),
              color: Colors.grey,
            ),
            DataCard(
              label: "Recovered",
              value: _continent.recovered.toString(),
              color: Colors.green,
            ),
          ],
        ),
      ),
      DataTile(
        label: "Today Cases",
        value: _continent.todayCases.toString(),
      ),
      DataTile(
        label: "Cases per one million",
        value: _continent.casesPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of cases among total population",
        value: _continent.totalAffectedPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Today Deaths",
        value: _continent.todayDeaths.toString(),
      ),
      DataTile(
        label: "Deaths per One Million",
        value: _continent.deathsPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of deaths among total cases",
        value: _continent.deathsPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Today Recovered",
        value: _continent.todayRecovered.toString(),
      ),
      DataTile(
        label: "Recovered per one million",
        value: _continent.recoveredPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of recovered people among total cases",
        value: _continent.recoveryPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Active cases per one million",
        value: _continent.activePerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of active cases among total cases",
        value: _continent.activeCasesPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Critical cases per one million",
        value: _continent.criticalPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of critical cases among total active cases",
        value: _continent.criticalCasesPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Total tests done",
        value: _continent.tests.toString(),
      ),
      DataTile(
        label: "Test per one million",
        value: _continent.testsPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of people tested among total population",
        value: _continent.testsPercentage.toStringAsFixed(2) + "%",
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[50]
              : Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text("Affected countries"),
                children: _continent.countries
                    .map((e) => ListTile(
                          title: Text("$e"),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      )
    ];
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              "${_continent.continent}",
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[800]
                    : Colors.grey[50],
              ),
            ),
            leading: BackButton(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[800]
                  : Colors.grey[50],
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              children,
            ),
          ),
        ],
      ),
    );
  }
}
