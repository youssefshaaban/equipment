

import 'package:equipment/features/purchase/purchase_state.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_data.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_request.dart';
import 'package:get/get.dart';

class PurchaseController extends GetxController{
  final AppRepository appRepository=AppRepository();
  final purchaseStateStream=PurchaseState().obs;
  PurchaseState get state => purchaseStateStream.value;


  Future<String> uploadImage(String base64File) async{
    purchaseStateStream.value = PurchaseLoading();
    String message='';
    try{
      var imageDate= await appRepository.getApiClient().uploadImage(UploadImageRequest(imageData: base64File));
      if(imageDate.success==true){
        purchaseStateStream.value = PurchaseSuccess(uploadImageData: UploadImageData(fullPath: base64File, message: '', success: true));
        message= "uploaded successfully";
      }else{
        purchaseStateStream.value= PurchaseFailure(error:"Some thing wrong");
        message= "can't upload photo";
      }

    }
    catch(error){
      purchaseStateStream.value= PurchaseFailure(error: error.toString());
    }

    return message;

  }

  @override
  void onClose() {
    super.onClose();
  }

}