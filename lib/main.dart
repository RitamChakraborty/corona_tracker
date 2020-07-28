import 'package:coronatracker/pages/home_page.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ServiceProvider>.value(
      value: ServiceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "Corona Tracker",
//      darkTheme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}
