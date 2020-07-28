import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/services/http_services.dart';
import 'package:flutter/cupertino.dart';

class ServiceProvider extends ChangeNotifier {
  HttpService _httpService = HttpService();
  Global _global;

  Global get global {
    // Demo data
    _global = Global.fromMap(map: {
      "updated": 1595952230036,
      "cases": 16735542,
      "todayCases": 99615,
      "deaths": 659058,
      "todayDeaths": 2344,
      "recovered": 10297777,
      "todayRecovered": 71295,
      "active": 5778707,
      "critical": 66616,
      "casesPerOneMillion": 2147,
      "deathsPerOneMillion": 84.6,
      "tests": 326421471,
      "testsPerOneMillion": 42044.26,
      "population": 7763759078,
      "oneCasePerPeople": 0,
      "oneDeathPerPeople": 0,
      "oneTestPerPeople": 0,
      "activePerOneMillion": 744.32,
      "recoveredPerOneMillion": 1326.39,
      "criticalPerOneMillion": 8.58,
      "affectedCountries": 215
    });
    if (_global == null) {
      _httpService.fetchGlobalData().then((Global global) {
        _global = global;
      }).whenComplete(() {
        notifyListeners();
      });
    }

    return _global;
  }
}
