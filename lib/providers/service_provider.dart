import 'package:coronatracker/models/global.dart';
import 'package:coronatracker/services/http_services.dart';
import 'package:flutter/cupertino.dart';

class ServiceProvider extends ChangeNotifier {
  HttpService _httpService = HttpService();
  Global _global;

  Global get global {
    _httpService.fetchGlobalData().then((Global global) {
      _global = global;
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
