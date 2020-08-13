import 'package:coronatracker/data/sorting.dart';
import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/country_tile.dart';
import 'package:coronatracker/widgets/sliver_search_bar.dart';
import 'package:coronatracker/widgets/sorting_popup_button.dart';
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
  bool enabled = false;
  String filter = "";
  SortingType sortingType = SortingType.NAME;

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

    Widget sortButton = SortingPopupButton(
      groupValue: sortingType,
      onChanged: (SortingType sortingType) {
        setState(() {
          this.sortingType = sortingType;
          Navigator.pop(context);
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
              trailingIcon: enabled ? clearButton : sortButton,
              enabled: enabled,
              onTap: () async {
                await Future.delayed(Duration(milliseconds: 100));
                setState(() {
                  enabled = true;
                });
              },
              onChanged: (String value) {
                filter = value;
              },
              onSubmitted: (String value) {
                  filter = value;
              },
            ),
            Builder(
              builder: (context) {
                print('filter');
                return SliverList(
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
                );
              }
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
