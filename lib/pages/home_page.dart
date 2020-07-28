import 'dart:wasm';

import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:coronatracker/widgets/data_card.dart';
import 'package:coronatracker/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    Global global = serviceProvider.global;

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
                        value: global.cases.toString(),
                        color: Colors.purple),
                    DataCard(
                      label: "Deaths",
                      value: global.deaths.toString(),
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
                      value: global.active.toString(),
                      color: Colors.deepOrangeAccent,
                    ),
                    DataCard(
                      label: "Critical",
                      value: global.critical.toString(),
                      color: Colors.grey,
                    ),
                    DataCard(
                      label: "Recovered",
                      value: global.recovered.toString(),
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
