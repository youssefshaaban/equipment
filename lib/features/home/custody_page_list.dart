import 'package:equipment/features/home/custody_controller.dart';
import 'package:equipment/features/home/custody_state.dart';
import 'package:equipment/model/Equipment.dart';
import 'package:equipment/widget/item_custody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CustodyPageList extends StatefulWidget {
   final int status;
   CustodyPageList({required this.status});

  @override
  State<CustodyPageList> createState() => _CustodyPageListState(status: status);
}

class _CustodyPageListState extends State<CustodyPageList> with AutomaticKeepAliveClientMixin{
  final int status;
  _CustodyPageListState({required this.status});
  final List<Equipment> list = getData();
  final controller = Get.put(CustodyController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCustodyByStatus(status);
  }
  @override
  Widget build(BuildContext context) {
      print('>>> Build Car Page');
   // super.build(context);
    return
      Obx((){
          if(controller.state is CustodyLoading){
            return Center(child: CircularProgressIndicator());
         }else if(controller.state is CustodySuccess){
            final custodies=(controller.state as CustodySuccess);
            return  Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return ItemCustody(
                    custody:custodies.custodies[index],
                  );
                },
                itemCount: custodies.custodies.length,
              ),
            );
          }else{
            return Center(child: Text("kkkkkkkkkkkkk"),);
          }
      });

  }

  @override
  bool get wantKeepAlive => true;
}
