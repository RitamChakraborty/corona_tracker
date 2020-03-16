class CountryData {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;

  CountryData(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical});

  factory CountryData.fromJson(Map<String, dynamic> data) {
    var countryData = CountryData(
        country: data['country'],
        cases: data['cases'],
        todayCases: data['todayCases'],
        deaths: data['deaths'],
        todayDeaths: data['todayDeaths'],
        recovered: data['recovered'],
        active: data['active'],
        critical: data['critical']);
    print(countryData);
    return countryData;
  }

  @override
  String toString() {
    return country;
  }
}
