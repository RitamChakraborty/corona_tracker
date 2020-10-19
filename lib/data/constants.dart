import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String GLOBAL_API = "https://disease.sh/v3/covid-19/all";
const String CONTINENT_API = "https://disease.sh/v3/covid-19/continents";
const String COUNTRY_API = "https://disease.sh/v3/covid-19/countries";
const String GLOBAL_HISTORY_API =
    "https://disease.sh/v3/covid-19/historical/all";
const String COUNTRY_HISTORY_API = "https://disease.sh/v3/covid-19/historical/";

final NumberFormat NUMBER_FORMAT = NumberFormat.compact(locale: "en_us");
final ShapeBorder SHAPE = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);
