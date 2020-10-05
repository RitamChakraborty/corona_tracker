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
    _global = Global.fromMap(map: {
      "updated": 1601909792858,
      "cases": 35483998,
      "todayCases": 93887,
      "deaths": 1043087,
      "todayDeaths": 1538,
      "recovered": 26694334,
      "todayRecovered": 79500,
      "active": 7746577,
      "critical": 66550,
      "casesPerOneMillion": 4552,
      "deathsPerOneMillion": 133.8,
      "tests": 671031644,
      "testsPerOneMillion": 86266.67,
      "population": 7778573974,
      "oneCasePerPeople": 0,
      "oneDeathPerPeople": 0,
      "oneTestPerPeople": 0,
      "activePerOneMillion": 995.89,
      "recoveredPerOneMillion": 3431.78,
      "criticalPerOneMillion": 8.56,
      "affectedCountries": 216
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

  List<Continent> get continents {
    _continents = [
      {
        "updated": 1601909793640,
        "cases": 9135739,
        "todayCases": 11018,
        "deaths": 316342,
        "todayDeaths": 312,
        "recovered": 5947103,
        "todayRecovered": 16506,
        "active": 2872294,
        "critical": 17499,
        "casesPerOneMillion": 15476.22,
        "deathsPerOneMillion": 535.89,
        "tests": 124494667,
        "testsPerOneMillion": 210897.77,
        "population": 590308112,
        "continent": "North America",
        "activePerOneMillion": 4865.75,
        "recoveredPerOneMillion": 10074.57,
        "criticalPerOneMillion": 29.64,
        "continentInfo": {"lat": 31.6768272, "long": -146.4707474},
        "countries": [
          "Anguilla",
          "Antigua and Barbuda",
          "Aruba",
          "Bahamas",
          "Barbados",
          "Belize",
          "Bermuda",
          "British Virgin Islands",
          "Canada",
          "Caribbean Netherlands",
          "Cayman Islands",
          "Costa Rica",
          "Cuba",
          "Curaçao",
          "Dominica",
          "Dominican Republic",
          "El Salvador",
          "Greenland",
          "Grenada",
          "Guadeloupe",
          "Guatemala",
          "Haiti",
          "Honduras",
          "Jamaica",
          "Martinique",
          "Mexico",
          "Montserrat",
          "Nicaragua",
          "Panama",
          "Saint Kitts and Nevis",
          "Saint Lucia",
          "Saint Martin",
          "Saint Pierre Miquelon",
          "Saint Vincent and the Grenadines",
          "Sint Maarten",
          "St. Barth",
          "Trinidad and Tobago",
          "Turks and Caicos Islands",
          "USA"
        ]
      },
    ].map((e) => Continent.fromMap(map: e)).toList();

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
    _countries = [
      {
        "updated": 1601910392757,
        "country": "Afghanistan",
        "countryInfo": {
          "_id": 4,
          "iso2": "AF",
          "iso3": "AFG",
          "lat": 33,
          "long": 65,
          "flag": "https://disease.sh/assets/img/flags/af.png"
        },
        "cases": 39422,
        "todayCases": 81,
        "deaths": 1466,
        "todayDeaths": 4,
        "recovered": 32879,
        "todayRecovered": 27,
        "active": 5077,
        "critical": 93,
        "casesPerOneMillion": 1007,
        "deathsPerOneMillion": 37,
        "tests": 112278,
        "testsPerOneMillion": 2868,
        "population": 39151119,
        "continent": "Asia",
        "oneCasePerPeople": 993,
        "oneDeathPerPeople": 26706,
        "oneTestPerPeople": 349,
        "activePerOneMillion": 129.68,
        "recoveredPerOneMillion": 839.8,
        "criticalPerOneMillion": 2.38
      },
    ].map((e) => Country.fromMap(map: e)).toList();

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
