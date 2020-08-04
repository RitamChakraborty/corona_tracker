import 'package:coronatracker/models/country.dart';
import 'package:flutter/material.dart';

class HeroFlag extends StatelessWidget {
  final Country _country;

  const HeroFlag({@required Country country})
      : this._country = country,
        assert(country != null);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _country.country.toLowerCase(),
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
          _country.countryInfo.flag,
        ),
      ),
    );
  }
}
