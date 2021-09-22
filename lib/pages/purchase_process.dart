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
  File? _image1;
  File? _image2;
  File? _image3;
  final imagePicker = ImagePicker();

  Future showSheet(BuildContext context, String title) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          color: Colors.white,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 70,
                ),
                onPressed: () {
                  getCameraImage(title);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.photo,
                  color: Colors.green,
                  size: 70,
                ),
                onPressed: () {
                  getGalleryImage(title);
                },
              ),
            ],
          )),
        );
      },
    );
  }

  Future getCameraImage(String title) async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (title == 'photo1') {
        _image1 = File(image!.path);
      } else if (title == 'photo2') {
        _image2 = File(image!.path);
      } else if (title == 'photo3') {
        _image3 = File(image!.path);
      }
    });
  }

  Future getGalleryImage(String title) async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (title == 'photo1') {
        _image1 = File(image!.path);
      } else if (title == 'photo2') {
        _image2 = File(image!.path);
      } else if (title == 'photo3') {
        _image3 = File(image!.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('add a purchase process'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    createText('Process Number:', 15),
                    const SizedBox(width: 5),
                    customEditText(
                        height: 50,
                        width: deviceWidth * .3,
                        keyboardType: TextInputType.number,
                        hint: 'process number',
                        controller: processNumberController,
                        isEnabled: true)
                  ]),
                  const SizedBox(height: 20),
                  Row(
                      children: <Widget>[
                    createText('Date:', 15),
                    const SizedBox(width: 77),
                    Expanded(
                      child: customEditText(
                          height: 50,
                          width: deviceWidth * .3,
                          keyboardType: TextInputType.datetime,
                          hint: 'Date',
                          controller: dateController,
                          isEnabled: false),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.date_range,
                      color: Colors.black,
                      size: 25,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  const SizedBox(height: 20),
                  Row(children: <Widget>[
                    createText('Cost:', 15),
                    const SizedBox(width: 77),
                    customEditText(
                      height: 50,
                      width: deviceWidth * .3,
                      keyboardType: TextInputType.number,
                      hint: 'Cost',
                      controller: costController,
                    ),
                  ]),
                  const SizedBox(height: 21),
                  Row(children: <Widget>[
                    createText('Description:', 15),
                    const SizedBox(width: 32),
                    customEditText(
                        height: 120,
                        width: deviceWidth * .5,
                        hint: 'Description',
                        controller: desctController,
                        maxLines: 60),
                  ]),
                  const SizedBox(height: 20),
                  Icon(Icons.camera_alt, color: Colors.black, size: 80),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  showSheet(context, 'photo1');
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
                                  showSheet(context, 'photo2');
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
                      ])
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
}
