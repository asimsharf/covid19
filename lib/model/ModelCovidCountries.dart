/*
* @[Author] [Asim Sharfeldin Mohamed]
* @[Phone] [+249913000262]
* @[Company] [SudaGoras]
* @[Email] [asimsharf@gmail.com]
* @[WebSite] [https://www.sudagoras.com]
*/

// To parse this JSON data, do
//     final modelCovid = modelCovidFromJson(jsonString);

import 'dart:convert';

List<ModelCovidCountries> modelCovidFromJson(String str) =>
    List<ModelCovidCountries>.from(
        json.decode(str).map((x) => ModelCovidCountries.fromMap(x)));

String modelCovidToJson(List<ModelCovidCountries> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ModelCovidCountries {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;

  ModelCovidCountries({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
  });

  factory ModelCovidCountries.fromMap(Map<String, dynamic> json) =>
      ModelCovidCountries(
        country: json["country"] == null ? null : json["country"],
        cases: json["cases"] == null ? null : json["cases"],
        todayCases: json["todayCases"] == null ? null : json["todayCases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"] == null ? null : json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"] == null
            ? null
            : json["casesPerOneMillion"],
      );

  Map<String, dynamic> toMap() => {
        "country": country == null ? null : country,
        "cases": cases == null ? null : cases,
        "todayCases": todayCases == null ? null : todayCases,
        "deaths": deaths == null ? null : deaths,
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        "recovered": recovered == null ? null : recovered,
        "active": active == null ? null : active,
        "critical": critical == null ? null : critical,
        "casesPerOneMillion":
            casesPerOneMillion == null ? null : casesPerOneMillion,
      };
}
