import 'package:coronatracker/models/global_data.dart';
import 'package:coronatracker/services/http_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('fetchGlobalData', () {
    test('object_check', () async {
      GlobalData globalData = await HttpService().fetchGlobalData();
      expect(globalData, isA<GlobalData>());
    });

    test('data_check', () async {
      GlobalData globalData = await HttpService().fetchGlobalData();
      expect(globalData.affectedCountries, 215);
    });
  });
}