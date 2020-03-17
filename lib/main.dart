import 'package:coronatracker/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Corona Tracker",
      theme: ThemeData(primaryColor: Colors.white, buttonColor: Colors.green),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
