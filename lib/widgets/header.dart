import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header implements SliverPersistentHeaderDelegate {
  final double _maxExtent;
  final double _minExtent;
  final String _imagePath;
  final String _headerMessage;

  const Header({
    @required double maxExtent,
    @required double minExtent,
    @required String imagePath,
    @required String headerMessage,
  })  : this._maxExtent = maxExtent,
        this._minExtent = minExtent,
        this._imagePath = imagePath,
        this._headerMessage = headerMessage,
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
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
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
                  '$_imagePath',
                  alignment: Alignment.topLeft,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: shrinkOffset),
                child: Text(
                  "$_headerMessage",
                  style: TextStyle(color: Colors.white, fontSize: 24, shadows: [
                    Shadow(
                        color: Colors.deepPurple,
                        offset: Offset(5, 5),
                        blurRadius: 3)
                  ]),
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
