class CovidModel {
  String? covidvariant;
  int? confirmedcases;
  int? recoveredcases;

  CovidModel({this.covidvariant, this.confirmedcases, this.recoveredcases});

  factory CovidModel.fromJSON(Map map) {
    return CovidModel(
      covidvariant: map["delta"],
      confirmedcases: map["confirmed"],
      recoveredcases: map["recoverd"],
    );
  }
}
