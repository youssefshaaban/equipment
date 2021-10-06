


import 'package:equipment/features/purchase/operation_api_service.dart';
import 'package:equipment/features/purchase/purchase_data_state.dart';
import 'package:equipment/features/purchase/purchase_state.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseDataController extends GetxController{

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<CustodyOper?> addOperation(BuildContext context,CustodyOper oper){
    try{
      var operation=OperationApiService().addOperation(context, oper);
      return operation;
    }
    finally{

    }
  }

  final AppRepository appRepository=AppRepository();
  final purchaseDataState = PurchaseDataState().obs;
  PurchaseDataState get state => purchaseDataState.value;

  Future<String> submitOperationData({required String amount,required String desc,required int custodyId}) async {
    String message = '';
    //try {
      //purchaseDataState.value = PurchaseDataLoading();
      final prefs = await SharedPreferences.getInstance();
      var user_id = prefs.getString("user_id");
      var cust=CustodyOper(operAmount: 5, operDetails: desc, custodyId: 5, invoiceNumber: '5', driverUserId: 5);
      var data = await appRepository.getApiClient().submitOperation(RequestCustodyOpera(custodyOperations: cust));
      print(data.success);
      if (data.success == true) {
        purchaseDataState.value = PurchaseDataSuccess(
            responseSubmitOperation: ResponseSubmitOperation(
                ));
        message = 'purchase added successfully';
      }
      else {
        purchaseDataState.value = PurchaseDataFailure(
            error: data.message != null ? data.message! : "Some thing wrong");
        print(data.message);
        message = data.message!;
      }
    return message;
    }
    /*catch(error){
      print (error);
    }*/

  }

