import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/continent_tile.dart';
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
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

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

    if (continents == null) {
      refreshIndicatorKey.currentState?.show();
      return RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: serviceProvider.fetchContinents,
        child: ListView(
          children: [
            ListTile(
              title: Text("Fetching continents"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          key: refreshIndicatorKey,
          onRefresh: serviceProvider.fetchContinents,
          child: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            slivers: <Widget>[
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
