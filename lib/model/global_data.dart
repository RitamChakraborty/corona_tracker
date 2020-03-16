class GlobalData {
  final int cases, deaths, recovered;

  GlobalData({this.cases, this.deaths, this.recovered});

  GlobalData.fromJson(Map<String, dynamic> data)
      : cases = data['cases'],
        deaths = data['deaths'],
        recovered = data['recovered'];
}
