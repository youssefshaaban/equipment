
import 'package:equipment/model/tabs_screen.dart';
import 'package:equipment/pages/custody_details.dart';
import 'package:equipment/pages/login_page.dart';
import 'package:equipment/utils/HexColor.dart';
import 'package:equipment/utils/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: MaterialColor(HexColor.fromHex("#25476a").value,getSwatch(HexColor.fromHex("#25476a"))),
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              button: TextStyle(color: Colors.white),
              headline1: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      supportedLocales: [
        Locale('en','US'),
        Locale('ar','AR'),
      ],
      localizationsDelegates: [
       // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale,supportedLocales){
        for(var supportedLocale in supportedLocales){
          if(supportedLocale.languageCode==locale!.languageCode &&
              supportedLocale.countryCode==locale.countryCode){
            return supportedLocale;
          }
          return supportedLocales.first;
        }
    },
      home: LoginPage(),
      routes: {
        TabsScreen.routeName:(_)=> TabsScreen(),
        CustodyDetails.routeName:(_)=>CustodyDetails(),
      },
    );
  }
}

