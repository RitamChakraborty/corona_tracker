import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:coronatracker/models/country_info.dart';

class Country {
  final String _country;
  final CountryInfo _countryInfo;
  final int _cases;
  final int _todayCases;
  final int _deaths;
  final int _todayDeaths;
  final int _recovered;
  final int _todayRecovered;
  final int _active;
  final int _critical;
  final double _casesPerOneMillion;
  final double _deathsPerOneMillion;
  final int _tests;
  final double _testsPerOneMillion;
  final int _population;
  final String _continent;
  final int _oneCasePerPeople;
  final int _oneDeathPerPeople;
  final double _activePerOneMillion;
  final double _recoveredPerOneMillion;
  final double _criticalPerOneMillion;

  const Country({
    String country,
    CountryInfo countryInfo,
    int cases,
    int todayCases,
    int deaths,
    int todayDeaths,
    int recovered,
    int todayRecovered,
    int active,
    int critical,
    double casesPerOneMillion,
    double deathsPerOneMillion,
    int tests,
    double testsPerOneMillion,
    int population,
    String continent,
    int oneCasePerPeople,
    int oneDeathPerPeople,
    double activePerOneMillion,
    double recoveredPerOneMillion,
    double criticalPerOneMillion,
  })  : this._country = country,
        this._countryInfo = countryInfo,
        this._cases = cases,
        this._todayCases = todayCases,
        this._deaths = deaths,
        this._todayDeaths = todayDeaths,
        this._recovered = recovered,
        this._todayRecovered = todayRecovered,
        this._active = active,
        this._critical = critical,
        this._casesPerOneMillion = casesPerOneMillion,
        this._deathsPerOneMillion = deathsPerOneMillion,
        this._tests = tests,
        this._testsPerOneMillion = testsPerOneMillion,
        this._population = population,
        this._continent = continent,
        this._oneCasePerPeople = oneCasePerPeople,
        this._oneDeathPerPeople = oneDeathPerPeople,
        this._activePerOneMillion = activePerOneMillion,
        this._recoveredPerOneMillion = recoveredPerOneMillion,
        this._criticalPerOneMillion = criticalPerOneMillion,
        assert(country != null),
        assert(countryInfo != null),
        assert(cases != null),
        assert(todayCases != null),
        assert(deaths != null),
        assert(todayDeaths != null),
        assert(recovered != null),
        assert(todayRecovered != null),
        assert(active != null),
        assert(critical != null),
        assert(casesPerOneMillion != null),
        assert(deathsPerOneMillion != null),
        assert(tests != null),
        assert(testsPerOneMillion != null),
        assert(population != null),
        assert(continent != null),
        assert(oneCasePerPeople != null),
        assert(oneDeathPerPeople != null),
        assert(activePerOneMillion != null),
        assert(recoveredPerOneMillion != null),
        assert(criticalPerOneMillion != null);

  factory Country.fromMap({@required Map<String, dynamic> map}) => Country(
        country: map['country'],
        countryInfo: CountryInfo.fromMap(map: map['countryInfo']),
        cases: map['cases'],
        todayCases: map['todayCases'],
        deaths: map['deaths'],
        todayDeaths: map['todayDeaths'],
        recovered: map['recovered'],
        todayRecovered: map['todayRecovered'],
        active: map['active'],
        critical: map['critical'],
        casesPerOneMillion: map['casesPerOneMillion'] * 1.0,
        deathsPerOneMillion: map['deathsPerOneMillion'] * 1.0,
        tests: map['tests'],
        testsPerOneMillion: map['tests'] * 1.0,
        population: map['population'],
        continent: map['continent'],
        oneCasePerPeople: map['oneCasePerPeople'],
        oneDeathPerPeople: map['oneDeathPerPeople'],
        activePerOneMillion: map['activePerOneMillion'] * 1.0,
        recoveredPerOneMillion: map['recoveredPerOneMillion'] * 1.0,
        criticalPerOneMillion: map['criticalPerOneMillion'] * 1.0,
      );

  factory Country.fromString({@required String string}) =>
      Country.fromMap(map: jsonDecode(string));

  double get criticalPerOneMillion => _criticalPerOneMillion;

  double get recoveredPerOneMillion => _recoveredPerOneMillion;

  double get activePerOneMillion => _activePerOneMillion;

  int get oneDeathPerPeople => _oneDeathPerPeople;

  int get oneCasePerPeople => _oneCasePerPeople;

  String get continent => _continent;

  int get population => _population;

  double get testsPerOneMillion => _testsPerOneMillion;

  int get tests => _tests;

  double get deathsPerOneMillion => _deathsPerOneMillion;

  double get casesPerOneMillion => _casesPerOneMillion;

  int get critical => _critical;

  int get active => _active;

  int get todayRecovered => _todayRecovered;

  int get recovered => _recovered;

  int get todayDeaths => _todayDeaths;

  int get deaths => _deaths;

  int get todayCases => _todayCases;

  int get cases => _cases;

  CountryInfo get countryInfo => _countryInfo;

  String get country => _country;

  double get totalAffectedPercentage => (_cases / _population) * 100;

  double get deathsPercentage => (_deaths / _cases) * 100;

  double get recoveryPercentage => (_recovered / _cases) * 100;

  double get activeCasesPercentage => (_active / _cases) * 100;

  double get criticalCasesPercentage => (_critical / _active) * 100;

  double get testsPercentage => (_tests / _population) * 100;
}
