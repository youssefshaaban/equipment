import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/pages/custody_page_list.dart';
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
                        text: S.of(context)!.equipmentPageNew,
                      ),
                      Tab(
                        text: S.of(context)!.equipmentPageOpened,
                      ),
                      Tab(
                        text: S.of(context)!.equipmentPageClosed,
                      ),
                      Tab(
                        text: S.of(context)!.equipmentPageDeleted,
                      ),
                      Tab(
                        text: S.of(context)!.equipmentPageFinished,
                      ),
                      Tab(
                        text: S.of(context)!.equipmentPageRejected,
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
