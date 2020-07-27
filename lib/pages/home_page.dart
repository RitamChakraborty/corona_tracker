import 'dart:wasm';

import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:coronatracker/widgets/data_card.dart';
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
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DataCard(
                        label: "Total Cases",
                        value: 10000000.toString(),
                        color: Colors.purple),
                    DataCard(
                      label: "Deaths",
                      value: 1000000.toString(),
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DataCard(
                      label: "Active",
                      value: 10000000.toString(),
                      color: Colors.deepOrangeAccent,
                    ),
                    DataCard(
                      label: "Critical",
                      value: 1000000.toString(),
                      color: Colors.grey,
                    ),
                    DataCard(
                      label: "Recovered",
                      value: 1000000.toString(),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
