/*
* @[Author] [Asim Sharfeldin Mohamed]
* @[Phone] [+249913000262]
* @[Company] [SudaGoras]
* @[Email] [asimsharf@gmail.com]
* @[WebSite] [https://www.sudagoras.com]
*/

// To parse this JSON data, do
//     final modelCovidAll = modelCovidAllFromJson(jsonString);

import 'dart:convert';

ModelCovidAll modelCovidAllFromJson(String str) =>
    ModelCovidAll.fromMap(json.decode(str));

String modelCovidAllToJson(ModelCovidAll data) => json.encode(data.toMap());

class ModelCovidAll {
  int cases;
  int deaths;
  int recovered;

  ModelCovidAll({
    this.cases,
    this.deaths,
    this.recovered,
  });

  factory ModelCovidAll.fromMap(Map<String, dynamic> json) => ModelCovidAll(
        cases: json["cases"] == null ? null : json["cases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
      );

  Map<String, dynamic> toMap() => {
        "cases": cases == null ? null : cases,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
      };
}
