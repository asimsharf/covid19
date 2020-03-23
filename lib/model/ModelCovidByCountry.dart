/*
* @[Author] [Asim Sharfeldin Mohamed]
* @[Phone] [+249913000262]
* @[Company] [SudaGoras]
* @[Email] [asimsharf@gmail.com]
* @[WebSite] [https://www.sudagoras.com]
*/

// To parse this JSON data, do
//     final modelCovidByCountry = modelCovidByCountryFromJson(jsonString);

import 'dart:convert';

ModelCovidByCountry modelCovidByCountryFromJson(String str) =>
    ModelCovidByCountry.fromMap(json.decode(str));

String modelCovidByCountryToJson(ModelCovidByCountry data) =>
    json.encode(data.toMap());

class ModelCovidByCountry {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;

  ModelCovidByCountry({
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

  factory ModelCovidByCountry.fromMap(Map<String, dynamic> json) =>
      ModelCovidByCountry(
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
