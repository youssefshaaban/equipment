import 'package:equipment/features/home/custody_state.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/model/login_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustodyController  extends GetxController {
  final AppRepository appRepository=AppRepository();
  final _custodyStateStream = CustodyState().obs;
  CustodyState get state => _custodyStateStream.value;

  Future<CustodyState> getCustodyByStatus(int status) async {
    _custodyStateStream.value = CustodyLoading();
    try{
      final prefs = await SharedPreferences.getInstance();
      var user_id=prefs.getString("user_id");
      var data=await appRepository.getApiClient().driverCustodiesByStatus("$state",user_id.toString());
      if(data.success==true){
        return CustodySuccess(custodies: data.custodyData!=null ?data.custodyData! : []);
      }else{
        return CustodyFailure(error: data.message!=null ?data.message!:"Some thing wrong");
      }
    }catch(e){
      return  CustodyFailure(error: e.toString());
    }
  }
}