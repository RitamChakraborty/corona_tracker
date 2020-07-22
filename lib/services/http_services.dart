import 'package:coronatracker/data/constants.dart';
import 'package:coronatracker/models/global.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<Global> fetchGlobalData() async {
    http.Response response =  await http.get(GLOBAL_DATA_API);

    if (response.statusCode == 200) {
      return Global.fromString(string: response.body);
    } else {
      throw Exception('Failed to fetch global data');
    }
  }
}