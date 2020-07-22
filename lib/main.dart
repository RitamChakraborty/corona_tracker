import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Add a [StreamProvider] to listen to [DataConnectionStatus] changes
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Corona Tracker",
      home: Material(),
    );
  }
}
