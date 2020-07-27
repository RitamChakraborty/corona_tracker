import 'dart:math';

import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header implements SliverPersistentHeaderDelegate {
  final double _maxExtent;
  final double _minExtent;

  const Header({@required double maxExtent, @required double minExtent})
      : this._maxExtent = maxExtent,
        this._minExtent = minExtent,
        assert(maxExtent != null),
        assert(minExtent != null);

  double _getOpacity(double shrinkOffset) => 1.0 - (shrinkOffset / _maxExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Opacity(
      opacity: _getOpacity(shrinkOffset),
      child: ClipPath(
        clipper: BezierClipper(),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.purple[200]]),
            image: DecorationImage(
              image: Image.asset('assets/images/virus.png').image,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                child: SvgPicture.asset(
                  'assets/svgs/doctor_2.svg',
                  alignment: Alignment.topLeft,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: shrinkOffset),
                child: Text(
                  "Say Home,\nSay Safe !",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      shadows: [
                        Shadow(
                            color: Colors.deepPurple,
                            offset: Offset(5, 5),
                            blurRadius: 3
                        )
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
