import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/continent_tile.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    ValueNotifier<bool> provider = Provider.of<ValueNotifier<bool>>(context);
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        provider.value = false;
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        provider.value = true;
      }
    });
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search country",
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.only(top: 14.0),
                        icon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.sort),
                          onPressed: () {

                          },
                        ),
                      ),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
