import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/services/http_services.dart';
import 'package:flutter/cupertino.dart';

class ServiceProvider extends ChangeNotifier {
  HttpService _httpService = HttpService();
  Global _global;
  List<Continent> _continents;
  List<Country> _countries;

  Global get global {
    if (_global == null) {
      _httpService.fetchGlobalData().then((Global global) {
        _global = global;
      }).whenComplete(() {
        notifyListeners();
      });
    }

    return _global;
  }

  List<Continent> get continents {
    if (_continents == null) {
      _httpService.fetchContinentData().then((List<Continent> continents) {
        _continents = continents;
      }).whenComplete(() {
        notifyListeners();
      });
    }

    return _continents;
  }

  List<Country> get countries {
    if (_countries == null) {
      _httpService.fetchCountryData().then((List<Country> countries) {
        _countries = countries;
      }).whenComplete(() {
        notifyListeners();
      });
    }

    return _countries;
  }
}
