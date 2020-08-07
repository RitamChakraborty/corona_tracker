import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/data_card.dart';
import 'package:coronatracker/widgets/data_tile.dart';
import 'package:coronatracker/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    Global global = serviceProvider.global;
    Widget arrowIcon = Icon(Icons.expand_more);
    List<Widget> children = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DataCard(
              label: "Total Cases",
              value: global.cases.toString(),
              color: Colors.purple,
            ),
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
      DataTile(
        label: "Today Cases",
        value: global.todayCases.toString(),
      ),
      DataTile(
        label: "Cases per one million",
        value: global.casesPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of cases among total population",
        value: global.totalAffectedPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Today Deaths",
        value: global.todayDeaths.toString(),
      ),
      DataTile(
        label: "Deaths per One Million",
        value: global.deathsPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of deaths among total cases",
        value: global.deathsPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Today Recovered",
        value: global.todayRecovered.toString(),
      ),
      DataTile(
        label: "Recovered per one million",
        value: global.recoveredPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of recovered people among total cases",
        value: global.recoveryPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Active cases per one million",
        value: global.activePerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of active cases among total cases",
        value: global.activeCasesPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Critical cases per one million",
        value: global.criticalPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of critical cases among total active cases",
        value: global.criticalCasesPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Total tests done",
        value: global.tests.toString(),
      ),
      DataTile(
        label: "Test per one million",
        value: global.testsPerOneMillion.toStringAsFixed(2),
      ),
      DataTile(
        label: "Percentage of people tested among total population",
        value: global.testsPercentage.toStringAsFixed(2) + "%",
      ),
      DataTile(
        label: "Total affected countries",
        value: global.affectedCountries.toString(),
      ),
    ];

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: Header(
            maxExtent: size.height / 3,
            minExtent: size.height / 4,
            imagePath: "assets/svgs/doctor_2.svg",
            headerMessage: "Stay Home,\nStay Safe!",
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            children
          )
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
