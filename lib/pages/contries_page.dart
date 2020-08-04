import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    List<Country> countries = serviceProvider.countries;

    return Scaffold(
      appBar: AppBar(
        title: Text("Countries"),
      ),
      body: countries == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
              addAutomaticKeepAlives: true,
              itemCount: countries.length,
              itemBuilder: (BuildContext context, int index) {
                Country country = countries[index];
                return CountryTile(country: country, index: index);
              },
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
