


import 'package:equipment/features/purchase/purchase_data_state.dart';

import 'package:equipment/repositery/app_repositery.dart';
import 'package:get/get.dart';

class PurchaseDataController extends GetxController{
  final AppRepository appRepository=AppRepository();
  final purchaseDataState = PurchaseDataState().obs;
  PurchaseDataState get state => purchaseDataState.value;

  void submitOperationData({required String amount,required String desc,required int custodyId})  {
    // purchaseDataState.value=PurchaseDataLoading();
    // var data=await appRepository.getApiClient().submitOperation();
    // if(data.success==true){
    //   purchaseDataState.value=PurchaseDataSuccess();
    // }
    // else{
    //   purchaseDataState.value= PurchaseDataFailure(error: data.message!=null ?data.message!:"Some thing wrong");
    // }

  }

}