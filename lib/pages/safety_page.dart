import 'package:coronatracker/widgets/header.dart';
import 'package:flutter/material.dart';

class SafetyPage extends StatefulWidget {
  @override
  _SafetyPageState createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: Header(
              maxExtent: size.height / 3,
              minExtent: size.height / 4,
            ),
          ),
          SliverFillRemaining(
            child: Center(child: Text("Hello")),
          )
        ],
      )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
