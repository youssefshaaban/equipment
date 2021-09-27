import 'package:equipment/pages/equipments_page_list.dart';
import 'package:flutter/material.dart';

class EquipmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 150),
              child: Material(
                color: Theme.of(context).colorScheme.primary,
                child: TabBar(
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: "New",
                      ),
                      Tab(
                        text: "Opened",
                      ),
                      Tab(
                        text: "Closed",
                      ),
                      Tab(
                        text: "Deleted",
                      ),
                      Tab(
                        text: "Finished",
                      ),
                      Tab(
                        text: "Rejected",
                      )
                    ]),
              ),
            ),
            Expanded(
                child: TabBarView(
              children: [
                EquipmentPageList(),
                EquipmentPageList(),
                EquipmentPageList(),
                EquipmentPageList(),
                EquipmentPageList(),
                EquipmentPageList(),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
