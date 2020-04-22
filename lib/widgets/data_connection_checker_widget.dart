import 'package:coronatracker/widgets/loading_indicator.dart';
import 'package:coronatracker/widgets/no_internet.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataConnectionCheckerWidget extends StatelessWidget {
  final Widget _child;
  const DataConnectionCheckerWidget({@required Widget child})
      : this._child = child,
        assert(child != null);

  @override
  Widget build(BuildContext context) {
    DataConnectionStatus dataConnectionStatus =
        Provider.of<DataConnectionStatus>(context, listen: false);
    return Consumer(
      builder: (BuildContext context, DataConnectionStatus dataConnectionStatus,
          Widget child) {
        switch (dataConnectionStatus) {
          case DataConnectionStatus.disconnected:
            return NoInternet();
          case DataConnectionStatus.connected:
            return _child;
          default:
            return LoadingIndicator();
        }
      },
    );
  }
}
