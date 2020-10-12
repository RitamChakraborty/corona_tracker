import 'package:coronatracker/widgets/text_demo.dart';
import 'package:flutter/material.dart';

class SliverSearchBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverAppBar(
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        floating: true,
        pinned: true,
        key: GlobalKey(debugLabel: "sliver_search_bar"),
        iconTheme: Theme.of(context).iconTheme,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: null,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: null,
          ),
        ],
        title: TextDemo(
          height: 18,
          width: 120.0,
        ),
      ),
    );
  }
}
