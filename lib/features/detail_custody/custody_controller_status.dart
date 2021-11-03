import 'package:equipment/features/detail_custody/custody_status_state.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:get/get.dart';
import 'custody_operation_statr.dart';


class CustodyDetailController  extends GetxController {
  final AppRepository appRepository=AppRepository();
  final _custodyStateStream = CustodyStatusState().obs;
  CustodyStatusState get state => _custodyStateStream.value;
  final _custodyOperationStream = CustodyOperationsState().obs;
  CustodyOperationsState get stateOperation => _custodyOperationStream.value;

  final _custodyDeleteOperationStream = DeleteOperationStatusState().obs;
  DeleteOperationStatusState get deleteStateOperation => _custodyDeleteOperationStream.value;

  /*final _custodyUpdateOperationStream = UpdateOperationStatusState().obs;
  UpdateOperationStatusState get updateStateOperation => _custodyUpdateOperationStream.value;*/

  @override
  void onInit() {
    super.onInit();
    print("################contoller####################");
  }
  Future<CustodyStatusState> updateCustodyByStatus(int status,int cId) async {
    _custodyStateStream.value = StatusLoading();
    try{
      // var user_id=prefs.getString("user_id");
      var data=await appRepository.getApiClient().updateStatusCustody("$status",cId.toString());
      if(data.success==true){
        return StatusSuccess(custodyId:data.updatedCustodyId!=null ?data.updatedCustodyId! :0);
      }else{
     return StatusFailure(error: data.message!=null ?data.message!:"Some thing wrong");
      }
    }catch(e){
     return StatusFailure(error: e.toString());
    }
  }

  Future<DeleteOperationStatusState> deleteOperation(id) async {
    _custodyDeleteOperationStream.value = DeleteOperationStatusLoading();
    try{
      // var user_id=prefs.getString("user_id");
      var data=await appRepository.getApiClient().deleteOperation(id);
      if(data.success==true){
        return DeleteOperationStatusSuccess(success:true);
      }else{
        return DeleteOperationStatusFailure(error: data.message!=null ?data.message!:"Some thing wrong");
      }
    }catch(e){
      return DeleteOperationStatusFailure(error: e.toString());
    }
  }


  /*Future<UpdateOperationStatusState>updateOperation()async{
    _custodyUpdateOperationStream.value = UpdateOperationStatusLoading();
    var data=await appRepository.getApiClient().updateStatusCustody(cStatus, cUser);
  }*/

  void getCustodyOperation(int cId) async {
    _custodyOperationStream.value = OperationLoading();
    try{
      // var user_id=prefs.getString("user_id");
      var data=await appRepository.getApiClient().getCustodyOperation(cId);
      if(data.success==true){
        _custodyOperationStream.value= CustodyOperationsSuccess(custodyOpers:data.cOpersData);
      }else{
        _custodyOperationStream.value= CustodyOperationFailure(error: data.message!=null ?data.message!:"Some thing wrong");
      }
    }catch(e){
      _custodyOperationStream.value= CustodyOperationFailure(error: e.toString());
    }
  }

  @override
  void onClose() {

    super.onClose();
  }
}