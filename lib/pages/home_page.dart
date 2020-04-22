import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/pages/country_page.dart';
import 'package:coronatracker/provider/data_provider.dart';
import 'package:coronatracker/servies/http_services.dart';
import 'package:coronatracker/widgets/data_connection_checker_widget.dart';
import 'package:coronatracker/widgets/loading_indicator.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final HttpServices _httpServices = HttpServices();

  @override
  Widget build(BuildContext context) {
    /// Getting [DataConnectionStatus] from [Provider]
    final DataConnectionStatus dataConnectionStatus =
        Provider.of<DataConnectionStatus>(context);

    /// Getting [GlobalData] from [DataProvider]
    final DataProvider dataProvider =
        Provider.of<DataProvider>(context, listen: false);

    /// Provide the image
    var coronaImage = Container(
      margin: EdgeInsets.all(50),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          colors: [
            Colors.greenAccent,
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: DataConnectionCheckerWidget(
              child: Consumer(
                builder: (BuildContext context, DataProvider dataProvider,
                    Widget child) {
                  GlobalData globalData = dataProvider.globalData;

                  if (globalData == null) {
                    return LoadingIndicator();
                  } else {
                    return SingleChildScrollView(
                      physics: SCROLL_PHYSICS,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          coronaImage,
                          globalDataCard(globalData: globalData),
                          button(globalData),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
