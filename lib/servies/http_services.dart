import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  /// Get the list of details of all countries as future
  Future<List<CountryData>> getCountryData() async {
    List<CountryData> list = [];
    var res = await http.get(COUNTRY_DATA_URL);
    var map = json.decode(res.body);

    for (var data in map) {
      String country = data['country'];

      if (country != 'Total:') {
        list.add(CountryData(
            country: data['country'],
            cases: data['cases'],
            todayCases: data['todayCases'],
            deaths: data['deaths'],
            todayDeaths: data['todayDeaths'],
            recovered: data['recovered'],
            active: data['active'],
            critical: data['critical']));
      }
    }

    /// Removing continents
    return list;
  }

  /// Get the JSON data for global details
  /// Return data as [GlobalData] as future
  Future<GlobalData> getGlobalData() async {
    var res = await http.get(GLOBAL_DATA_URL);
    var data = json.decode(res.body);
    return GlobalData(
      cases: data['cases'],
      deaths: data['deaths'],
      recovered: data['recovered'],
    );
  }
}