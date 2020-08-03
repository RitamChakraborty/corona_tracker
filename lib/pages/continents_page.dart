import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinentsPage extends StatefulWidget {
  @override
  _ContinentsPageState createState() => _ContinentsPageState();
}

class _ContinentsPageState extends State<ContinentsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    List<Continent> continents = serviceProvider.continents;

    return Scaffold(
      appBar: AppBar(
        title: Text("Continents"),
      ),
      body: continents == null ?
          Center(
            child: CircularProgressIndicator(),
          ) : ListView.builder(
        itemCount: continents.length,
        itemBuilder: (BuildContext context, int index) {
          Continent continent = continents[index];

          return ListTile(
            title: Text(continent.continent),
          );
        },
      )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
