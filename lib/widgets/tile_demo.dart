import 'package:coronatracker/widgets/text_demo.dart';
import 'package:flutter/material.dart';

class TileDemo extends StatelessWidget {
  final int _index;
  final bool _showFlag;

  const TileDemo({int index, bool showFlag})
      : this._index = index,
        this._showFlag = showFlag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: MaterialButton(
          onPressed: null,
          child: ListTile(
            title: TextDemo(
              height: 24.0,
              width: 100,
            ),
            subtitle: Container(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Container(
                  width: 75,
                ),
              ),
            ),
            leading: _index == null
                ? null
                : Text(
                    "${_index + 1}",
                    style: TextStyle(fontSize: 24.0),
                  ),
            trailing: _showFlag != null && _showFlag
                ? SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Theme.of(context).chipTheme.backgroundColor,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
