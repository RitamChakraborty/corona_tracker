import 'package:flutter/material.dart';

class SafetyPage extends StatefulWidget {
  @override
  _SafetyPageState createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Safety Measures"),
      ),
      body: Container(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
