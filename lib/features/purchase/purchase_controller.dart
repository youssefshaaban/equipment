

import 'package:equipment/features/purchase/purchase_data_state.dart';
import 'package:equipment/features/purchase/purchase_state.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_data.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseController extends GetxController{
  final AppRepository appRepository=AppRepository();
  final uploadStateStream=ImageUploadStateState().obs;
  ImageUploadStateState get upload_imag_estate => uploadStateStream.value;
  final purchaseStateStream=PurchaseState().obs;
  PurchaseState get purchase_estate => purchaseStateStream.value;


  Future<ImageUploadStateState> uploadImage(String base64File) async{
    uploadStateStream.value = ImageUploadLoading();
    try{
      var imageDate= await appRepository.getApiClient().uploadImage(UploadImageRequest(imageData: base64File));
      if(imageDate.success==true){
        return ImageUploadSuccess(uploadImageData: imageDate);

      }else{
        return ImageUploadFailure(error:"Some thing wrong");
      }

    }
    catch(error){
      return ImageUploadFailure(error: error.toString());
    }
  }

  Future<BaseResponse> deleteImage(int id) {
      return appRepository.getApiClient().deleteImage(id);
  }

  Future<PurchaseState> submitOperationData({required CustodyOper custodyOper,required List<ImagesData> imageData}) async {
    try {

      var request = RequestCustodyOpera(custodyOperations: custodyOper);
      request.cOpersData = imageData;
      var data = await appRepository.getApiClient().submitOperation(request);
      if (data.success == true) {
        return PurchaseSuccess(operId: data.oper_Id);
      }
      else {
        return PurchaseFailure(
            error: data.message != null ? data.message! : "Some thing wrong");
      }
    } catch(error){
      return PurchaseFailure(error: error.toString());
    }
  }


  @override
  void onClose() {
    super.onClose();
  }

}