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

enum ImageSourceType { gallery, camera }

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
  TextEditingController desctController = TextEditingController();
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  // final PurchaseDataController _purchaseDataController =
  //     Get.put(PurchaseDataController());
  final _formKey = GlobalKey<FormState>();

  // List<File> images = [];
  // List<String> base64File = [];
  List<UploadImageData> imageData = [];
  late int custodyId;
  var _initDataLoded = false;

  addImage(String base64) async {
    progressDialogue(context);
    var uploadImage = await _purchaseController.uploadImage(base64);
    if (uploadImage is ImageUploadSuccess) {
      setState(() {
        // base641 = base64Encode(fileUnit8);
        // base64File.add(base64Encode(fileUnit8));
        imageData.add(uploadImage.uploadImageData);
        Navigator.of(context).pop();
      });
    } else if (uploadImage is ImageUploadFailure) {
      customSnackBar(context, msg: uploadImage.error);
      Navigator.of(context).pop();
    }
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
                onTap: () {
                  Navigator.pop(context);
                  getImage(ImageSource.camera);
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
                        Navigator.pop(context);
                        getImage(ImageSource.camera);
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      S.of(context)!.purchaseProcessPickWithCamera,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  getImage(ImageSource.gallery);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.photo,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        getImage(
                          ImageSource.gallery,
                        );
                      },
                    ),
                    Text(S.of(context)!.purchaseProcessPickFromGallery,
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }

  Future getImage(ImageSource source) async {
    File? _image1;
    XFile _imageFile;
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: source);
    _imageFile = image!;
    _image1 = File(_imageFile.path);
    List<int> fileUnit8 = _image1.readAsBytesSync();
    //imageData.add(ImagesData(imageData: base64Encode(fileUnit8)));
    addImage(base64Encode(fileUnit8));
    //print(images.length);
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
              onPressed: () async {
                bool valid = isDataValid();
                if (valid) {
                  addPurchase(context);
                }
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  customEditText1(
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (imageData.isNotEmpty)
                    ElevatedButton(
                        onPressed: () {
                          showSheet(context);
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
                          onTap: () => showSheet(context),
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
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: FadeInImage(
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
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: IconButton(
                                          onPressed: () => _deletePhoto(index),
                                          icon: Icon(Icons.delete,
                                              size: 30, color: Colors.red)),
                                    )

                                    /*if(_purchaseController.state is PurchaseLoading)
                                      Center(child: CircularProgressIndicator(),)*/
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

  bool isDataValid() {
    bool valid;
    if (costController.text.isEmpty ||
        costController.text.isEmpty ||
        desctController.text.isEmpty) {
      customSnackBar(context,
          msg: S.of(context)!.purchaseProcessCustomSnackBarMessage);
      valid = false;
    } else {
      valid = true;
    }
    return valid;
  }

  _deletePhoto(int index) {
    setState(() {
      imageData.removeAt(index);
    });
  }

  void addPurchase(BuildContext context) async {
    progressDialogue(context);
    final prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getString("user_id");
    var custodyOper = new CustodyOper(
        operAmount: double.parse(costController.text),
        operDetails: desctController.text,
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
