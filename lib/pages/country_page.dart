import 'package:coronatracker/models/country.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  final Country _country;
  final int _index;

  const CountryPage({@required Country country, @required int index})
      : this._country = country,
        this._index = index,
        assert(country != null),
        assert(index != null);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: size.height / 4,
          title: Text("${_country.country}"),
        )
      ],
    );
  }
}
