import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  final String _heading = "Total Cases";
  final String _value = "12345678";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                _heading,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                _value,
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
