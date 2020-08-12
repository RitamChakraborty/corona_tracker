import 'package:coronatracker/data/sorting.dart';
import 'package:flutter/material.dart';

class SliverSearchBar extends StatefulWidget {
  final String _hintText;

  const SliverSearchBar({@required String hintText})
      : this._hintText = hintText,
        assert(hintText != null);

  @override
  _SliverSearchBarState createState() => _SliverSearchBarState();
}

class _SliverSearchBarState extends State<SliverSearchBar> {
  bool b = true;
  TextEditingController controller = TextEditingController();
  String filter = "";

  @override
  Widget build(BuildContext context) {
    Widget sortButton = IconButton(
      icon: Icon(Icons.sort),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Sort countries by"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10.0,
                content: Wrap(
                  children: <Widget>[
                    RadioListTile<SortingType>(
                      value: SortingType.NAME,
                      groupValue: SortingType.NAME,
                      onChanged: (SortingType sortingType) {},
                      title: Text("Name"),
                    ),
                    RadioListTile<SortingType>(
                      value: SortingType.CASES,
                      groupValue: SortingType.NAME,
                      onChanged: (SortingType sortingType) {},
                      title: Text("Cases"),
                    ),
                    RadioListTile<SortingType>(
                      value: SortingType.DEATHS,
                      groupValue: SortingType.NAME,
                      onChanged: (SortingType sortingType) {},
                      title: Text("Deaths"),
                    ),
                    RadioListTile<SortingType>(
                      value: SortingType.ACTIVE,
                      groupValue: SortingType.NAME,
                      onChanged: (SortingType sortingType) {},
                      title: Text("Active cases"),
                    ),
                    RadioListTile<SortingType>(
                      value: SortingType.RECOVERED,
                      groupValue: SortingType.NAME,
                      onChanged: (SortingType sortingType) {},
                      title: Text("Recovered"),
                    ),
                  ],
                ),
              );
            });
      },
    );

    Widget clearButton = IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        setState(() {
          controller.text = "";
          filter = "";
          b = false;
        });
      },
    );

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        floating: true,
        pinned: true,
        flexibleSpace: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 75.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: TextField(
              controller: controller,
              enabled: b,
              onTap: () async {
                await Future.delayed(Duration(milliseconds: 10));
                setState(() {
                  b = true;
                });
              },
              onChanged: (String value) {
                setState(() {
                  filter = value;
                });
              },
              onSubmitted: (String value) {
                setState(() {
                  filter = value;
                });
              },
              decoration: InputDecoration(
                hintText: widget._hintText,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14.0),
                icon: Icon(Icons.search),
                suffixIcon: filter.isNotEmpty ? clearButton : sortButton,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
