import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/continent_tile.dart';
import 'package:coronatracker/widgets/tile_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
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
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    List<Continent> continents = serviceProvider.continents;
    List<Widget> demoContinents = [];
    int contientsCount = 6;

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

    if (continents == null) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        refreshIndicatorKey.currentState?.show();
      });

      demoContinents = List<Widget>.generate(
          contientsCount,
          (index) => TileDemo(
                index: index,
              )).toList();
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
                    if (continents == null) {
                      return demoContinents[index];
                    } else {
                      Continent continent = continents[index];
                      return ContinentTile(
                        continent: continent,
                        index: index,
                      );
                    }
                  },
                  childCount: contientsCount,
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
