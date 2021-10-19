import 'package:equipment/features/profile/profile_controller.dart';
import 'package:equipment/features/profile/profile_state.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/repositery/retrofit/model/user/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {

  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller = Get.put(ProfileController());
  TextEditingController enUserName=TextEditingController();
  TextEditingController arUserName=TextEditingController();
  TextEditingController password=TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    _controller.getProfile();
    return Scaffold(
      body: Center(child: Obx(() {
        if (_controller.state is DataLoading) {
          return CircularProgressIndicator();
        } else if (_controller.state is DataSuccess) {
          return BuildTreeProfile(context, (_controller.state as DataSuccess).data);
        } else {
          return Text("error");
        }
      })),
    );
  }

  Widget BuildTreeProfile(BuildContext context, User user) {
    final size=MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              margin: EdgeInsets.only(top: 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  image: NetworkImage((user.picture == null) ? "" : user.picture!),
                  placeholder: AssetImage("assets/images/ic_user.png"),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/ic_user.png',
                        fit: BoxFit.cover);
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              user.fullName==null?"":user.fullName!,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 10,),
            Text(
              user.phone==null?"":user.phone!,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height:10),
            Form(
              key: _formKey,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: enUserName,
                      validator: (value){
                        if(value!.isEmpty){
                          return S.of(context)!.profileEnUserNameValidationEditText;
                        }else if(value.length<5){
                          return S.of(context)!.profileEnUserNameValidationEditText1;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: S.of(context)!.profileEnUserNameEditText,
                          border:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)
                          )
                      ),
                    ),
                    const SizedBox(height:10),
                    TextFormField(keyboardType: TextInputType.text,
                      controller: arUserName,
                      validator: (value){
                        if(value!.isEmpty){
                          return S.of(context)!.profileArUserNameValidationEditText;
                        }else if(value.length<5){
                          return S.of(context)!.profileArUserNameValidationEditText1;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: S.of(context)!.profileArUserNameEditText,
                          border:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)
                          )
                      ),
                    ),
                    const SizedBox(height:10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      controller: password,
                      validator: (value){
                        if(value!.isEmpty){
                          return S.of(context)!.profileArUserNameValidationPassword;
                        }else if(value.length<5){
                          return S.of(context)!.profileArUserNameValidationPassword1;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: S.of(context)!.profilePassword,
                          border:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)
                          )
                      ),
                    ),
                    const SizedBox(height:10),
                    InkWell(
                      onTap: (){
                        if(_formKey.currentState!.validate())
                          updateBasicData();
                      },
                      child: Container(
                        height:50,
                        width: size.width*.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blueGrey
                        ),
                        child: Center(child: Text("Save",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
      ),
    );
  }

  updateBasicData() {
    print('update');
  }
}
