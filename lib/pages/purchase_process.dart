import 'dart:io';

import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';

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
  List<File> images=[];

  File? _image1;
  final imagePicker = ImagePicker();

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
                    Text('Pick With Camera',style: TextStyle(color: Colors.white),)
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
                    Text('Pick from gallery',style:TextStyle(color:Colors.white))
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
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    _image1 = File(image!.path);
    setState(() {
      images.add(_image1!);
    });
    print(images.length);

  }

  Future getGalleryImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    _image1 = File(image!.path);
    setState(() {
      images.add(_image1!);
    });
    print(images.length);
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('add a purchase process'),
        actions: [
          TextButton(onPressed: (){
            bool valid=isDataValid();
            if(valid){
              _saveData();
            }
          }, child: Text('Save',style: TextStyle(color: Colors.white),))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  customEditText1(
                    keyboardType: TextInputType.number,
                    //hint: 'Cost',
                    hint: 'Cost',
                    controller: costController,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 140,
                    child: customEditText1(
                        //hint: 'Description',
                      isTextArea:true,
                        hint: 'Description',
                        controller: desctController,
                        ),
                  ),
                  const SizedBox(height: 20),
                  customEditText1
                    (
                      keyboardType: TextInputType.number,
                      //hint: 'Amount',
                      hint: 'Amount',
                      controller: amountController,
                  ),
                  const SizedBox(height: 20,),
                  if(images.isNotEmpty)
                    ElevatedButton(onPressed: (){
                      showSheet(context);
                    }, child: Text('Add photo',style: TextStyle(color: Colors.white),)),

                  const SizedBox(height: 20,),
                  images.isEmpty?
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
                    scrollDirection: Axis.horizontal,itemCount: images.length,itemBuilder: (context,index){
                     return Padding(
                        padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                              height: 200,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Card(child: Image.file(images[index],fit: BoxFit.cover,)),
                            ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: IconButton(onPressed: ()=>_deletePhoto(index),
                                    icon: Icon(Icons.delete,size: 30,color:Colors.red)),
                              )
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
        dateController.text.isEmpty ||
        costController.text.isEmpty ||
        desctController.text.isEmpty) {
      customSnackBar(context, msg: "All fields are required");
      valid = false;
    } else {
      //customSnackBar(context, msg: "All fields are required");
      valid = false;
    }
    return valid;
  }

  void _saveData() {
    customSnackBar(context, msg: "Data Saved successfully");
  }

  _deletePhoto(int index) {
    setState(() {
      images.removeAt(index);
    });
  }
}
