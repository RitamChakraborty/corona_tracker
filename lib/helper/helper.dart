import 'package:coronatracker/model/country_data.dart';

/// Store the types of sorting
enum SortingType {
  CASES,
  TODAY_CASES,
  DEATHS,
  TODAY_DEATHS,
  ACTIVE,
  CRITICAL,
  RECOVERED,
  NAME
}

/// Sort the country list accordingly
List<CountryData> sortList(List<CountryData> list, SortingType type) {
  switch (type) {
    case SortingType.CASES:
      list.sort((a, b) => b.cases.compareTo(a.cases));
      break;
    case SortingType.TODAY_CASES:
      list.sort((a, b) => b.todayCases.compareTo(a.todayCases));
      break;
    case SortingType.DEATHS:
      list.sort((a, b) => b.deaths.compareTo(a.deaths));
      break;
    case SortingType.TODAY_DEATHS:
      list.sort((a, b) => b.todayDeaths.compareTo(a.todayDeaths));
      break;
    case SortingType.ACTIVE:
      list.sort((a, b) => b.active.compareTo(a.active));
      break;
    case SortingType.CRITICAL:
      list.sort((a, b) => b.critical.compareTo(a.critical));
      break;
    case SortingType.RECOVERED:
      list.sort((a, b) => b.recovered.compareTo(a.recovered));
      break;
    case SortingType.NAME:
      list.sort((a, b) => a.country.compareTo(b.country));
      break;
  }

  return list;
}
