/*
* @[Author] [Asim Sharfeldin Mohamed]
* @[Phone] [+249913000262]
* @[Company] [SudaGoras]
* @[Email] [asimsharf@gmail.com]
* @[WebSite] [https://www.sudagoras.com]
*/
import 'package:covid19/model/ModelCovidAll.dart';
import 'package:covid19/model/ModelCovidByCountry.dart';
import 'package:covid19/model/ModelCovidCountries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderServices with ChangeNotifier {
  static const API = 'https://coronavirus-19-api.herokuapp.com';
  static const header = {'Content-Type': 'application/json'};

  ///[Start]
  /// List of Covid ModelCovidCountries
  ///[Start]
  List<String> countryName = [];
  List<ModelCovidCountries> getListCorona = [];
  Future<List<ModelCovidCountries>> fetchCovidCountries() {
    return http.get(API + "/countries", headers: header).then((data) {
      if (data.statusCode == 200) {
        final modelCovid = modelCovidFromJson(data.body);
        modelCovid.forEach((e) {
          countryName.add(e.country);
        });
        getListCorona = modelCovid;
      }
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  List<String> get getCountryName => countryName;
  List<ModelCovidCountries> get getCovidCountriesList => getListCorona;

  ///[Start]
  /// List of Covid ModelCovidAll
  ///[Start]
  ModelCovidAll getListCovidAll;
  Future<void> fetchCovidAll() {
    return http.get(API + "/all", headers: header).then((data) {
      if (data.statusCode == 200) {
        final modelCovidAll = modelCovidAllFromJson(data.body);

        getListCovidAll = modelCovidAll;
      }
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  ModelCovidAll get getCovidAllList => getListCovidAll;

  ///[Start]
  /// List of Covid ModelCovidByCountry
  ///[Start]
  ModelCovidByCountry getListCovidByCountry;
  Future<void> fetchCovidByCountry(String countryName) {
    return http
        .get(API + "/countries/$countryName", headers: header)
        .then((data) {
      if (data.statusCode == 200) {
        final modelCovidByCountry = modelCovidByCountryFromJson(data.body);
        getListCovidByCountry = modelCovidByCountry;
      }
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  ModelCovidByCountry get getCovidByCountryList => getListCovidByCountry;
}
