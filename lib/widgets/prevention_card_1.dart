import 'package:flutter/material.dart';

class PreventionCard1 extends StatelessWidget {
  final String _imagePath;
  final String _headerText;
  final String _text;

  const PreventionCard1({
    @required String imagePath,
    @required String headerText,
    @required text,
  })  : this._imagePath = imagePath,
        this._headerText = headerText,
        this._text = text,
        assert(imagePath != null),
        assert(headerText != null),
        assert(text != null);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 5,
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SingleChildScrollView(
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
                      SizedBox(height: 8.0),
                      Container(
                        child: Text(
                          "$_text",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(_imagePath),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
