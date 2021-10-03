import 'package:equipment/features/profile/profile_controller.dart';
import 'package:equipment/features/profile/profile_state.dart';
import 'package:equipment/repositery/retrofit/model/user/login_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final _controller = Get.put(ProfileController());

  ProfilePage({Key? key}) : super(key: key);

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
    return  Column(
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
                placeholder: AssetImage("assets/images/bg_no_image.png"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/bg_no_image.png',
                      fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            user.fullName!,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 10,),
          Text(
            user.phone!,
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
    );
  }
}
