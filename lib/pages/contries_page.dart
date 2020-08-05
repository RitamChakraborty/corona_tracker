import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/country_tile.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
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

    return Material(
      child: SafeArea(
        child: countries == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : FloatingSearchBar.builder(
                leading: Icon(Icons.search),
                trailing: IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: null,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration:
                    InputDecoration.collapsed(hintText: "Search country"),
                itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  Country country = countries[index];
                  return CountryTile(country: country, index: index);
                },
              ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
