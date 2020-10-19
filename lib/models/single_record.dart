import 'package:meta/meta.dart';

class SingleRecord {
  final String _date;
  final int _value;

  const SingleRecord({@required String date, @required int value})
      : this._date = date,
        this._value = value,
        assert(date != null),
        assert(value != null);

  factory SingleRecord.fromMapEntry(
          {@required MapEntry<dynamic, dynamic> mapEntry}) =>
      SingleRecord(date: mapEntry.key as String, value: mapEntry.value as int);

  String get date => _date;

  int get value => _value;
}
