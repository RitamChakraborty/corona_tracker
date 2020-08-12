import 'package:coronatracker/data/sorting.dart';
import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/country_tile.dart';
import 'package:coronatracker/widgets/sliver_search_bar.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  bool enabled = true;
  String filter = "";

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> provider = Provider.of<ValueNotifier<bool>>(context);
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        provider.value = false;
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        provider.value = true;
      }
    });
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    List<Country> countries = serviceProvider.countries;

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
          enabled = false;
        });
      },
    );

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverSearchBar(
              hintText: "Search country",
              controller: controller,
              suffixIcon: filter.isEmpty ? sortButton : clearButton,
              enabled: enabled,
              onTap: () async {
                await Future.delayed(Duration(milliseconds: 100));
                setState(() {
                  enabled = true;
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
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Country country = countries[index];
                  return CountryTile(
                    country: country,
                    index: index,
                  );
                },
                childCount: countries.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
