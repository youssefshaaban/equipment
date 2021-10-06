import 'package:equipment/features/detail_custody/custody_controller_status.dart';
import 'package:equipment/features/detail_custody/custody_operation_statr.dart';
import 'package:equipment/features/detail_custody/custody_status_state.dart';
import 'package:equipment/features/home/custody_controller.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/model/Details.dart';
import 'package:equipment/features/purchase/purchase_process.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/widget/item_purchase_details_widget.dart';
import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustodyDetails extends StatefulWidget {
  static const routeName = '/custodyDetailsRouteName';

  @override
  State<CustodyDetails> createState() => _CustodyDetailsState();
}

class _CustodyDetailsState extends State<CustodyDetails> {
  late CustodyDetailController _controller;

  late CustodyData data;
  var _initDataLoded = false;

  @override
  void didChangeDependencies() {
    if (!_initDataLoded) {
      _initDataLoded = true;
      _controller = Get.put(CustodyDetailController());
      final routesArgument =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      data = routesArgument['data'];
      _controller.getCustodyOperation(data.custodyId);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context)!.custodyDetailsAppBarTitle),
        ),
        body: Stack(
          children: [
            Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildCardInfo(
                          context,
                          data.custodyStatus.toString(),
                          data.custodyDate!,
                          data.totalAmount.toString(),
                          data.totalAmount.toString()),
                      Center(
                        child: Obx(
                          () {
                            return buildListCustodyFromApi(context);
                          },
                        ),
                      )
                    ],
                  ),
                )),
            buildAlign(data.custodyStatus!, context)
          ],
        ));
  }

  Widget buildCardInfo(
    BuildContext context,
    String custodyNumber,
    String date,
    String cost,
    String remainAmount,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  S.of(context)!.custodyDetailsCustodyNumber,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(custodyNumber,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(S.of(context)!.custodyDetailsDate,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(date,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(S.of(context)!.custodyDetailsCost,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(cost,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(S.of(context)!.custodyDetailsRemainAmount,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(remainAmount,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(S.of(context)!.custodyDetailsCustodyNumber1,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(S.of(context)!.custodyDetailsValue5,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAlign(int status, BuildContext context) {
    if (status == 1) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add, size: 20, color: Colors.white),
                  label: Text(
                    S.of(context)!.custodyDetailsAddButton,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {

                    Navigator.of(context).pushNamed(PurchaseProcess.routeName,arguments: {'custodyId':data.custodyId});
                  },
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                child: Text(
                  S.of(context)!.custodyDetailsRaisingButton,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  changeStatus(2, context);
                },
              ),
            ),
          ],
        ),
      );
    } else if (status == 0) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  child: Text(
                    S.of(context)!.acceptButton,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    changeStatus(1, context);
                  },
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text(
                  S.of(context)!.rejectButton,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  changeStatus(5, context);
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  progressDialogue(BuildContext context) {
    //set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    showDialog(
      //prevent outside touch
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: alert);
      },
    );
  }

  void changeStatus(status, BuildContext context) {
    progressDialogue(context);
    _controller
        .updateCustodyByStatus(status, data.custodyId)
        .then((value) async {
      Navigator.of(context).pop();
      if (value is StatusSuccess) {
        customSnackBar(context, msg: "success");
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.of(context).pop(true);
      } else if (value is StatusFailure) {
        customSnackBar(context, msg: value.error);
      }
    });
  }

  Widget buildListCustodyFromApi(BuildContext context) {
    if (_controller.stateOperation is OperationLoading) {
      return CircularProgressIndicator();
    } else if (_controller.stateOperation is CustodyOperationFailure) {
      customSnackBar(context,
          msg: (_controller.stateOperation as CustodyOperationFailure).error);
      return Container();
    } else if (_controller.stateOperation is CustodyOperationsSuccess) {
      var list =
          (_controller.stateOperation as CustodyOperationsSuccess).CustodyOpers;
      return Container(
          height: MediaQuery.of(context).size.height * .59,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ItemPurchaseDetailsWidget(
                  details: list[index],
                );
              }));
    } else {
      return Container();
    }
  }
}
