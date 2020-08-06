import 'package:coronatracker/models/continent.dart';
import 'package:flutter/material.dart';

class ContinentPage extends StatelessWidget {
  final Continent _continent;
  final int _index;

  const ContinentPage({@required Continent continent, @required int index})
  : this._continent = continent,
  this._index = index,
  assert(continent != null),
  assert(index != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("${_continent.continent}"),
            centerTitle: true,
          ),
          SliverFillRemaining(
            child: Center(child: Text("Hello!")),
          )
        ],
      ),
    );
  }
}
