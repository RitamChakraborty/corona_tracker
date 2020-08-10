import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:coronatracker/widgets/hero_flag.dart';
import 'package:flutter/material.dart';

class CountryAppBar extends StatelessWidget {
  final Country _country;
  final Size _size;

  const CountryAppBar({@required Country country, @required Size size})
      : this._country = country,
        this._size = size,
        assert(country != null),
        assert(size != null);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      expandedHeight: _size.height / 4,
      flexibleSpace: ClipPath(
        clipper: BezierClipper(),
        child: FlexibleSpaceBar(
          centerTitle: true,
          background: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              HeroFlag(
                country: _country,
              ),
              SizedBox.expand(
                child: Container(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 64.0),
            child: Text("${_country.country}"),
          ),
        ),
      ),
    );
  }
}
