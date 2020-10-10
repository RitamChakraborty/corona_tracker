import 'package:coronatracker/pages/home_page.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);

    if (serviceProvider.global != null) {
      return HomePage();
    }

    return Material(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/images/virus.png',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.purpleAccent,
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black,
                      ],
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/do_dont.png',
                  ),
                ),
              ),
              Container(
                child: Image.asset(
                  "assets/images/heading.png",
                  color: Theme.of(context).primaryColor,
                  isAntiAlias: true,
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
        ],
      ),
    );
  }
}
