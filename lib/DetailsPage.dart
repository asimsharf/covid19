/*
* @[Author] [Asim Sharfeldin Mohamed]
* @[Phone] [+249913000262]
* @[Company] [SudaGoras]
* @[Email] [asimsharf@gmail.com]
* @[WebSite] [https://www.sudagoras.com]
*/

import 'package:covid19/services/provider_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final String value;
  DetailsPage({this.value});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var isInit = true;
  var isLoading = false;
  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<ProviderServices>(context)
          .fetchCovidByCountry(widget.value)
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var coronaByCountryData =
        Provider.of<ProviderServices>(context).getCovidByCountryList;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.value),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Container(
                        height: 40.0,
                        color: Colors.redAccent,
                        child: Center(
                          child: Text(
                            coronaByCountryData.country,
                            style: Theme.of(context).textTheme.title.copyWith(
                                  color: Colors.white,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("الحالات"),
                              Text(coronaByCountryData.cases.toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "حالات اليوم",
                                style: TextStyle(
                                  color: coronaByCountryData.todayCases > 100
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                coronaByCountryData.todayCases.toString(),
                                style: TextStyle(
                                  color: coronaByCountryData.todayCases > 100
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("وفيات"),
                              Text(coronaByCountryData.deaths.toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "وفيات اليوم",
                                style: TextStyle(
                                  color: coronaByCountryData.todayDeaths > 100
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                coronaByCountryData.todayDeaths.toString(),
                                style: TextStyle(
                                  color: coronaByCountryData.todayDeaths > 100
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "تعافى",
                                style: TextStyle(
                                  color: coronaByCountryData.todayDeaths > 100
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                coronaByCountryData.deaths.toString(),
                                style: TextStyle(
                                  color: coronaByCountryData.todayDeaths > 100
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("نشيط"),
                              Text(coronaByCountryData.active.toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("حرج"),
                              Text(coronaByCountryData.critical.toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("حالات لكل مليون"),
                              Text(coronaByCountryData.casesPerOneMillion
                                  .toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
