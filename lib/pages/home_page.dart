import 'dart:wasm';

import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:coronatracker/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: true,
            delegate: Header(
              maxExtent: size.height / 3,
              minExtent: size.height / 4,
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text('body'),
            ),
          )
        ],
      ),
    );
  }
}
