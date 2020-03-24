import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  var controller = TextEditingController();
  var filter = "";
  var enabled = false;

  @override
  Widget build(BuildContext context) {
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

      return list;
    }

    Widget countryCard({CountryData data}) => Container(
          child: ListTile(
            title: Text("${data.country}"),
            subtitle:
                Text("""Cases: ${data.cases} | Today Cases: ${data.todayCases}
Deaths: ${data.deaths} | Today Deaths: ${data.todayDeaths}
Active: ${data.active} | Critical: ${data.critical}
Recovered: ${data.recovered}"""),
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
                  )
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
                                    ? countryCard(data: snapshot.data[index])
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
