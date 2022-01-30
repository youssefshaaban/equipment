import 'package:equipment/features/profile/profile_controller.dart';
import 'package:equipment/features/profile/profile_state.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/repositery/retrofit/model/user/login_data.dart';
import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller = Get.put(ProfileController());
  TextEditingController enUserName = TextEditingController();
  TextEditingController arUserName = TextEditingController();
  TextEditingController password = TextEditingController();
  late User user;
  final _formKey = GlobalKey<FormState>();
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );



  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    _controller.getProfile();
    return Scaffold(

      body: Center(child: Obx(() {
        if (_controller.state is DataLoading) {
          return CircularProgressIndicator();
        } else if (_controller.state is DataSuccess) {
          return BuildTreeProfile(
              context, (_controller.state as DataSuccess).data);
        } else {
          return Text("error");
        }
      })),
    );
  }

  Widget BuildTreeProfile(BuildContext context, User user) {
    final size = MediaQuery.of(context).size;
    this.user = user;
    arUserName.text = user.fullName == null ? "" : user.fullName!;
    enUserName.text = user.fullName == null ? "" : user.fullNameEn!;
    password.text = user.password == null ? "" : user.password!;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('${S.of(context)!.versionNumber}: ${_packageInfo.version}'),
          Container(
            width: 90,
            height: 90,
            margin: EdgeInsets.only(top: 60),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                image:
                    NetworkImage((user.picture == null) ? "" : user.picture!),
                placeholder: AssetImage("assets/images/ic_user.png"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/ic_user.png',
                      fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user.userName == null ? "" : user.userName!,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user.phone == null ? "" : user.phone!,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 10),
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: enUserName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S
                              .of(context)!
                              .profileEnUserNameValidationEditText;
                        } else if (value.length < 5) {
                          return S
                              .of(context)!
                              .profileEnUserNameValidationEditText1;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: S.of(context)!.profileEnUserNameEditText,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: arUserName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S
                              .of(context)!
                              .profileArUserNameValidationEditText;
                        } else if (value.length < 5) {
                          return S
                              .of(context)!
                              .profileArUserNameValidationEditText1;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: S.of(context)!.profileArUserNameEditText,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S
                              .of(context)!
                              .profileArUserNameValidationPassword;
                        } else if (value.length < 5) {
                          return S
                              .of(context)!
                              .profileArUserNameValidationPassword1;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: S.of(context)!.profilePassword,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate())
                          updateBasicData();
                      },
                      child: Container(
                        height: 50,
                        width: size.width * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.blueGrey),
                        child: Center(
                            child: Text(
                          S.of(context)!.editSaveButton,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  updateBasicData() {
    progressDialogue(context);
    FocusScope.of(context).unfocus();
    this.user.fullNameEn=enUserName.text.toString();
    this.user.fullName=arUserName.text.toString();
    this.user.password=password.text.toString();
    _controller.updateUser(user).then((value){
      Navigator.of(context).pop();
      if(value.success==true){
        customSnackBar(context,msg: S.of(context)!.saveSuccess);
      }else{
        customSnackBar(context,msg: value.message==null?"":value.message!);
      }
    });
  }
}
