import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/pages/country_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var coronaImage = Container(
      margin: EdgeInsets.all(32),
      child: Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "https://cdn.dribbble.com/users/175166/screenshots/10733893/media/471b96a919c904f59e16e3c21b1acfe5.jpg"),
      ),
    );

    Future<GlobalData> getGlobalData() async {
      var res = await http.get(GLOBAL_DATA_URL);
      var data = json.decode(res.body);
      return GlobalData(
          cases: data['cases'],
          deaths: data['deaths'],
          recovered: data['recovered']);
    }

    Widget globalDataCard({GlobalData globalData}) => Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(32),
          child: ListTile(
            title: Center(child: Text("Global Outbreak")),
            subtitle: Center(
              child: Text(
                  """Cases: ${globalData.cases}\nDeaths: ${globalData.deaths}\nRecovered: ${globalData.recovered}"""),
            ),
          ),
        );

    var button = Container(
      child: MaterialButton(
        elevation: 10.0,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryPage(),
              ));
        },
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.green,
        child: Text(
          "Explore Contry Status",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  coronaImage,
                  FutureBuilder<GlobalData>(
                    future: getGlobalData(),
                    builder: (context, snapshot) => snapshot.hasData
                        ? globalDataCard(globalData: snapshot.data)
                        : CircularProgressIndicator(),
                  ),
                  button,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
