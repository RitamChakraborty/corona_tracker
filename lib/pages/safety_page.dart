import 'package:coronatracker/services/symptoms_card.dart';
import 'package:coronatracker/widgets/emergency.dart';
import 'package:coronatracker/widgets/header.dart';
import 'package:coronatracker/widgets/prevention_card.dart';
import 'package:coronatracker/widgets/prevention_card_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class SafetyPage extends StatefulWidget {
  @override
  _SafetyPageState createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              SymptomsCard(
                text: "Headache",
                imagePath: 'assets/images/headache.png',
              ),
              SymptomsCard(
                text: "Body Ache",
                imagePath: 'assets/images/bodyache.png',
              ),
              SymptomsCard(
                text: "Cough",
                imagePath: 'assets/images/cough.png',
              ),
              SymptomsCard(
                text: "Fever",
                imagePath: 'assets/images/fever.png',
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
        child: Text(
          "Preventions",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      PreventionCard(
        imagePath: "assets/images/wash_hands.png",
        headerText: "Wash Your Hands",
        text: "Wash your hands as many times as possible. " +
            "Always use hand wash or soap or alcohol based hand sanitiser.",
      ),
      PreventionCard(
        imagePath: "assets/images/wear_mask.png",
        headerText: "Wear Face Mask",
        text: "Face masks prevent the spread of the virus. " +
            "Make sure you ware the mask correctly and it totally covers your face.",
      ),
      PreventionCard(
        imagePath: "assets/images/cover_cough.png",
        headerText: "Cover Cough",
        text: "Cover you mouth and nose when you're about to sneeze. " +
            "Use handkerchief or your arms.",
      ),
      PreventionCard1(
        imagePath: "assets/images/social_distance.png",
        headerText: "Physical Distancing",
        text: "Keep at least 1 meter distance from an unknown person. " +
            "Avoid going to crowded places.",
      ),
      PreventionCard1(
        imagePath: "assets/images/sanitize.png",
        headerText: "Sanitize House",
        text: "Keep your house clean. " + "Sanitize places frequently touched.",
      ),
      PreventionCard1(
        imagePath: "assets/images/person.png",
        headerText: "Ask for Help",
        text: "If you feel sick, don't hesitated to ask for help. " +
            "Go to a clinic and get medical advise.",
      ),
      SizedBox(
        height: 16,
      ),
      Emergency(),
    ];

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: Header(
              maxExtent: size.height / 3,
              minExtent: size.height / 4,
              imagePath: "assets/svgs/doctor_1.svg",
              headerMessage: "Feeling sick?\nGet tested!",
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(children),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
