import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatelessWidget {
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FutureBuilder<List<CountryData>>(
            future: getCountryData(),
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return countryCard(data: snapshot.data[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: snapshot.data.length,
                  )
                : CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
