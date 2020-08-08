import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ServiceProvider>.value(
          value: ServiceProvider(),
        ),
        ChangeNotifierProvider<ValueNotifier<bool>>.value(
          value: ValueNotifier<bool>(false),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "Corona Tracker",
//      darkTheme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}
