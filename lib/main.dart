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
          debugShowCheckedModeBanner: true,
          title: "Corona Tracker",
//      darkTheme: ThemeData.dark(),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
