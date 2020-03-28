import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/pages/country_page.dart';
import 'package:coronatracker/widgets/loading_indicator.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Get the JSON data for global details
  /// Return data as [GlobalData] as future
  Future<GlobalData> getGlobalData() async {
    var res = await http.get(GLOBAL_DATA_URL);
    var data = json.decode(res.body);
    return GlobalData(
      cases: data['cases'],
      deaths: data['deaths'],
      recovered: data['recovered'],
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Provide the image
    var coronaImage = Container(
      margin: EdgeInsets.all(32),
      child: Image.asset(
        "assets/pictures/image.png",
      ),
    );

    /// Custom widget to show [GlobalData]
    Widget globalDataCard({GlobalData globalData}) => Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(32),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Global Outbreak"),
            ),
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("Cases"), Text("${globalData.cases}")],
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  """Deaths: ${globalData.deaths}\nRecovered: ${globalData.recovered}"""),
            ),
          ),
        );

    /// Button to go to next page
    Widget button(GlobalData globalData) {
      return Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: MaterialButton(
          elevation: 10.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryPage(globalData: globalData),
              ),
            );
          },
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: ACCENT_COLOR,
          child: Text(
            "Explore Countries",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Material(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.grey[900],
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: StreamBuilder<DataConnectionStatus>(
                stream: DataConnectionChecker().onStatusChange,
                builder: (context, snapshot) => snapshot.hasData
                    ? snapshot.data == DataConnectionStatus.connected
                        ? FutureBuilder<GlobalData>(
                            future: getGlobalData(),
                            builder: (context, snapshot) => snapshot.hasData
                                ? SingleChildScrollView(
                                    physics: SCROLL_PHYSICS,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        coronaImage,
                                        globalDataCard(
                                            globalData: snapshot.data),
                                        button(snapshot.data),
                                      ],
                                    ),
                                  )
                                : LoadingIndicator(),
                          )
                        : Text("No Internet",
                            style: TextStyle(color: Colors.red))
                    : Container()),
          ),
        ),
      ),
    );
  }
}
