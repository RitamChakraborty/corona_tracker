import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreventionCard extends StatelessWidget {
  final String _imagePath;
  final String _headerText;
  final String _text;

  const PreventionCard({@required String imagePath, @required String headerText, @required String text,})
  : this._imagePath = imagePath,
  this._headerText = headerText,
  this._text = text,
  assert(imagePath != null),
  assert(headerText != null),
  assert(text != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 64.0),
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "$_headerText",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              child: Text(
                                "$_text",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('$_imagePath'),
          ),
        ],
      ),
    );
  }
}
