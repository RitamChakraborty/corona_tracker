import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          onTap: () {
            print(url);
          },
          child: Chip(
            elevation: 10.0,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8.0),
            avatar: Icon(
              icon,
              color: Colors.white,
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
        // fit: StackFit.expand,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                color: Colors.deepPurple),
                            chip(
                              label: "ncov2019@gov.in",
                              url: "mailto:mcov2019@gov.in",
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              child: SvgPicture.asset(
                "assets/svgs/nurse.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
