import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/pages/country_details.dart';
import 'package:coronatracker/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Store the types of sorting
enum SortingType {
  CASES,
  TODAY_CASES,
  DEATHS,
  TODAY_DEATHS,
  ACTIVE,
  CRITICAL,
  RECOVERED,
  NAME
}

class CountryPage extends StatefulWidget {
  final GlobalData _globalData;

  const CountryPage({@required GlobalData globalData})
      : this._globalData = globalData,
        assert(globalData != null);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final TextEditingController controller = TextEditingController();
  String filter = "";
  bool enabled = false;
  SortingType sortingType = SortingType.CASES;
  int currentPage = 0;

  /// Get the list of details of all countries as future
  Future<List<CountryData>> getCountryData() async {
    List<CountryData> list = [];
    var res = await http.get(COUNTRY_DATA_URL);
    var map = json.decode(res.body);

    for (var data in map) {
      String country = data['country'];

      if (country != 'Total:') {
        list.add(CountryData(
            country: data['country'],
            cases: data['cases'],
            todayCases: data['todayCases'],
            deaths: data['deaths'],
            todayDeaths: data['todayDeaths'],
            recovered: data['recovered'],
            active: data['active'],
            critical: data['critical']));
      }
    }

    /// Removing continents
    return list;
  }

  /// Sort the country list accordingly
  List<CountryData> sortList(List<CountryData> list, SortingType type) {
    switch (type) {
      case SortingType.CASES:
        list.sort((a, b) => b.cases.compareTo(a.cases));
        break;
      case SortingType.TODAY_CASES:
        list.sort((a, b) => b.todayCases.compareTo(a.todayCases));
        break;
      case SortingType.DEATHS:
        list.sort((a, b) => b.deaths.compareTo(a.deaths));
        break;
      case SortingType.TODAY_DEATHS:
        list.sort((a, b) => b.todayDeaths.compareTo(a.todayDeaths));
        break;
      case SortingType.ACTIVE:
        list.sort((a, b) => b.active.compareTo(a.active));
        break;
      case SortingType.CRITICAL:
        list.sort((a, b) => b.critical.compareTo(a.critical));
        break;
      case SortingType.RECOVERED:
        list.sort((a, b) => b.recovered.compareTo(a.recovered));
        break;
      case SortingType.NAME:
        list.sort((a, b) => a.country.compareTo(b.country));
        break;
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    /// Show the menu button for sorting the list
    var popupMenuButton = PopupMenuButton<SortingType>(
      enabled: !enabled,
      icon: Icon(Icons.sort),
      onSelected: (SortingType result) {
        setState(() {
          sortingType = result;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SortingType>>[
        const PopupMenuItem<SortingType>(
          value: SortingType.CASES,
          child: Text('Cases'),
        ),
        const PopupMenuItem<SortingType>(
          value: SortingType.TODAY_CASES,
          child: Text('Today Cases'),
        ),
        const PopupMenuItem<SortingType>(
          value: SortingType.DEATHS,
          child: Text('Deaths'),
        ),
        const PopupMenuItem<SortingType>(
          value: SortingType.TODAY_DEATHS,
          child: Text('Today Deaths'),
        ),
        const PopupMenuItem<SortingType>(
          value: SortingType.ACTIVE,
          child: Text('Active'),
        ),
        const PopupMenuItem<SortingType>(
          value: SortingType.CRITICAL,
          child: Text('Critical'),
        ),
        const PopupMenuItem<SortingType>(
          value: SortingType.RECOVERED,
          child: Text('Recoverd'),
        ),
        const PopupMenuItem<SortingType>(
          value: SortingType.NAME,
          child: Text('Name'),
        ),
      ],
    );

    /// Widget to show the country details
    /// When pressed, navigate to [CountryDetails] page
    Widget countryCard({CountryData data, int index}) => Container(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("${data.country}", style: TextStyle(fontSize: 24)),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  index != null ? (index + 1).toString() : "",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            subtitle: Text(
                """Cases: ${data.cases} | Today Cases: ${data.todayCases}\nDeaths: ${data.deaths} | Today Deaths: ${data.todayDeaths}\nActive: ${data.active} | Critical: ${data.critical}\nRecovered: ${data.recovered}"""),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetails(
                    globalData: widget._globalData,
                    country: data,
                  ),
                ),
              );
            },
          ),
        );

    /// [TextField] to search for a country
    var textField = Container(
      padding: EdgeInsets.all(8),
      child: TextField(
        enabled: enabled,
        autofocus: enabled,
        controller: controller,
        cursorColor: Colors.grey,
        onTap: () {
          setState(() {
            enabled = true;
          });
        },
        onChanged: (string) {
          setState(() {
            filter = string.toLowerCase();
          });
        },
        onSubmitted: (string) {
          setState(() {
            filter = string.toLowerCase();
          });
        },
        decoration: InputDecoration(
          hoverColor: Colors.transparent,
          fillColor: Colors.transparent,
          focusColor: Colors.transparent,
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "Search country...",
        ),
      ),
    );

    /// Returns different icon when shearing
    var iconButton = IconButton(
      icon: Icon(enabled ? Icons.cancel : Icons.search),
      onPressed: () {
        setState(() {
          if (enabled) {
            enabled = false;
            filter = "";
            controller.text = "";
          } else {
            enabled = true;
          }
        });
      },
    );

    /// Return the bottom nav bar for the [Scaffold]
    final Widget bottomNavigationBar = BottomNavigationBar(
      /// Change the value of the current page index
      /// When tapped
      onTap: (int value) {
        setState(() {
          currentPage = value;
        });
      },
      elevation: 5,
      currentIndex: currentPage,
      iconSize: 0,
      selectedFontSize: 18,
      selectedItemColor: Theme.of(context).textTheme.title.color,
      unselectedFontSize: 16,
      unselectedItemColor: Theme.of(context).disabledColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map,
          ),
          title: Text("Continents"),
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            title: Text("Countries")),
      ],
    );

    return LayoutBuilder(
      builder: (context, constrains) {
        var height = constrains.maxHeight;
        var width = constrains.maxWidth;

        return Scaffold(
          bottomNavigationBar: bottomNavigationBar,
          body: Container(
            margin: height < width
                ? EdgeInsets.symmetric(horizontal: (width - height) / 2)
                : EdgeInsets.all(0),
            child: Scaffold(
              appBar: AppBar(
                title: enabled ? textField : Text("Details"),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: BackButton(),
                actions: <Widget>[
                  iconButton,
                  popupMenuButton,
                ],
              ),
              body: SafeArea(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: FutureBuilder<List<CountryData>>(
                    future: getCountryData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<CountryData> list = snapshot.data;

                        if (currentPage == 0) {
                          list = list.sublist(0, 6);
                        } else if (currentPage == 1) {
                          list = list.sublist(8);
                        } else {}

                        list = sortList(list, sortingType);

                        return ListView.separated(
                          itemCount: list.length,
                          physics: SCROLL_PHYSICS,

                          /// Return the [countryCard]
                          itemBuilder: (context, index) {
                            if (filter == "") {
                              /// If filter is not enabled
                              return countryCard(
                                data: list[index],
                                index: index,
                              );
                            } else if (list[index]
                                .country
                                .toLowerCase()
                                .contains(filter)) {
                              /// If country name contains a part of filter text
                              return countryCard(data: list[index]);
                            } else {
                              /// Otherwise
                              return Container();
                            }
                          },

                          /// Return the [Divider]
                          separatorBuilder: (context, index) {
                            if (filter == "" ||
                                list[index]
                                    .country
                                    .toLowerCase()
                                    .contains(filter)) {
                              /// If filter is empty or
                              /// Country name contains a part of filter
                              return Divider();
                            } else {
                              return Container();
                            }
                          },
                        );
                      }
                      return LoadingIndicator();
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
