import 'dart:convert';
import 'dart:io';

import 'package:equipment/features/purchase/purchase_controller.dart';
import 'package:equipment/features/purchase/purchase_data_controller.dart';
import 'package:equipment/features/purchase/purchase_state.dart';
import 'package:equipment/generated/intl/messages_en_US.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async';

import 'package:image_picker/image_picker.dart';


enum ImageSourceType { gallery, camera }

class PurchaseProcess extends StatefulWidget {
  const PurchaseProcess({Key? key}) : super(key: key);
  static const tag = '/ppt';
  static const routeName = '/addNewPurchaseProcess';
  @override
  _PurchaseProcessState createState() => _PurchaseProcessState();
}

class _PurchaseProcessState extends State<PurchaseProcess> {
  TextEditingController processNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController desctController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final PurchaseController _purchaseController=Get.put(PurchaseController());
  final PurchaseDataController _purchaseDataController=Get.put(PurchaseDataController());
  final _formKey = GlobalKey<FormState>();
  List<File> images=[];
  List<String> base64File = [];
  String base641='';





  add(String base64){
    _purchaseController.uploadImage(base64).then((message) {

      if(message=="uploaded successfully"){
        customSnackBar(context,msg: message);
      }
      else if(message=="can't upload photo"){
        customSnackBar(context,msg: message);
      }

    }

    );
  }


  Future showSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 180,
          color: Colors.grey,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  getCameraImage();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        getCameraImage();
                      },
                    ),
                    const SizedBox(width: 5,),
                    Text(S.of(context)!.purchaseProcessPickWithCamera,
                      style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              const SizedBox(height:20),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                  getGalleryImage();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.photo,
                        color: Colors.white,
                        size:40,
                      ),
                      onPressed: () {
                        getGalleryImage();
                      },
                    ),
                    Text(S.of(context)!.purchaseProcessPickFromGallery,
                        style:TextStyle(color:Colors.white))
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }



  Future getCameraImage() async {


    File? _image1;
    XFile _imageFile;
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    _imageFile=image!;
    _image1 = File(_imageFile.path);
    List<int> fileUnit8 = _image1.readAsBytesSync();
    add(base64Encode(fileUnit8));
    setState(() {
      base641=base64Encode(fileUnit8);
      base64File.add(base64Encode(fileUnit8));
      images.add(_image1!);
    });
    print(images.length);

  }

  Future getGalleryImage() async {
    File? _image1;
    XFile _imageFile;
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    _imageFile=image!;
    _image1 = File(_imageFile.path);
    List<int> fileUnit8 = _image1.readAsBytesSync();
    add(base64Encode(fileUnit8));
    setState(() {
      base641=base64Encode(fileUnit8);
      base64File.add(base64Encode(fileUnit8));
      images.add(_image1!);
    });
    print(images.length);
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.purchaseProcessAppBarTitle),
        actions: [
          TextButton(onPressed: (){
            bool valid=isDataValid();
            if(valid){
              _saveData();
            }
          },
          child: Text(S.of(context)!.purchaseProcessSave,
            style: TextStyle(color: Colors.white),))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Obx((){
                 return Form(
                      key:_formKey,
                      child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget>[

                            customEditText1(
                              keyboardType: TextInputType.number,
                              //hint: 'Cost',
                              hint: S.of(context)!.purchaseProcessCostHint,
                              controller: costController,
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 140,
                              child: customEditText1(
                                //hint: 'Description',
                                isTextArea:true,
                                hint: S.of(context)!.purchaseProcessDescriptionHint,
                                controller: desctController,
                              ),
                            ),
                            const SizedBox(height: 20),
                            customEditText1
                              (
                              keyboardType: TextInputType.number,
                              //hint: 'Amount',
                              hint: S.of(context)!.purchaseProcessAmountHint,
                              controller: amountController,
                            ),
                            const SizedBox(height: 20,),
                            if(base64File.isNotEmpty)
                              ElevatedButton(onPressed: (){
                                showSheet(context);
                              }, child: Text(S.of(context)!.purchaseProcessAddPhotoButton,
                                style: TextStyle(color: Colors.white),)),

                            const SizedBox(height: 20,),
                          ]
                      )
                  );
                }),

                      base64File.isEmpty?
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          height: 250,
                          width: MediaQuery.of(context).size.width*.8,
                          child: Icon(Icons.camera_alt,size:60,color: Colors.black,),
                        ),

                        onTap: ()=> showSheet(context),
                      ):
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height:200,
                        child:
                        ListView.builder(
                        scrollDirection: Axis.horizontal,itemCount: base64File.length,
                            itemBuilder: (context,index){
                         return Padding(
                            padding: const EdgeInsets.all(8.0),
                              child:
                                  Stack(
                                    children: [
                                      Container(
                                      height: 200,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Card(child: Image.memory(
                                        base64.decode(base64File[index]),fit: BoxFit.cover,),
                                      ),
                                    ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: IconButton(onPressed: ()=>_deletePhoto(index),
                                            icon: Icon(Icons.delete,size: 30,color:Colors.red)),
                                      )

                                  /*if(_purchaseController.state is PurchaseLoading)
                                    Center(child: CircularProgressIndicator(),)*/
                                ],
                              ),

                          );
                        }),
                      )
                    ],
                ),

          ),
        ),
      ),
    );
  }

  bool isDataValid() {
    bool valid = true;
    if (processNumberController.text.isEmpty ||
        amountController.text.isEmpty ||
        costController.text.isEmpty ||
        desctController.text.isEmpty) {

      customSnackBar(context, msg: S.of(context)!.purchaseProcessCustomSnackBarMessage);
      valid = false;
    } else {
      _purchaseDataController.submitOperationData(amount: amountController.text, desc: desctController.text, invoiceNumber: null, custodyId: null);
      valid = false;
    }
    return valid;
  }

  void _saveData() {
    customSnackBar(context, msg:S.of(context)!.purchaseProcessCustomSnackBarMessageS);
  }

  _deletePhoto(int index) {
    setState(() {
      images.removeAt(index);
    });
  }


}

