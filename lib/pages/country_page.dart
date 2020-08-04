import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Country _country;
  final int _index;

  const Country({@required Country country, @required int index})
      : this._country = country,
        this._index = index,
        assert(country != null),
        assert(index != null);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
