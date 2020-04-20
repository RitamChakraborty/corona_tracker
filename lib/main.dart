import 'package:coronatracker/pages/home_page.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Add a [StreamProvider] to listen to [DataConnectionStatus] changes
    return StreamProvider.value(
      value: DataConnectionChecker().onStatusChange,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Corona Tracker",
        theme: ThemeData(primaryColor: Colors.white),
        darkTheme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
