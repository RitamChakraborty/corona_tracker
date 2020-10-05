import 'package:coronatracker/pages/continents_page.dart';
import 'package:coronatracker/pages/contries_page.dart';
import 'package:coronatracker/pages/global_page.dart';
import 'package:coronatracker/pages/safety_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  final PageController pageController = PageController();
  TabController tabController;
  final List<Widget> pages = [
    GlobalPage(),
    ContinentsPage(),
    CountriesPage(),
    SafetyPage(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: pages.length);
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> provider = Provider.of<ValueNotifier<bool>>(context);

    Widget gNav = AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: provider.value
          ? Container()
          : Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(left: 32.0),
              child: Material(
                color: Theme.of(context).bottomAppBarColor,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: GNav(
                      gap: 4,
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                      duration: Duration(milliseconds: 500),
                      activeColor: Theme.of(context).primaryColor,
                      tabBackgroundColor: Theme.of(context).buttonColor,
                      color: Theme.of(context).accentColor,
                      backgroundColor: Theme.of(context).bottomAppBarColor,
                      tabs: [
                        GButton(
                          icon: Icons.public,
                          text: "Global",
                        ),
                        GButton(
                          icon: Icons.map,
                          text: "Continents",
                        ),
                        GButton(
                          icon: Icons.flag,
                          text: "Countries",
                        ),
                        GButton(
                          icon: Icons.security,
                          text: "Safety",
                        )
                      ],
                      selectedIndex: currentIndex,
                      onTabChange: (int index) {
                        setState(() {
                          currentIndex = index;
                          tabController.index = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
    );

    return Material(
      child: Scaffold(
        floatingActionButton: gNav,
        body: TabBarView(
          controller: tabController,
          children: pages,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
