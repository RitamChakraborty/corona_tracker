import 'package:coronatracker/services/symptoms_card.dart';
import 'package:coronatracker/widgets/header.dart';
import 'package:flutter/cupertino.dart';
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
    List<Widget> children = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
        child: Text(
          "Symptoms",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: SymptomsCard(
                text: "Headache",
                imagePath: 'assets/images/headache.png',
              ),
            ),
            Flexible(
              flex: 1,
              child: SymptomsCard(
                text: "Cough",
                imagePath: 'assets/images/caugh.png',
              ),
            ),
            Flexible(
              flex: 1,
              child: SymptomsCard(
                text: "Fever",
                imagePath: 'assets/images/fever.png',
              ),
            ),
          ],
        ),
      )
    ];

    return Material(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: Header(
            maxExtent: size.height / 3,
            minExtent: size.height / 4,
            imagePath: "assets/svgs/doctor_1.svg",
            headerMessage: "If you feel sick,\nGet yourself tested!",
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(children),
        )
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
