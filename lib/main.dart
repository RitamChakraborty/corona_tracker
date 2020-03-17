import 'package:coronatracker/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Corona Tracker",
      theme: ThemeData(primaryColor: Colors.white),
//      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
