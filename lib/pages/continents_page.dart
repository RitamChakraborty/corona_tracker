import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/continent_tile.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinentsPage extends StatefulWidget {
  @override
  _ContinentsPageState createState() => _ContinentsPageState();
}

class _ContinentsPageState extends State<ContinentsPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    List<Continent> continents = serviceProvider.continents;

    return Material(
      child: SafeArea(
        child: continents == null
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
                itemCount: continents.length,
                itemBuilder: (BuildContext context, int index) {
                  Continent continent = continents[index];
                  return ContinentTile(
                    continent: continent,
                    index: index + 1,
                  );
                },
              ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
