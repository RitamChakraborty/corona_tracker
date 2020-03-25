import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/pages/country_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  var controller = TextEditingController();
  var filter = "";
  var enabled = false;

  SortingType _sortingType = SortingType.CASES;

  @override
  Widget build(BuildContext context) {
    var popupMenuButton = PopupMenuButton<SortingType>(
      enabled: !enabled,
      icon: Icon(Icons.sort),
      onSelected: (SortingType result) {
        setState(() {
          _sortingType = result;
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

    Future<List<CountryData>> getCountryData() async {
      List<CountryData> list = [];
      var res = await http.get(COUNTRY_DATA_URL);
      var map = json.decode(res.body);

      for (var data in map) {
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

      switch (_sortingType) {
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
            subtitle:
                Text("""Cases: ${data.cases} | Today Cases: ${data.todayCases}
Deaths: ${data.deaths} | Today Deaths: ${data.todayDeaths}
Active: ${data.active} | Critical: ${data.critical}
Recovered: ${data.recovered}"""),
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

    var backButton = BackButton();

    return LayoutBuilder(
      builder: (context, constrains) {
        var height = constrains.maxHeight;
        var width = constrains.maxWidth;

        return Scaffold(
          body: Container(
            margin: height < width
                ? EdgeInsets.symmetric(horizontal: (width - height) / 2)
                : EdgeInsets.all(0),
            child: Scaffold(
              appBar: AppBar(
                title: enabled ? textField : Text("Country Details"),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: backButton,
                actions: <Widget>[
                  IconButton(
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
                  ),
//                  !enabled ? popupMenuButton : Container(),
                  popupMenuButton,
                ],
              ),
              body: SafeArea(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {});
                    },
                    child: FutureBuilder<List<CountryData>>(
                      future: getCountryData(),
                      builder: (context, snapshot) => snapshot.hasData
                          ? ListView.separated(
                              itemBuilder: (context, index) {
                                return filter == ""
                                    ? countryCard(
                                        data: snapshot.data[index],
                                        index: index)
                                    : snapshot.data[index]
                                            .toString()
                                            .toLowerCase()
                                            .contains(filter)
                                        ? countryCard(
                                            data: snapshot.data[index])
                                        : Container();
                              },
                              separatorBuilder: (context, index) {
                                return filter == ""
                                    ? Divider()
                                    : snapshot.data[index]
                                            .toString()
                                            .toLowerCase()
                                            .contains(filter)
                                        ? Divider()
                                        : Container();
                              },
                              itemCount: snapshot.data.length,
                            )
                          : CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.grey),
                            ),
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
