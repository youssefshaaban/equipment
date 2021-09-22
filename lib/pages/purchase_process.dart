import 'dart:io';

import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class PurchaseProcess extends StatefulWidget {
  const PurchaseProcess({Key? key}) : super(key: key);
  static const tag = '/ppt';

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
                  customEditText(
                    height: 50,
                    width: deviceWidth ,
                    keyboardType: TextInputType.number,
                    hint: 'Cost',
                    label: 'Cost',
                    circular: 5,
                    controller: costController,
                  ),
                  const SizedBox(height: 20),
                  customEditText(
                      height: 140,
                      width: deviceWidth ,
                      hint: 'Description',
                      //label: 'Description',
                      circular: 5,
                      controller: desctController,
                      maxLines: 60),
                  const SizedBox(height: 20),
                  customEditText(
                      height: 50,
                      width: deviceWidth,
                      keyboardType: TextInputType.number,
                      circular: 5,
                      hint: 'Amount',
                      label: 'Amount',
                      controller: amountController,
                      maxLines: 60),
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
                  /* Row(children: <Widget>[
                    const SizedBox(width: 5),
                    customEditText(
                        height: 50,
                        width: deviceWidth * .3,
                        keyboardType: TextInputType.number,
                        hint: 'process number',
                        controller: processNumberController,
                        isEnabled: false)
                  ]),
                  const SizedBox(height: 20),
                  Row(children: <Widget>[
                    createText('Date:', 15),
                    const SizedBox(width: 77),
                    customEditText(
                        height: 50,
                        width: deviceWidth * .3,
                        keyboardType: TextInputType.datetime,
                        hint: 'Date',
                        controller: dateController,
                        isEnabled: false),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.date_range,
                      color: Colors.black,
                      size: 25,
                    )
                  ]),*/





               /*   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  showSheet(context);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 80,
                                    width: 80,
                                    child: _image1 == null
                                        ? Icon(Icons.add_a_photo,
                                            color: Colors.white, size: 50)
                                        : Image.file(
                                            _image1!,
                                            fit: BoxFit.cover,
                                          ))),
                            const SizedBox(height: 3),
                            createText('pill photo 1', 10)
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  showSheet(context);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 80,
                                    width: 80,
                                    child: _image2 == null
                                        ? Icon(Icons.add_a_photo,
                                            color: Colors.white, size: 50)
                                        : Image.file(
                                            _image2!,
                                            fit: BoxFit.cover,
                                          ))),
                            const SizedBox(height: 3),
                            createText('pill photo 2', 10)
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  showSheet(context, 'photo3');
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 80,
                                    width: 80,
                                    child: _image3 == null
                                        ? Icon(Icons.add_a_photo,
                                            color: Colors.white, size: 50)
                                        : Image.file(
                                            _image3!,
                                            fit: BoxFit.cover,
                                          ))),
                            const SizedBox(height: 3),
                            createText('pill photo 3', 10)
                          ],
                        ),
                      ])*/
                ]),
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
