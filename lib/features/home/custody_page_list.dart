import 'package:equipment/features/detail_custody/custody_details_page.dart';
import 'package:equipment/features/home/custody_controller.dart';
import 'package:equipment/features/home/custody_state.dart';

import 'package:equipment/widget/item_custody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';


class CustodyPageList extends StatefulWidget {
  static const routeName = '/custody_list';
  @override
  State<CustodyPageList> createState() => _CustodyPageListState();
}

class _CustodyPageListState extends State<CustodyPageList> {
  late CustodyController controller;
  late String title;
  late int status;
  var _initDataLoded = false;
  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    if (!_initDataLoded) {
      _initDataLoded = true;
      controller = Get.put(CustodyController());
      final routesArgument =
      ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      title = routesArgument['title'];
      status = routesArgument['status'];
      controller.getCustodyByStatus(status);
    }
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    super.dispose();
    controller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    print('>>>>>>>>>>>>>>>>>>>>build $status<<<<<<<<<<<<<<<<<');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Obx(() {
        if (controller.state is CustodyLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.state is CustodySuccess) {
          final custodies = (controller.state as CustodySuccess);
          return Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return InkWell(
                  child: ItemCustody(
                    custody: custodies.custodies[index], status: status,click: () async{
                   var res= await Navigator.of(context).pushNamed(CustodyDetails.routeName,arguments: {'data':custodies.custodies[index]});
                   if(res is bool && res==true){
                     controller.getCustodyByStatus(status);
                   }
                  },),
                );
              },
              itemCount: custodies.custodies.length,
            ),
          );
        } else {
          return Center(
            child: Text("kkkkkkkkkkkkk"),
          );
        }
      }),
    );
  }

}
