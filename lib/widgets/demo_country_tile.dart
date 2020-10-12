import 'package:flutter/material.dart';

class DemoCountryTile extends StatelessWidget {
  final int _index;

  const DemoCountryTile({int index, double height, double width})
      : this._index = index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          trailing: SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          title: Row(
            children: [
              Container(
                height: 24.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ],
          ),
          subtitle: Container(
            alignment: Alignment.centerLeft,
            child: Chip(
              label: Container(
                height: 16.0,
                width: 50.0,
              ),
            ),
          ),
          leading: _index == null
              ? null
              : Text(
                  "${_index + 1}",
                  style: TextStyle(fontSize: 24.0),
                ),
        ),
      ),
    );
  }
}
