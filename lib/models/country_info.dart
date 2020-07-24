import 'dart:convert';

import 'package:meta/meta.dart';

class CountryInfo {
  final int _id;
  final String _iso2;
  final String _iso3;
  final double _lat;
  final double _long;
  final String _flag;

  const CountryInfo({
    @required int id,
    @required String iso2,
    @required String iso3,
    @required double lat,
    @required double long,
    @required String flag,
  })
      : this._id = id,
        this._iso2 = iso2,
        this._iso3 = iso3,
        this._lat = lat,
        this._long = long,
        this._flag = flag,
        assert(id != null),
        assert(iso2 != null),
        assert(iso3 != null),
        assert(lat != null),
        assert(long != null),
        assert(flag != null);

  factory CountryInfo.fromMap({@required Map<String, dynamic> map}) =>
      CountryInfo(
        id: map['_id'],
        iso2: map['iso2'],
        iso3: map['iso3'],
        lat: map['lat'] * 1.0,
        long: map['long'] * 1.0,
        flag: map['flag'],
      );

  factory CountryInfo.fromString({@required String string}) =>
      CountryInfo.fromMap(map: jsonDecode(string));

  String get flag => _flag;

  double get long => _long;

  double get lat => _lat;

  String get iso3 => _iso3;

  String get iso2 => _iso2;

  int get id => _id;


}