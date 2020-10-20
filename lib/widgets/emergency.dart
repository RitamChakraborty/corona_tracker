import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Emergency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );

    Widget chip({
      @required String label,
      @required IconData icon,
      @required String url,
      @required Color color,
    }) =>
        GestureDetector(
          onTap: () async {
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
          child: Chip(
            elevation: 10.0,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8.0),
            avatar: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            backgroundColor: color,
            label: Text(
              label,
              style: labelStyle,
            ),
            labelStyle: labelStyle,
          ),
        );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Stack(
        children: [
          Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Text(
                    "Emergency?",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            chip(
                              label: "+91-11-23978046",
                              url: "tel:+91-11-23978046",
                              icon: Icons.phone,
                              color: Colors.deepPurple,
                            ),
                            chip(
                              label: "ncov2019@gov.in",
                              url: "mailto:ncov2019@gov.in",
                              icon: Icons.email,
                              color: Colors.deepOrangeAccent,
                            ),
                            chip(
                              label: "mohfw.gov.in",
                              url: "https://mohfw.gov.in/",
                              icon: Icons.link,
                              color: Colors.pink,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50),
            width: double.infinity,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                  ),
                ),
                Flexible(
                  flex: 15,
                  fit: FlexFit.loose,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: SvgPicture.asset(
                      "assets/svgs/nurse.svg",
                    ),
                  ),
                ),
                Flexible(
                  flex: 10,
                  fit: FlexFit.loose,
                  child: Container(
                    width: double.infinity,
                    color: Colors.yellow,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
