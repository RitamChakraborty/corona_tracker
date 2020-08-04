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
    _countries = [
      {
        "updated": 1596554085037,
        "country": "Afghanistan",
        "countryInfo": {
          "_id": 4,
          "iso2": "AF",
          "iso3": "AFG",
          "lat": 33,
          "long": 65,
          "flag": "https://disease.sh/assets/img/flags/af.png"
        },
        "cases": 36747,
        "todayCases": 0,
        "deaths": 1288,
        "todayDeaths": 0,
        "recovered": 25669,
        "todayRecovered": 0,
        "active": 9790,
        "critical": 31,
        "casesPerOneMillion": 942,
        "deathsPerOneMillion": 33,
        "tests": 89377,
        "testsPerOneMillion": 2292,
        "population": 39002243,
        "continent": "Asia",
        "oneCasePerPeople": 1061,
        "oneDeathPerPeople": 30281,
        "oneTestPerPeople": 436,
        "activePerOneMillion": 251.01,
        "recoveredPerOneMillion": 658.14,
        "criticalPerOneMillion": 0.79
      },
      {
        "updated": 1596554085127,
        "country": "Bosnia",
        "countryInfo": {
          "_id": 70,
          "iso2": "BA",
          "iso3": "BIH",
          "lat": 44,
          "long": 18,
          "flag": "https://disease.sh/assets/img/flags/ba.png"
        },
        "cases": 12856,
        "todayCases": 394,
        "deaths": 373,
        "todayDeaths": 11,
        "recovered": 6592,
        "todayRecovered": 233,
        "active": 5891,
        "critical": 0,
        "casesPerOneMillion": 3921,
        "deathsPerOneMillion": 114,
        "tests": 143973,
        "testsPerOneMillion": 43910,
        "population": 3278816,
        "continent": "Europe",
        "oneCasePerPeople": 255,
        "oneDeathPerPeople": 8790,
        "oneTestPerPeople": 23,
        "activePerOneMillion": 1796.69,
        "recoveredPerOneMillion": 2010.48,
        "criticalPerOneMillion": 0
      },
      {
        "updated": 1596554085443,
        "country": "Botswana",
        "countryInfo": {
          "_id": 72,
          "iso2": "BW",
          "iso3": "BWA",
          "lat": -22,
          "long": 24,
          "flag": "https://disease.sh/assets/img/flags/bw.png"
        },
        "cases": 804,
        "todayCases": 0,
        "deaths": 2,
        "todayDeaths": 0,
        "recovered": 63,
        "todayRecovered": 0,
        "active": 739,
        "critical": 1,
        "casesPerOneMillion": 341,
        "deathsPerOneMillion": 0.8,
        "tests": 68423,
        "testsPerOneMillion": 29046,
        "population": 2355686,
        "continent": "Africa",
        "oneCasePerPeople": 2930,
        "oneDeathPerPeople": 1177843,
        "oneTestPerPeople": 34,
        "activePerOneMillion": 313.71,
        "recoveredPerOneMillion": 26.74,
        "criticalPerOneMillion": 0.42
      },
      {
        "updated": 1596554084813,
        "country": "Brazil",
        "countryInfo": {
          "_id": 76,
          "iso2": "BR",
          "iso3": "BRA",
          "lat": -10,
          "long": -55,
          "flag": "https://disease.sh/assets/img/flags/br.png"
        },
        "cases": 2751665,
        "todayCases": 0,
        "deaths": 94702,
        "todayDeaths": 0,
        "recovered": 1912319,
        "todayRecovered": 0,
        "active": 744644,
        "critical": 8318,
        "casesPerOneMillion": 12937,
        "deathsPerOneMillion": 445,
        "tests": 13196132,
        "testsPerOneMillion": 62042,
        "population": 212698326,
        "continent": "South America",
        "oneCasePerPeople": 77,
        "oneDeathPerPeople": 2246,
        "oneTestPerPeople": 16,
        "activePerOneMillion": 3500.94,
        "recoveredPerOneMillion": 8990.76,
        "criticalPerOneMillion": 39.11
      },
      {
        "updated": 1596554085715,
        "country": "British Virgin Islands",
        "countryInfo": {
          "_id": 92,
          "iso2": "VG",
          "iso3": "VGB",
          "lat": 18.5,
          "long": -64.5,
          "flag": "https://disease.sh/assets/img/flags/vg.png"
        },
        "cases": 8,
        "todayCases": 0,
        "deaths": 1,
        "todayDeaths": 0,
        "recovered": 7,
        "todayRecovered": 0,
        "active": 0,
        "critical": 0,
        "casesPerOneMillion": 264,
        "deathsPerOneMillion": 33,
        "tests": 1253,
        "testsPerOneMillion": 41421,
        "population": 30250,
        "continent": "North America",
        "oneCasePerPeople": 3781,
        "oneDeathPerPeople": 30250,
        "oneTestPerPeople": 24,
        "activePerOneMillion": 0,
        "recoveredPerOneMillion": 231.4,
        "criticalPerOneMillion": 0
      },
      {
        "updated": 1596554085615,
        "country": "Brunei",
        "countryInfo": {
          "_id": 96,
          "iso2": "BN",
          "iso3": "BRN",
          "lat": 4.5,
          "long": 114.6667,
          "flag": "https://disease.sh/assets/img/flags/bn.png"
        },
        "cases": 141,
        "todayCases": 0,
        "deaths": 3,
        "todayDeaths": 0,
        "recovered": 138,
        "todayRecovered": 0,
        "active": 0,
        "critical": 0,
        "casesPerOneMillion": 322,
        "deathsPerOneMillion": 7,
        "tests": 41148,
        "testsPerOneMillion": 93975,
        "population": 437859,
        "continent": "Asia",
        "oneCasePerPeople": 3105,
        "oneDeathPerPeople": 145953,
        "oneTestPerPeople": 11,
        "activePerOneMillion": 0,
        "recoveredPerOneMillion": 315.17,
        "criticalPerOneMillion": 0
      },
      {
        "updated": 1596554085129,
        "country": "Bulgaria",
        "countryInfo": {
          "_id": 100,
          "iso2": "BG",
          "iso3": "BGR",
          "lat": 43,
          "long": 25,
          "flag": "https://disease.sh/assets/img/flags/bg.png"
        },
        "cases": 12159,
        "todayCases": 0,
        "deaths": 404,
        "todayDeaths": 0,
        "recovered": 6684,
        "todayRecovered": 0,
        "active": 5071,
        "critical": 43,
        "casesPerOneMillion": 1751,
        "deathsPerOneMillion": 58,
        "tests": 276628,
        "testsPerOneMillion": 39841,
        "population": 6943280,
        "continent": "Europe",
        "oneCasePerPeople": 571,
        "oneDeathPerPeople": 17186,
        "oneTestPerPeople": 25,
        "activePerOneMillion": 730.35,
        "recoveredPerOneMillion": 962.66,
        "criticalPerOneMillion": 6.19
      },
      {
        "updated": 1596554085114,
        "country": "Costa Rica",
        "countryInfo": {
          "_id": 188,
          "iso2": "CR",
          "iso3": "CRI",
          "lat": 10,
          "long": -84,
          "flag": "https://disease.sh/assets/img/flags/cr.png"
        },
        "cases": 19402,
        "todayCases": 0,
        "deaths": 171,
        "todayDeaths": 0,
        "recovered": 4689,
        "todayRecovered": 0,
        "active": 14542,
        "critical": 97,
        "casesPerOneMillion": 3806,
        "deathsPerOneMillion": 34,
        "tests": 92680,
        "testsPerOneMillion": 18178,
        "population": 5098349,
        "continent": "North America",
        "oneCasePerPeople": 263,
        "oneDeathPerPeople": 29815,
        "oneTestPerPeople": 55,
        "activePerOneMillion": 2852.3,
        "recoveredPerOneMillion": 919.71,
        "criticalPerOneMillion": 19.03
      }
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
