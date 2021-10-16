import 'dart:convert';
import 'dart:io';
import 'package:equipment/features/purchase/purchase_controller.dart';
import 'package:equipment/features/purchase/purchase_state.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_data.dart';
import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils.dart';


class PurchaseProcessPage extends StatefulWidget {
  const PurchaseProcessPage({Key? key}) : super(key: key);
  static const tag = '/ppt';
  static const routeName = '/addNewPurchaseProcess';

  @override
  _PurchaseProcessPageState createState() => _PurchaseProcessPageState();
}

class _PurchaseProcessPageState extends State<PurchaseProcessPage> {
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final PurchaseController _purchaseController = Get.put(PurchaseController());
  final _formKey = GlobalKey<FormState>();

  // final PurchaseDataController _purchaseDataController =
  //     Get.put(PurchaseDataController());

  List<UploadImageData> imageData = [];
  late int custodyId;


  var _initDataLoded = false;

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

  //Image
  Future showBottomSheetImage(BuildContext context) {
    FocusScope.of(context).unfocus();
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
                            Icons.camera_alt, size: 40),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              getImage(ImageSource.camera);
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .3,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(child: Text(S.of(context)!.openCamOrGallery,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white),)),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.photo, size: 40),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              getImage(ImageSource.gallery);
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .3,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(child: Text(S.of(context)!.openCamOrGallery,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white),)),
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

  //Add a process
  Future showProcessSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Add To Process?",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,)),
                      const SizedBox(height:10),
                      Card(
                          child:Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(invoiceNumberController.text),
                          )
                      ),
                      const SizedBox(height:10),
                      Card(
                          child:Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(costController.text),
                          )
                      ),
                      const SizedBox(height:10),
                      Card(
                        child:Text(descController.text),
                      ),
                      const SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          ElevatedButton(
                              onPressed: ()=>Navigator.of(context).pop(),
                              child: Text('Cancel')
                          ),
                          ElevatedButton(
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  addPurchase(context);
                                }
                              },
                              child: Text('Add')
                          ),
                        ],
                      )
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.camera_alt, size: 40, color: Colors.black,),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              getImage(ImageSource.camera);
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .3,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(child: Text(S.of(context)!.openCamOrGallery,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white),)),
                            ),
                          )
                        ],
                      ),
                      Divider(thickness: 1, color: Colors.white,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.photo, size: 40, color: Colors.black,),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              getImage(ImageSource.gallery);
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .3,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(child: Text(S.of(context)!.openCamOrGallery,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    color: Colors.white),)),
                            ),
                          )
                        ],
                      ),*/
                    ],
                  )),
            ),
          );
        });
  }

  Future getImage(ImageSource source) async {

    final imagePicker = ImagePicker();
    await imagePicker.pickImage(source: source)
        .then((value) => cropImage(imageFile: File(value!.path))
        .then((value) => compressFile(value!)
        .then((value)  {
         var fileUnit8 = value.readAsBytesSync();
          addImage(base64Encode(fileUnit8));
        })));
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_initDataLoded) {
      final routeArguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      custodyId = routeArguments['custodyId'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.purchaseProcessAppBarTitle),
        actions: [
          TextButton(
              onPressed: (){
                //showProcessSheet(context);
                FocusScope.of(context).unfocus();
                addPurchase(context);
              },
              child: Text(
                S.of(context)!.purchaseProcessSave,
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /*TextFormField(
                    controller: costController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "valie can't be empty";
                      }
                      else
                        return null;
                    },
                    decoration:const InputDecoration(
                        hintText: 'shop name',
                        border:OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),*/
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: costController,
                    validator: (value){
                      if(value!.isEmpty){
                        return S.of(context)!.field_required;
                      }
                      else
                        return null;
                  },
                    decoration:InputDecoration(
                      hintText: "${S.of(context)!.invoiceNumber}",
                      border:OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black)
                      )
                    ),
                  ),
                  const SizedBox(height:5),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: invoiceNumberController,
                      validator: (value){
                        if(value!.isEmpty){
                          return S.of(context)!.field_required;
                        }
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                          hintText: S.of(context)!.textCost,
                          border:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)
                          )
                      )
                  ),
                  const SizedBox(height:5),

                  TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return S.of(context)!.field_required;
                          }
                          else if(value.length<5) {
                            return "value can't be less than 5 chars";
                          }
                        },
                        controller: descController,
                        decoration: InputDecoration(
                            hintText: S.of(context)!.itemPurchaseDescription,
                            border:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            )
                        ),
                      maxLines: 5,
                      minLines: 3,
                    ),
                /*  customEditText1(
                    keyboardType: TextInputType.number,
                    //hint: 'Cost',
                    hint: S.of(context)!.purchaseProcessCostHint,
                    controller: costController,
                  ),
                  const SizedBox(height: 10),
                  customEditText1(
                    keyboardType: TextInputType.number,
                    //hint: 'Amount',
                    hint: S.of(context)!.invoiceNumber,
                    controller: invoiceNumberController,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 140,
                    child: customEditText1(
                      //hint: 'Description',
                      isTextArea: true,
                      hint: S.of(context)!.purchaseProcessDescriptionHint,
                      controller: desctController,
                    ),
                  ),*/
                  const SizedBox(
                    height: 10,
                  ),
                  if (imageData.isNotEmpty)
                    ElevatedButton(
                        onPressed: () {
                          showBottomSheetImage(context);
                        },
                        child: Text(
                          S.of(context)!.purchaseProcessAddPhotoButton,
                          style: TextStyle(color: Colors.white),
                        )),
                  const SizedBox(
                    height: 10,
                  ),
                  imageData.isEmpty
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
                          onTap: () => showBottomSheetImage(context),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: imageData.length,
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
                                              imageData[index].fullPath),
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
                        )
                ],
              ),
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

  void addPurchase(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      progressDialogue(context);
      final prefs = await SharedPreferences.getInstance();
      var user_id = prefs.getString("user_id");
      var custodyOper = new CustodyOper(
          operAmount: double.parse(costController.text),
          operDetails: descController.text,
          custodyId: custodyId,
          invoiceNumber: invoiceNumberController.text,
          driverUserId: int.parse(user_id!));
      _purchaseController
          .submitOperationData(
          custodyOper: custodyOper,
          imageData: imageData
              .map((e) => ImagesData(imageData: e.fullPath))
              .toList())
          .then((value) async {
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
}
