import 'package:flutter/material.dart';

class SliverSearchBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverAppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey[50]
            : Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        floating: true,
        pinned: true,
        key: GlobalKey(debugLabel: "sliver_search_bar"),
        iconTheme: Theme.of(context).iconTheme,
        leading: Icon(Icons.search),
        actions: [Icon(Icons.sort)],
        title: Container(
          height: 16,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
