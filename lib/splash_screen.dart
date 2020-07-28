import 'package:coronatracker/providers/service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);

    return Material(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  Colors.purpleAccent,
                  Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Colors.black,
                ]),
              ),
              child: Image.asset('assets/images/do_dont.png'),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Corona Tracker",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Theme.of(context).accentColor.withOpacity(0.3),
                      offset: Offset(10.0, 10.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(64.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Theme.of(context).brightness == Brightness.light
                      ? Image.asset('assets/gifs/loading_light.gif').image
                      : Image.asset('assets/gifs/loading_dark.gif').image,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
