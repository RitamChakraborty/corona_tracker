import 'dart:convert';
import 'package:meta/meta.dart';

class ContinentInfo {
  final double _lat;
  final double _long;

  const ContinentInfo({@required double lat, @required double long})
      : this._lat = lat,
        this._long = long,
        assert(lat != null),
        assert(long != null);

  factory ContinentInfo.fromMap({@required Map<String, dynamic> map}) =>
      ContinentInfo(lat: map['lat'], long: map['long']);

  factory ContinentInfo.fromString({@required String string}) =>
      ContinentInfo.fromMap(map: jsonDecode(string));

  double get long => _long;

  double get lat => _lat;
}
