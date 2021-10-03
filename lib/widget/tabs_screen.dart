
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/localization/language_constants.dart';
import 'package:equipment/localization/languages.dart';
import 'package:equipment/features/home/custody_page.dart';
import 'package:equipment/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class TabsScreen extends StatefulWidget {
  static  String routeName='/tabsScreenRouteName';
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }



  List<Map<String, dynamic>> pages=[] ;
  int _selectedItem = 0;

  @override
  void initState() {
    pages=
    [
      {
        'page': CustodyPage(),
        'title':"Home" // S.of(context)!.firstTabAppBarTitle,
      },
      {
        'page': ProfilePage(),
        'title': "Profile" //S.of(context)!.secondTabAppBarTitle,
      }
    ];

    super.initState();
  }

  void _selectedWidget(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
        child: Scaffold(
        appBar: AppBar(
        title: Text(pages[_selectedItem]['title'],),
            actions:<Widget>[
              Padding(padding: const EdgeInsets.all(10),
                child: DropdownButton<Language>(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onChanged: (Language? language) {
                    _changeLanguage(language!);
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
              )
            ]
        ),
          body: pages[_selectedItem]['page'],
          bottomNavigationBar:BottomNavigationBar(
            onTap: _selectedWidget,
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedFontSize: 20,
            unselectedFontSize: 15,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            currentIndex: _selectedItem,
            items:[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: S.of(context)!.firstTabTitle,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                label: S.of(context)!.secondTabTitle,
              ),
            ]
          )
    )
    );
  }
}
