import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/features/home/custody_page_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CustodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustodyHomeController());
    return Scaffold(
        body: Column(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 150
          ),
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Theme.of(context).colorScheme.primary,

            child: TabBar(
                controller: controller.tabController,
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
          controller: controller.tabController,
          children: [
            // CustodyPageList(status: 6),
            // CustodyPageList(status: 1),
            // CustodyPageList(status: 2),
            // CustodyPageList(status: 3),
            // CustodyPageList(status: 4),
            // CustodyPageList(status: 5),
          ],
        ))
      ],
    ));
  }
}

class CustodyHomeController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 6);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
