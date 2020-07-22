import 'dart:convert';

import 'package:coronatracker/models/continet_info.dart';
import 'package:meta/meta.dart';

class Continent {
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
  final double _activePerOneMillion;
  final double _recoveredPerOneMillion;
  final double _criticalPerOneMillion;
  final ContinentInfo _continentInfo;
  final List<dynamic> _countries;

  const Continent({
    @required int cases,
    @required int todayCases,
    @required int deaths,
    @required int todayDeaths,
    @required int recovered,
    @required int todayRecovered,
    @required int active,
    @required int critical,
    @required double casesPerOneMillion,
    @required double deathsPerOneMillion,
    @required int tests,
    @required double testsPerOneMillion,
    @required int population,
    @required String continent,
    @required double activePerOneMillion,
    @required double recoveredPerOneMillion,
    @required double criticalPerOneMillion,
    @required ContinentInfo continentInfo,
    @required List<dynamic> countries,
  })  : this._cases = cases,
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
        this._activePerOneMillion = activePerOneMillion,
        this._recoveredPerOneMillion = recoveredPerOneMillion,
        this._criticalPerOneMillion = criticalPerOneMillion,
        this._continentInfo = continentInfo,
        this._countries = countries,
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
        assert(activePerOneMillion != null),
        assert(recoveredPerOneMillion != null),
        assert(criticalPerOneMillion != null),
        assert(continentInfo != null),
        assert(countries != null);

  factory Continent.fromMap({@required Map<String, dynamic> map}) => Continent(
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
        testsPerOneMillion: map['testsPerOneMillion'] * 1.0,
        population: map['population'],
        continent: map['continent'],
        activePerOneMillion: map['activePerOneMillion'] * 1.0,
        recoveredPerOneMillion: map['recoveredPerOneMillion'] * 1.0,
        criticalPerOneMillion: map['criticalPerOneMillion'] * 1.0,
        continentInfo: ContinentInfo.fromMap(map: map['continentInfo']),
        countries: map['countries'],
      );

  factory Continent.fromString({@required String string}) =>
      Continent.fromMap(map: jsonDecode(string));

  double get criticalPerOneMillion => _criticalPerOneMillion;

  double get recoveredPerOneMillion => _recoveredPerOneMillion;

  double get activePerOneMillion => _activePerOneMillion;

  int get population => _population;

  String get continent => _continent;

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

  double get totalAffectedPercentage => (_cases / _population) * 100;

  double get deathsPercentage => (_deaths / _cases) * 100;

  double get recoveryPercentage => (_recovered / _cases) * 100;

  double get activeCasesPercentage => (_active / _cases) * 100;

  double get criticalCasesPercentage => (_critical / _active) * 100;

  double get testsPercentage => (_tests / _population) * 100;

  List<dynamic> get countries => _countries;

  ContinentInfo get continentInfo => _continentInfo;

  int get numberOfCountries => _countries.length;
}
