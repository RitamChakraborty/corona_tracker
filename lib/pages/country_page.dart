import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:coronatracker/widgets/hero_flag.dart';
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

    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            expandedHeight: size.height / 4,
            flexibleSpace: ClipPath(
              clipper: BezierClipper(),
              child: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    HeroFlag(
                      country: _country,
                    ),
                    SizedBox.expand(
                      child: Container(
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text("${_country.country}"),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(child: Text("Hello!")),
          )
        ],
      ),
    );
  }
}
