import 'package:coronatracker/data/sorting.dart';
import 'package:flutter/material.dart';

class SortingPopupButton extends StatelessWidget {
  final SortingType _groupValue;
  final ValueChanged<SortingType> _onChanged;

  const SortingPopupButton({
    @required SortingType groupValue,
    @required ValueChanged<SortingType> onChanged,
  })  : this._groupValue = groupValue,
        this._onChanged = onChanged,
        assert(groupValue != null),
        assert(onChanged != null);

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
                    groupValue: _groupValue,
                    onChanged: _onChanged,
                    title: Text("Name"),
                  ),
                  RadioListTile<SortingType>(
                    value: SortingType.CASES,
                    groupValue: _groupValue,
                    onChanged: _onChanged,
                    title: Text("Cases"),
                  ),
                  RadioListTile<SortingType>(
                    value: SortingType.DEATHS,
                    groupValue: _groupValue,
                    onChanged: _onChanged,
                    title: Text("Deaths"),
                  ),
                  RadioListTile<SortingType>(
                    value: SortingType.ACTIVE,
                    groupValue: _groupValue,
                    onChanged: _onChanged,
                    title: Text("Active cases"),
                  ),
                  RadioListTile<SortingType>(
                    value: SortingType.RECOVERED,
                    groupValue: _groupValue,
                    onChanged: _onChanged,
                    title: Text("Recovered"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
