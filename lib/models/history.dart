import 'package:coronatracker/models/single_record.dart';
import 'package:meta/meta.dart';

class History {
  final List<SingleRecord> _records;

  const History({@required List<SingleRecord> records})
      : this._records = records,
        assert(records != null);

  List<SingleRecord> get records => _records;
}
