import 'dart:io';

import 'package:equipment/features/detail_custody/custody_controller_status.dart';
import 'package:equipment/features/detail_custody/custody_operation_statr.dart';
import 'package:equipment/features/detail_custody/custody_status_state.dart';
import 'package:equipment/features/home/custody_controller.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/features/purchase/purchase_process_page.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:equipment/widget/item_purchase_details_widget.dart';
import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils.dart';

class CustodyDetails extends StatefulWidget {
  static const routeName = '/custodyDetailsRouteName';

  @override
  State<CustodyDetails> createState() => _CustodyDetailsState();
}

class _CustodyDetailsState extends State<CustodyDetails> {
  late CustodyDetailController _controller;
  TextEditingController amount = new TextEditingController();
  TextEditingController details = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                      buildCardInfo(context),
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

  Widget buildCardInfo(BuildContext context) {
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
                  S.of(context)!.itemCustodyPageReferenceNum,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(data.referenceCode == null ? "" : data.referenceCode!,
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
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text(
                    data.custodyDate == null
                        ? ""
                        : data.custodyDate!.split('T')[0],
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
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text("${data.totalAmount} ${S.of(context)!.currency}",
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
                Text("${S.of(context)!.custodyDetailsRemainAmount} : ",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 5,
                ),
                Text("${data.totalSpent.toString()} ${S.of(context)!.currency}",
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
                  onPressed: () async {
                    var result = await Navigator.of(context).pushNamed(
                        PurchaseProcessPage.routeName,
                        arguments: {'custodyId': data.custodyId});
                    if (result == true) {
                      _controller.getCustodyOperation(data.custodyId);
                    }
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
                  showRaiseAlert(context);
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
                  clickDelete: (detail) {
                    showDeleteAlert(context, detail);
                  },
                  clickEdit: (item) {},
                );
              }));
    } else {
      return Container();
    }
  }



  showRaiseAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(S.of(context)!.alertMessageOfCloseCustody),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: new Text(S.of(context)!.cancelButton),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: new Text(S.of(context)!.okButton),
                  onPressed: () {
                    Navigator.of(context).pop();
                    changeStatus(2, context);
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  showDeleteAlert(
    BuildContext context,
      CustodyOper custodyOper
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(S.of(context)!.txtMsgDeleteOperation),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: new Text(S.of(context)!.cancelButton),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: new Text(S.of(context)!.okButton),
                  onPressed: () {
                    Navigator.of(context).pop();
                    deleteProcess(custodyOper.operId!);
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Future showSheet(
    BuildContext context,
    double operAmount,
    String? operDetails,
    List<ImagesData>? images,
  ) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * .5,
            color: Colors.grey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: amount,
                        initialValue: operAmount.toString(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter a valid value";
                          } else
                            return null;
                        },
                      ),
                      SizedBox(height: 3),
                      TextFormField(
                        controller: details,
                        initialValue: operDetails.toString(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter a valid value";
                          } else if (value.length < 5) {
                            return "description can't be less than 5 chars";
                          } else
                            return null;
                        },
                      ),
                      SizedBox(height: 3),
                      if (images!.isNotEmpty)
                        ElevatedButton(
                            onPressed: () => showPhotoSheet(context),
                            child: Text('Add Photo')),
                      images.isEmpty
                          ? InkWell(
                              onTap: () => showPhotoSheet(context),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.grey,
                                child:
                                    Icon(Icons.camera_alt, color: Colors.black),
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () => showPhotoSheet(context),
                                    child: Container(
                                      height: 60,
                                      width: 70,
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: FadeInImage(
                                            image: NetworkImage(
                                                images[index].imageData),
                                            placeholder: AssetImage(
                                                "assets/images/bg_no_image.png"),
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                  'assets/images/bg_no_image.png',
                                                  fit: BoxFit.cover);
                                            },
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("Cancel")),
                          ElevatedButton(
                              onPressed: () {
                                editData();
                                Navigator.of(context).pop();
                              },
                              child: Text("Save")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future showPhotoSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 180,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 40
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          getImage(ImageSource.camera);
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                              child: Text(
                            S.of(context)!.openCamOrGallery,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.photo,
                        size: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          getImage(ImageSource.gallery);
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                              child: Text(
                            S.of(context)!.openCamOrGallery,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                ],
              )),
            ),
          );
        });
  }

  Future getImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    await imagePicker.pickImage(source: source).then((value) =>
        cropImage(imageFile: File(value!.path))
            .then((value) => compressFile(value!).then((value) {
                  var fileUnit8 = value.readAsBytesSync();
                  //addImage(base64Encode(fileUnit8));
                })));
  }

  void editData() {}

  void deleteProcess(int id) {
    progressDialogue(context);
    _controller.deleteOperation(id).then((value){
      if(value is DeleteOperationStatusSuccess){
        Navigator.of(context).pop();
        _controller.getCustodyOperation(data.custodyId);
      }else if(value is DeleteOperationStatusFailure){
        Navigator.of(context).pop();
        customSnackBar(context,msg:value.error);
      }
    });
  }
}
