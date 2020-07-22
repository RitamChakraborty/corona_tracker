import 'package:coronatracker/models/continent.dart';
import 'package:coronatracker/models/continet_info.dart';
import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/services/http_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('api test', () {
    test('fetch global data test', () async {
      Global globalData = await HttpService().fetchGlobalData();
      expect(globalData, isA<Global>());
      expect(globalData.affectedCountries, 215);
    });

    test('fetch continent data test', () async {
      List<Continent> continents = await HttpService().fetchContinentData();
      expect(continents[0], isA<Continent>());
      expect(continents[0].continentInfo, isA<ContinentInfo>());
      expect(continents[0].continent, "North America");
    });
  });
}