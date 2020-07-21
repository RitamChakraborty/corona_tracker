  import 'package:coronatracker/pages/home_page.dart';
import 'package:coronatracker/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Add a [StreamProvider] to listen to [DataConnectionStatus] changes
    return ChangeNotifierProvider<DataProvider>.value(
      value: DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Corona Tracker",

        /// Light theme
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.greenAccent,
        ),

        /// Dark theme
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: HomePage(),
      ),
    );
  }
}
