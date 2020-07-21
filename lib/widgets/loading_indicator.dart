import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final int _id;

  const LoadingIndicator({int id = 1}) : this._id = id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                      Theme.of(context).brightness == Brightness.light
                          ? 'assets/gifs/light_$_id.gif'
                          : 'assets/gifs/dark_$_id.gif')
                  .image,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 32),
          child: Text(
            "Loading...",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
