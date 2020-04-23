import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/helper/helper.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/pages/country_details.dart';
import 'package:coronatracker/provider/data_provider.dart';
import 'package:coronatracker/servies/http_services.dart';
import 'package:coronatracker/widgets/data_connection_checker_widget.dart';
import 'package:coronatracker/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryPage extends StatefulWidget {
  final GlobalData _globalData;

  const CountryPage({@required GlobalData globalData})
      : this._globalData = globalData,
        assert(globalData != null);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final HttpServices httpServices = HttpServices();
  final TextEditingController controller = TextEditingController();
  String filter = "";
  bool enabled = false;
  SortingType sortingType = SortingType.CASES;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    /// Initializing [DataProvider]
    final DataProvider dataProvider =
        Provider.of<DataProvider>(context, listen: false);

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
          value: SortingType.DEATHS,
          child: Text('Deaths'),
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
    Widget countryCard({CountryData data, int index, bool isContinent}) =>
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
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
            subtitle: Text("Cases: ${data.cases}"
                "\nDeaths: ${data.deaths}"
                "\nActive: ${data.active}"
                "\nCritical: ${data.critical}"
                "\nRecovered: ${data.recovered}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetails(
                    globalData: widget._globalData,
                    country: data,
                    isContinent: isContinent,
                  ),
                ),
              );
            },
          ),
        );

    /// [BackButton] for the [Scaffold]
    Widget backButton = Container(
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          if (enabled) {
            setState(() {
              enabled = false;
            });
          } else {
            Navigator.pop(context);
          }
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

        return DataConnectionCheckerWidget(
          child: Scaffold(
            bottomNavigationBar: bottomNavigationBar,
            body: Container(
              margin: height < width
                  ? EdgeInsets.symmetric(horizontal: (width - height) / 2)
                  : EdgeInsets.all(0),
              child: Scaffold(
                appBar: AppBar(
                  title: enabled ? textField : Text("Details"),
                  centerTitle: true,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0.5,
                  leading: backButton,
                  actions: <Widget>[
                    iconButton,
                    popupMenuButton,
                  ],
                ),
                body: SafeArea(
                  child: Container(
                    alignment: Alignment.center,
//                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Consumer(
                      builder: (BuildContext context, DataProvider dataProvider,
                          Widget child) {
                        List<CountryData> list = dataProvider.countryDataList;

                        if (list.isEmpty) {
                          return LoadingIndicator();
                        } else {
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
                                    isContinent: list.length < 7);
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
                                return Divider(
                                  indent: 16,
                                  endIndent: 16,
                                );
                              } else {
                                return Container();
                              }
                            },
                          );
                        }
                      },
                    ),
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
