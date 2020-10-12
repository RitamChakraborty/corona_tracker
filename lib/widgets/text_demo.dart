import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  final double _height;
  final double _width;

  const TextDemo({double height, @required double width})
      : this._height = height,
        this._width = width,
        assert(width != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height ?? 16.0,
      width: _width,
      decoration: BoxDecoration(
        color: Theme.of(context).disabledColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }
}
