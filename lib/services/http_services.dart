import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/models/global.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<Global> fetchGlobalData() async {
    http.Response response = await http.get(GLOBAL_API);

    if (response.statusCode == 200) {
      return Global.fromString(string: response.body);
    } else {
      throw Exception('Failed to fetch global data');
    }
  }

  Future<List<Continent>> fetchContinentData() async {
    http.Response response = await http.get(CONTINENT_API);

    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      return list
          .map((dynamic map) => Continent.fromMap(map: map)).toList();
    } else {
      throw Exception('Failed to fetch continent data');
    }
  }

  Future<List<Country>> fetchCountryData() async {
    http.Response response = await http.get(COUNTRY_API);

    if (response.statusCode == 200) {
      List<dynamic> list =jsonDecode(response.body);
      return list.map((dynamic map) => Country.fromMap(map: map)).toList();
    } else {
      throw Exception('Failed to fetch country data');
    }
  }
}
