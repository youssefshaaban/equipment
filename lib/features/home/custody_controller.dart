import 'package:equipment/features/home/custody_state.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/model/login_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController  extends GetxController {
  final AppRepository appRepository=AppRepository();
  final _loginStateStream = CustodyState().obs;

  CustodyState get state => _loginStateStream.value;

  Future<CustodyState> login(String email, String password) async {
    _loginStateStream.value = CustodyLoading();
    try{
      var user=await appRepository.getApiClient().login(LoginRequest(userName:email,password: password));
      if(user.success==true){
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("user_id", user.loginUserData!.userId!.toString());
        prefs.setString("userName", user.loginUserData!.userName!);
        prefs.setString("picture", user.loginUserData!.picture!);
        return LoginSuccessUser(user: user.loginUserData!);
      }else{
        return LoginFailure(error: user.message!=null ?user.message!:"Some thing wrong");
      }

    } on Exception catch(e){
      return  LoginFailure(error: e.toString());
    }
  }
}