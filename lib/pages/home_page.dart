import 'dart:wasm';

import 'package:coronatracker/widgets/bezier_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: size.height / 3,
            flexibleSpace: ClipPath(
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
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SafeArea(
                      child: SvgPicture.asset(
                        'assets/svgs/doctor_1.svg',
                        alignment: Alignment.topLeft,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 56.0),
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
            elevation: 0,
          ),
          SliverFillRemaining(
            child: Center(
              child: Text('body'),
            ),
          )
        ],
      ),
    );
  }
}
