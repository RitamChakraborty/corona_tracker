import 'package:coronatracker/bloc/country_search_bloc.dart';
import 'package:coronatracker/data/sorting.dart';
import 'package:coronatracker/models/country.dart';
import 'package:coronatracker/providers/service_provider.dart';
import 'package:coronatracker/widgets/country_tile.dart';
import 'package:coronatracker/widgets/country_tile_demo.dart';
import 'package:coronatracker/widgets/sliver_search_bar.dart';
import 'package:coronatracker/widgets/sliver_search_bar_demo.dart';
import 'package:coronatracker/widgets/sorting_popup_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  bool enabled = false;
  String filter = "";
  SortingType sortingType = SortingType.NAME;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    CountrySearchBloc countrySearchBloc =
        Provider.of<CountrySearchBloc>(context);
    ValueNotifier<bool> provider = Provider.of<ValueNotifier<bool>>(context);
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    List<Country> countries = serviceProvider.countries;
    int countryCount = serviceProvider.global.affectedCountries;
    List<Widget> demoCountries = [];
    List<Widget> demoSlivers = [];

    if (countries == null) {
      refreshIndicatorKey.currentState?.show();
      demoCountries = List<Widget>.generate(
        countryCount,
        (index) => CountryTileDemo(
          index: index,
        ),
      ).toList();
      demoSlivers = [
        SliverSearchBarDemo(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return demoCountries[index];
            },
            childCount: countryCount,
          ),
        ),
      ];
    }

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

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          countrySearchBloc.add(FilterChangeEvent(filter: ""));
        });
      },
    );

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          key: refreshIndicatorKey,
          onRefresh: serviceProvider.fetchCountries,
          child: CustomScrollView(
            controller: scrollController,
            slivers: countries == null
                ? demoSlivers
                : <Widget>[
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
                        countrySearchBloc.add(FilterChangeEvent(
                          filter: value,
                        ));
                      },
                      onSubmitted: (String value) {
                        countrySearchBloc.add(FilterChangeEvent(
                          filter: value,
                        ));
                      },
                    ),
                    BlocBuilder<CountrySearchBloc, AbstractCountrySearchState>(
                      builder: (BuildContext context,
                          AbstractCountrySearchState state) {
                        List<Country> sortedCountries = countries;
                        sortedCountries.sort((Country a, Country b) {
                          switch (sortingType) {
                            case SortingType.NAME:
                              return a.country.compareTo(b.country);
                            case SortingType.CASES:
                              return b.cases.compareTo(a.cases);
                            case SortingType.DEATHS:
                              return b.deaths.compareTo(a.deaths);
                            case SortingType.ACTIVE:
                              return b.active.compareTo(a.active);
                            case SortingType.RECOVERED:
                              return b.recovered.compareTo(a.recovered);
                            default:
                              return 0;
                          }
                        });
                        if (enabled) {
                          if (state is FilterChangedState) {
                            filter = state.filter;
                          }
                        }

                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              Country country = countries[index];
                              if (filter.isEmpty) {
                                return CountryTile(
                                  country: country,
                                  sortingType: sortingType,
                                  index: index,
                                );
                              } else if (country.country
                                  .toLowerCase()
                                  .contains(filter)) {
                                return CountryTile(
                                  country: country,
                                  sortingType: sortingType,
                                );
                              } else {
                                return Container();
                              }
                            },
                            childCount: countryCount,
                          ),
                        );
                      },
                    )
                  ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
