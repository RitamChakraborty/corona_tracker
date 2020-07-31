import 'package:coronatracker/pages/continents_page.dart';
import 'package:coronatracker/pages/contries_page.dart';
import 'package:coronatracker/pages/global_page.dart';
import 'package:coronatracker/pages/safety_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController pageController = PageController();
  final List<Widget> pages = [
    GlobalPage(),
    ContinentsPage(),
    CountriesPage(),
    SafetyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              pageController.jumpToPage(index);
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.public),
              title: Text("Global"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text("Continents"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.outlined_flag),
              title: Text("Countries"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.security),
              title: Text("Safety"),
            ),
          ],
        ),
        body: PageView(
          children: pages,
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            currentIndex = index;
          },
        ),
      ),
    );
  }
}
