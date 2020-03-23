/*
* @[Author] [Asim Sharfeldin Mohamed]
* @[Phone] [+249913000262]
* @[Company] [SudaGoras]
* @[Email] [asimsharf@gmail.com]
* @[WebSite] [https://www.sudagoras.com]
*/
import 'package:covid19/services/provider_services.dart';
import 'package:covid19/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return ChangeNotifierProvider<ProviderServices>(
      create: (ctx) => ProviderServices(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Provider app',
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'jazeera',
        ),
        home: Splash(),
      ),
    );
  }
}
