import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/data_card.dart';
import 'package:coronatracker/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget arrowIcon = Icon(Icons.expand_more);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    Global global = serviceProvider.global;

    Widget tile({@required String label, @required String value}) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
              child: ListTile(
                title: Text("$label"),
                trailing: Text("$value"),
              ),
            ),
          ),
        );

    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: Header(
              maxExtent: size.height / 3,
              minExtent: size.height / 4,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DataCard(
                        label: "Total Cases",
                        value: global.cases.toString(),
                        color: Colors.purple),
                    DataCard(
                      label: "Deaths",
                      value: global.deaths.toString(),
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
                      value: global.active.toString(),
                      color: Colors.deepOrangeAccent,
                    ),
                    DataCard(
                      label: "Critical",
                      value: global.critical.toString(),
                      color: Colors.grey,
                    ),
                    DataCard(
                      label: "Recovered",
                      value: global.recovered.toString(),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (bool value) {
                      setState(() {
                        if (value) {
                          arrowIcon = Icon(
                            Icons.expand_less,
                          );
                        } else {
                          arrowIcon = Icon(Icons.expand_more);
                        }
                      });
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Show More",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        AnimatedSwitcher(
                          duration: Duration(seconds: 2),
                          child: arrowIcon,
                        )
                      ],
                    ),
                    trailing: Container(
                      width: 10.0,
                    ),
                    children: <Widget>[
                      tile(
                          label: "Today Cases",
                          value: global.todayCases.toString()),
                      tile(
                          label: "Cases per one million",
                          value: global.casesPerOneMillion.toStringAsFixed(2)),
                      tile(
                          label: "Percentage of cases among total population",
                          value: global.totalAffectedPercentage.toStringAsFixed(2) + "%"),
                      tile(
                          label: "Today Deaths",
                          value: global.todayDeaths.toString()),
                      tile(
                          label: "Deaths per One Million",
                          value: global.deathsPerOneMillion.toStringAsFixed(2)),
                      tile(
                          label: "Percentage of deaths among total cases",
                          value: global.deathsPercentage.toStringAsFixed(2) + "%"),
                      tile(
                          label: "Today Recovered",
                          value: global.todayRecovered.toString()),
                      tile(
                          label: "Recovered per one million",
                          value: global.recoveredPerOneMillion.toStringAsFixed(2)),
                      tile(
                          label:
                              "Percentage of recovered people among total cases",
                          value: global.recoveryPercentage.toStringAsFixed(2) + "%"),
                      tile(
                          label: "Active cases per one million",
                          value: global.activePerOneMillion.toStringAsFixed(2)),
                      tile(
                          label: "Percentage of active cases among total cases",
                          value: global.activeCasesPercentage.toStringAsFixed(2) + "%"),
                      tile(
                          label: "Critical cases per one million",
                          value: global.criticalPerOneMillion.toStringAsFixed(2)),
                      tile(
                          label:
                              "Percentage of critical cases among total active cases",
                          value: global.criticalCasesPercentage.toStringAsFixed(2) + "%"),
                      tile(
                          label: "Total tests done",
                          value: global.tests.toString()),
                      tile(
                          label: "Test per one million",
                          value: global.testsPerOneMillion.toStringAsFixed(2)),
                      tile(
                          label:
                              "Percentage of people tested among total population",
                          value: global.testsPercentage.toStringAsFixed(2) + "%"),
                      tile(
                          label: "Total affected countries",
                          value: global.affectedCountries.toString()),
                    ],
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
