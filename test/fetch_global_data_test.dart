import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/services/http_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('fetchGlobalData', () {
    test('object_check', () async {
      Global globalData = await HttpService().fetchGlobalData();
      expect(globalData, isA<Global>());
    });

    test('data_check', () async {
      Global globalData = await HttpService().fetchGlobalData();
      expect(globalData.affectedCountries, 215);
    });
  });
}