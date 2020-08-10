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

    return Scaffold(
      body: SafeArea(
      child: CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        SliverPadding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          sliver: SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            floating: true,
            pinned: true,
            flexibleSpace: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 75.0,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: TextField(
                  decoration:
                  InputDecoration.collapsed(hintText: "Search country"),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              Continent continent = continents[index];
              return ContinentTile(
                continent: continent,
                index: index,
              );
            },
            childCount: continents.length,
          ),
        )
      ],
    ),
  }

  @override
  bool get wantKeepAlive => true;
}
