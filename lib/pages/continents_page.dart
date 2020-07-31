import 'package:flutter/material.dart';

class ContinentsPage extends StatefulWidget {
  @override
  _ContinentsPageState createState() => _ContinentsPageState();
}

class _ContinentsPageState extends State<ContinentsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Continents"),
      ),
      body: ContinentsPage(),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
