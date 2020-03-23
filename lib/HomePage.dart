/*
* @[Author] [Asim Sharfeldin Mohamed]
* @[Phone] [+249913000262]
* @[Company] [SudaGoras]
* @[Email] [asimsharf@gmail.com]
* @[WebSite] [https://www.sudagoras.com]
*/

import 'package:covid19/DetailsPage.dart';
import 'package:covid19/services/provider_services.dart';
import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _Level3State createState() => _Level3State();
}

class _Level3State extends State<HomePage> {
  String _name = 'لا يوجد بلد بهذا اﻹسم !';

  var isInit = true;
  var isLoading = false;
  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<ProviderServices>(context).fetchCovidCountries().then((_) {
        setState(() {
          isLoading = false;
        });
      });

      Provider.of<ProviderServices>(context).fetchCovidAll().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext ctx) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("كورونا حول العالم"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "عالمياً",
              ),
              Tab(
                text: "الدول",
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () => _showMaterialSearch(context),
            icon: Icon(Icons.search),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Consumer<ProviderServices>(
              builder: (ctx, covidAllData, child) {
                return isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView(
                        children: <Widget>[
                          Card(
                            elevation: 3.0,
                            child: ListTile(
                              title: Text("حالات"),
                              subtitle: Text("عالمياً"),
                              trailing: Text(covidAllData.getCovidAllList.cases
                                  .toString()),
                            ),
                          ),
                          Card(
                            elevation: 3.0,
                            child: ListTile(
                              title: Text("الوفيات"),
                              subtitle: Text("عالمياً"),
                              trailing: Text(covidAllData.getCovidAllList.deaths
                                  .toString()),
                            ),
                          ),
                          Card(
                            elevation: 3.0,
                            child: ListTile(
                              title: Text("المكتشفه"),
                              subtitle: Text("عالمياً"),
                              trailing: Text(covidAllData
                                  .getCovidAllList.recovered
                                  .toString()),
                            ),
                          ),
                        ],
                      );
              },
            ),
            Consumer<ProviderServices>(
              builder: (ctx, covidCountriesData, child) {
                return isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount:
                            covidCountriesData.getCovidCountriesList.length,
                        itemBuilder: (ctx, i) {
                          var _obj =
                              covidCountriesData.getCovidCountriesList[i];
                          return Card(
                            elevation: 3.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => DetailsPage(
                                        value: _obj.country,
                                      ),
                                    ),
                                  );
                                },
//                            leading: SvgPicture.network(
//                              'https://restcountries.eu/data/sdn.svg',
//                              semanticsLabel: 'A shark?!',
//                              placeholderBuilder: (BuildContext context) =>
//                                  Container(
//                                padding: const EdgeInsets.all(5.0),
//                                child: const CircularProgressIndicator(),
//                              ),
//                            ),
                                title: Container(
                                  height: 40.0,
                                  color: Colors.redAccent,
                                  child: Center(
                                    child: Text(
                                      _obj.country,
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("الحالات"),
                                          Text(_obj.cases.toString()),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "حالات اليوم",
                                            style: TextStyle(
                                              color: _obj.todayCases > 100
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            _obj.todayCases.toString(),
                                            style: TextStyle(
                                              color: _obj.todayCases > 100
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("وفيات"),
                                          Text(_obj.deaths.toString()),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "وفيات اليوم",
                                            style: TextStyle(
                                              color: _obj.todayDeaths > 100
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            _obj.todayDeaths.toString(),
                                            style: TextStyle(
                                              color: _obj.todayDeaths > 100
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "تعافى",
                                            style: TextStyle(
                                              color: _obj.todayDeaths > 100
                                                  ? Colors.green
                                                  : Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            _obj.deaths.toString(),
                                            style: TextStyle(
                                              color: _obj.todayDeaths > 100
                                                  ? Colors.green
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("نشيط"),
                                          Text(_obj.active.toString()),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("حرج"),
                                          Text(
                                            _obj.critical.toString(),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("حالات لكل مليون"),
                                          Text(_obj.casesPerOneMillion
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            _showMaterialSearch(context);
          },
          tooltip: 'بحث',
          child: Icon(Icons.search),
        ),
      ),
    );
  }

  _buildMaterialSearchPage(BuildContext context) {
    var countryName =
        Provider.of<ProviderServices>(context, listen: false).getCountryName;
    return MaterialPageRoute<String>(
      settings: RouteSettings(
        name: 'material_search',
        isInitialRoute: false,
      ),
      builder: (BuildContext context) {
        return Material(
          child: MaterialSearch<String>(
            placeholder: 'بحث بإسم البلد',
            results: countryName
                .map(
                  (String v) => new MaterialSearchResult<String>(
                    icon: Icons.location_city,
                    value: v,
                    text: "$v",
                  ),
                )
                .toList(),
            filter: (dynamic value, String criteria) {
              return value.toLowerCase().trim().contains(
                    new RegExp(r'' + criteria.toLowerCase().trim() + ''),
                  );
            },
            onSelect: (dynamic value) => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => DetailsPage(
                  value: value,
                ),
              ),
            ),
            onSubmit: (String value) => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => DetailsPage(
                  value: value,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      setState(() => _name = value as String);
    });
  }
}
