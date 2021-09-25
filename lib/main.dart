import 'package:equipment/pages/purchase_process.dart';
import 'package:equipment/widget/tabs_screen.dart';
import 'package:equipment/pages/custody_details.dart';
import 'package:equipment/pages/login_page.dart';
import 'package:equipment/utils/HexColor.dart';
import 'package:equipment/utils/CustomColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
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
          //  primarySwatch: MaterialColor(HexColor.fromHex("#25476a").value,getSwatch(HexColor.fromHex("#25476a"))),
          colorScheme: ColorScheme(
              primary: HexColor.fromHex("#25476a"),
              primaryVariant: HexColor.fromHex("#00203f"),
              onPrimary: Colors.white,
              secondary: Colors.cyan,
              secondaryVariant: Colors.cyan,
              onSecondary: Colors.black,
              onError: Colors.red,
              error: Colors.red,
              background: Colors.white,
              surface: Colors.white,
              onBackground: Colors.grey,
              onSurface: Colors.black,
              brightness: Brightness.light),
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
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'AR'),
      ],
      // localizationsDelegates: [
      //  // AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
          return supportedLocales.first;
        }
      },
      home: LoginPage(),
      routes: {
        TabsScreen.routeName: (_) => TabsScreen(),
        CustodyDetails.routeName: (_) => CustodyDetails(),
        PurchaseProcess.routeName: (_) => PurchaseProcess(),
      },
    );
  }
}
