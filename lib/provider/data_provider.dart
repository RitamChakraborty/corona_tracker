import 'package:coronatracker/model/country_data.dart';
import 'package:coronatracker/model/global_data.dart';
import 'package:coronatracker/servies/http_services.dart';
import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  HttpServices _httpServices = HttpServices();
  GlobalData _globalData;
  List<CountryData> _countryDataList = [];

  GlobalData get globalData {
    _httpServices.getGlobalData().then((GlobalData globalData) {
      _globalData = globalData;
    }).whenComplete(() {
      notifyListeners();
    });

    return _globalData;
  }

  List<CountryData> get countryDataList {
    _httpServices.getCountryData().then((List<CountryData> countryDataList) {
      _countryDataList = countryDataList;
    }).whenComplete(() {
      notifyListeners();
    });

    return _countryDataList;
  }
}
