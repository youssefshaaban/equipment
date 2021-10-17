

import 'dart:convert';
import 'dart:io';

import 'package:equipment/features/detail_custody/custody_controller_status.dart';
import 'package:equipment/features/purchase/purchase_controller.dart';
import 'package:equipment/features/purchase/purchase_state.dart';
import 'package:equipment/localization/generated/l10n.dart';

import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_data.dart';
import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils.dart';

class EditCustodyDetails extends StatefulWidget {
  static const routeName="/ern";
  CustodyOper details;


  EditCustodyDetails({required this.details}); //const EditCustodyDetails(CustodyOper details, {Key? key}) : super(key: key);

  @override
  _EditCustodyDetailsState createState() => _EditCustodyDetailsState();
}

class _EditCustodyDetailsState extends State<EditCustodyDetails> {

  TextEditingController costController=TextEditingController();
  TextEditingController invoiceController=TextEditingController();
  TextEditingController amountController=TextEditingController();
  TextEditingController descController=TextEditingController();
  CustodyDetailController _controller=CustodyDetailController();
  final _formKey = GlobalKey<FormState>();
  List<UploadImageData> imageData = [];
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  //late CustodyOper data;


  Future showPhotoImage(BuildContext context) {
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
                                    "open",
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
                                    "open",
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
          addImage(base64Encode(fileUnit8));
        })));
  }

  addImage(String base64) async {
    progressDialogue(context);
    var uploadImage = await _purchaseController.uploadImage(base64);
    if (uploadImage is ImageUploadSuccess) {
      setState(() {
        imageData.add(uploadImage.uploadImageData);
        customSnackBar(context, msg: "Uploaded Successfully");
        Navigator.of(context).pop();
      });
    } else if (uploadImage is ImageUploadFailure) {
      customSnackBar(context, msg: uploadImage.error);
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    //final routeArgument=ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //data = routeArgument['details'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.editAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height:10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: invoiceController,
                  validator: (value){
                    if(value!.isEmpty){
                      return S.of(context)!.editCostValueValidation;
                    }
                    else
                      return null;
                  },
                  decoration:InputDecoration(
                      hintText: S.of(context)!.editCostTF,
                      border:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      )
                  ),
                ),
                const SizedBox(height:10),
                TextFormField(
                    keyboardType: TextInputType.number,
                    controller: costController,
                    //initialValue: widget.details.operAmount.toString(),
                    validator: (value){
                      if(value!.isEmpty){
                        return S.of(context)!.editAmountValueValidation;
                      }
                      else
                        return null;
                    },
                    decoration: InputDecoration(
                        hintText: S.of(context)!.editAmountTF,
                        border:OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    )
                ),
                const SizedBox(height:10),

                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return S.of(context)!.editDescValueValidation;
                    }
                    else if(value.length<5) {
                      return S.of(context)!.editDescValueValidation1;
                    }
                  },
                  controller: descController,
                  //initialValue: "descr",
                  decoration: InputDecoration(
                      hintText: S.of(context)!.editDescTF,
                      border:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      )
                  ),
                  maxLines: 5,
                  minLines: 3,
                ),
                if(widget.details.images!.isNotEmpty)
                  ElevatedButton(onPressed: ()=>showPhotoImage(context), child: Text(S.of(context)!.editAddPhotoButton)),
                widget.details.images!.isEmpty
                    ? InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    height: 250,
                    width: MediaQuery.of(context).size.width * .8,
                    child: Icon(
                      Icons.camera_alt,
                      size: 60,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => showPhotoImage(context),
                )
                    : Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.details.images!.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              margin: EdgeInsets.all(5),
                              child:
                              FadeInImage(
                                image: NetworkImage(
                                    widget.details.images![index].imageData),
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
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                  onPressed: () => _deletePhoto(index),
                                  icon: Icon(Icons.delete,
                                      size: 30, color: Colors.red)),
                            )
                          ],
                        );
                      }),
                ),
                const SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: ()=>Navigator.of(context).pop(),
                    child: Text(S.of(context)!.editCancelButton),),
                    ElevatedButton(
                      onPressed: (){
                        editProcess();
                      },
                      child: Text(S.of(context)!.editSaveButton),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  _deletePhoto(int index) {
    setState(() {
      imageData.removeAt(index);
    });
  }

  Future<void> editProcess() async {
    if(_formKey.currentState!.validate()){
      progressDialogue(context);
      final prefs = await SharedPreferences.getInstance();
      var user_id = prefs.getString("user_id");
      var custodyOper = new CustodyOper(
          operAmount: double.parse(costController.text),
          operDetails: descController.text,
          custodyId: widget.details.custodyId,
          invoiceNumber: invoiceController.text,
          driverUserId: int.parse(user_id!));
      _purchaseController
          .submitOperationData(
          custodyOper: custodyOper,
          imageData: imageData
              .map((e) => ImagesData(imageData: e.fullPath))
              .toList()).then((value) async{
        Navigator.of(context).pop();
        if (value is PurchaseSuccess) {
          customSnackBar(context, msg: "success");
          await Future.delayed(const Duration(milliseconds: 500));
          Navigator.of(context).pop(true);
        } else if (value is PurchaseFailure) {
          customSnackBar(context, msg: value.error);
        }
      });

    }


  }


  /*void deleteProcess(int id) {
    progressDialogue(context);
    _controller.deleteOperation(id).then((value){
      if(value is DeleteOperationStatusSuccess){
        Navigator.of(context).pop();
        _controller.getCustodyOperation(data.custodyId);
      }else if(value is DeleteOperationStatusFailure){
        Navigator.of(context).pop();
        customSnackBar(context,msg:value.error);
      }
    });*/
}

