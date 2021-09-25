
import 'package:equipment/pages/equipments_page.dart';
import 'package:equipment/pages/profile_page.dart';
import 'package:flutter/material.dart';
class TabsScreen extends StatefulWidget {
  static  String routeName='/tabsScreenRouteName';
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> pages=[] ;
  int _selectedItem = 0;

  @override
  void initState() {
    pages=
    [
      {
        'page': EquipmentPage(),
        'title': 'Custody',
      },
      {
        'page': ProfilePage(),
        'title': 'Profile',
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
        title: Text(pages[_selectedItem]['title']
        ),),
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
                  size: 20,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 20,
                ),
                label: 'Profile',
              ),
            ]
          )
    )
    );
  }
}
