import 'package:coronatracker/data/sorting.dart';
import 'package:flutter/material.dart';

class SliverSearchBar extends StatelessWidget {
  final String _hintText;

  const SliverSearchBar({@required String hintText})
      : this._hintText = hintText,
        assert(hintText != null);

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                hintText: _hintText,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14.0),
                icon: Icon(Icons.search),
                suffixIcon: IconButton(
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
                                onChanged: (SortingType sortingType) {

                                },
                                title: Text("Name"),
                              ), RadioListTile<SortingType>(
                                value: SortingType.CASES,
                                groupValue: SortingType.NAME,
                                onChanged: (SortingType sortingType) {

                                },
                                title: Text("Cases"),
                              ), RadioListTile<SortingType>(
                                value: SortingType.DEATHS,
                                groupValue: SortingType.NAME,
                                onChanged: (SortingType sortingType) {

                                },
                                title: Text("Deaths"),
                              ), RadioListTile<SortingType>(
                                value: SortingType.ACTIVE,
                                groupValue: SortingType.NAME,
                                onChanged: (SortingType sortingType) {

                                },
                                title: Text("Active cases"),
                              ), RadioListTile<SortingType>(
                                value: SortingType.RECOVERED,
                                groupValue: SortingType.NAME,
                                onChanged: (SortingType sortingType) {

                                },
                                title: Text("Recovered"),
                              ),
                            ],
                          ),
                        );
                      }
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
