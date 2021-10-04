import 'package:equipment/features/detail_custody/custody_status_state.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustodyStatusController  extends GetxController {
  final AppRepository appRepository=AppRepository();
  final _custodyStateStream = CustodyStatusState().obs;
  CustodyStatusState get state => _custodyStateStream.value;
  @override
  void onInit() {
    super.onInit();
    print("################contoller####################");
  }
  void getCustodyByStatus(int status) async {
    _custodyStateStream.value = StatusLoading();
    try{
      final prefs = await SharedPreferences.getInstance();
      var user_id=prefs.getString("user_id");
      var data=await appRepository.getApiClient().updateStatusCustody("$status",user_id.toString());
      if(data.success==true){
        _custodyStateStream.value=StatusSuccess(custodyId:data.updatedCustodyId!=null ?data.updatedCustodyId! :0);
      }else{
        _custodyStateStream.value= StatusFailure(error: data.message!=null ?data.message!:"Some thing wrong");
      }
    }catch(e){
      _custodyStateStream.value=StatusFailure(error: e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}