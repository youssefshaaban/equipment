import 'package:equipment/pages/purchase_process.dart';
import 'package:equipment/widget/tabs_screen.dart';
import 'package:equipment/pages/custody_details.dart';
import 'package:equipment/features/login/login_page.dart';
import 'package:equipment/utils/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/generated/l10n.dart';
import 'localization/language_constants.dart';

// void main() {
//   /*SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown
//   ]);*/
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if(this._locale==null){
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple)),
        ),
      );
    }

    else {
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
        locale: _locale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.elementAt(0);
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
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
