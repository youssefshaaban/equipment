import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/model/login_request.dart';
import 'package:get/get.dart';

import 'login_state.dart';

class LoginController  extends GetxController {
  final AppRepository appRepository=AppRepository();
  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  void login(String email, String password) async {
    _loginStateStream.value = LoginLoading();
    try{
      var user=await appRepository.getApiClient().login(LoginRequest(userName:email,password: password));
      if(user.success==true){
        _loginStateStream.value = LoginUser(user: user.loginUserData!);
      }else{
        _loginStateStream.value = LoginFailure(error: user.message!=null ?user.message!:"Some thing wrong");
      }

    } on Exception catch(e){
      _loginStateStream.value = LoginFailure(error: e.toString());
    }
  }
}