import 'package:equipment/features/profile/profile_state.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:equipment/repositery/retrofit/model/user/login_data.dart';
import 'package:equipment/repositery/retrofit/model/user/login_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController  extends GetxController {
  final AppRepository appRepository=AppRepository();
  final _loginStateStream = DataState().obs;

  DataState get state => _loginStateStream.value;

  void getProfile() async {
    _loginStateStream.value = DataLoading();
    try{
      var pref= await SharedPreferences.getInstance();
      var userId =  pref.getString("user_id");
      var user=await appRepository.getApiClient().getProfile(int.parse(userId!));
      if(user.success==true){
        _loginStateStream.value= DataSuccess(data: user.ProfileData!);
      }else{
        _loginStateStream.value=DataFailure(error: user.message!=null ?user.message!:"Some thing wrong");
      }

    } catch(e){
      _loginStateStream.value=DataFailure(error: e.toString());
    }
  }

  Future<BaseResponse> updateUser(User user)  {
     return  appRepository.getApiClient().updateUserData(user);
  }

  @override
  void onClose() {

    super.onClose();

  }
}