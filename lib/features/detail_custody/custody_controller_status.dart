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
  Future<CustodyStatusState> getCustodyByStatus(int status,int CId) async {
    _custodyStateStream.value = StatusLoading();
    try{
      // var user_id=prefs.getString("user_id");
      var data=await appRepository.getApiClient().updateStatusCustody("$status",CId.toString());
      if(data.success==true){
        return StatusSuccess(custodyId:data.updatedCustodyId!=null ?data.updatedCustodyId! :0);
      }else{
     return StatusFailure(error: data.message!=null ?data.message!:"Some thing wrong");
      }
    }catch(e){
     return StatusFailure(error: e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}