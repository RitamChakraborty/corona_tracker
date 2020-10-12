import 'package:coronatracker/bloc/country_search_bloc.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocProvider.value(
        value: CountrySearchBloc(CountrySearchInitialState()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Corona Tracker",
          theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.purple,
              accentColor: Colors.grey,
              dividerColor: Colors.grey.shade300),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.purple.shade50,
              accentColor: Colors.grey,
              buttonColor: Colors.purple,
              bottomAppBarColor: Colors.blueGrey.shade900,
              dividerColor: Colors.grey.shade600),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
