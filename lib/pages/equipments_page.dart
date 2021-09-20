import 'package:equipment/pages/equipments_page_list.dart';
import 'package:flutter/material.dart';
class EquipmentPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(title: Text('Equipment'),
        centerTitle: true,
        bottom: TabBar(onTap: (index){
          // section tab
        },
        tabs: [
          Tab(text: "Opened",),
          Tab(text: "Closed",),
          Tab(text: "Deleted",),
          Tab(text: "Finished",)
        ],
        ),
        ),
        body: TabBarView(
          children: [
            EquipmentPageList(),
            EquipmentPageList(),
            EquipmentPageList(),
            EquipmentPageList(),
          ],
        ),
      ),
    );
  }


}