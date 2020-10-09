import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SymptomsCard extends StatelessWidget {
  final String _imagePath;
  final String _text;

  const SymptomsCard({@required String imagePath, @required String text})
      : this._imagePath = imagePath,
        this._text = text,
        assert(imagePath != null),
        assert(text != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 125,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Image.asset(
                  '$_imagePath',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text("$_text"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
