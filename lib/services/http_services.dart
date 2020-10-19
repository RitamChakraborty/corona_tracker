import 'dart:convert';

import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/models/history.dart';
import 'package:coronatracker/models/single_record.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

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
      return list.map((dynamic map) => Continent.fromMap(map: map)).toList();
    } else {
      throw Exception('Failed to fetch continent data');
    }
  }

  Future<List<Country>> fetchCountryData() async {
    http.Response response = await http.get(COUNTRY_API);

    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      return list.map((dynamic map) => Country.fromMap(map: map)).toList();
    } else {
      throw Exception('Failed to fetch country data');
    }
  }

  Future<History> fetchHistory({@required String type}) async {
    http.Response response = await http.get(GLOBAL_HISTORY_API);

    if (response.statusCode == 200) {
      String body = response.body;
      Map<String, dynamic> map = jsonDecode(body);
      List<SingleRecord> records = (map[type] as Map<dynamic, dynamic>)
          .entries
          .map((mapEntry) => SingleRecord.fromMapEntry(mapEntry: mapEntry))
          .toList();

      return History(records: records);
    } else {
      throw Exception("Failed to fetch global history data");
    }
  }

  Future<History> fetchCountryHistory({
    @required String type,
    @required Country country,
  }) async {
    String api = COUNTRY_HISTORY_API + country.countryInfo.iso2;
    http.Response response = await http.get(api);

    if (response.statusCode == 200) {
      String body = response.body;
      Map<String, dynamic> map = jsonDecode(body);
      List<SingleRecord> records =
          (map['timeline'][type] as Map<dynamic, dynamic>)
              .entries
              .map((mapEntry) => SingleRecord.fromMapEntry(mapEntry: mapEntry))
              .toList();

      return History(records: records);
    } else {
      throw Exception("Failed to fetch global history data");
    }
  }
}
