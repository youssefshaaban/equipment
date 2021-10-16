
import 'package:intl/message_lookup_by_library.dart';



final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar_SA';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "loginPageAppBarTitle": MessageLookupByLibrary.simpleMessage("السائق"),
    "loginPageUserNameHint": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
    "loginPagePasswordHint": MessageLookupByLibrary.simpleMessage("الباسوورد"),
    "loginPageButton": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "firstTabAppBarTitle": MessageLookupByLibrary.simpleMessage("العهده"),
    "firstTabTitle": MessageLookupByLibrary.simpleMessage("الصفحه الرئيسيه"),
    "secondTabAppBarTitle": MessageLookupByLibrary.simpleMessage("الصفحه الشخصيه"),
    "secondTabTitle": MessageLookupByLibrary.simpleMessage("الصفحه الشخصيه"),
    "equipmentPageNew": MessageLookupByLibrary.simpleMessage("العهد الجديده"),
    "equipmentPageOpened": MessageLookupByLibrary.simpleMessage("العهد المفتوحه"),
    "equipmentPageClosed": MessageLookupByLibrary.simpleMessage("العهد المغلقه"),
    "equipmentPageDeleted": MessageLookupByLibrary.simpleMessage("العهد تم مسحها"),
    "equipmentPageFinished": MessageLookupByLibrary.simpleMessage("العهد المنتهية"),
    "equipmentPageRejected": MessageLookupByLibrary.simpleMessage("العهد تم رفضها"),
    "itemCustodyPageReferenceNum": MessageLookupByLibrary.simpleMessage("رقم المرجعى : "),
    "itemCustodyPageTotal": MessageLookupByLibrary.simpleMessage("المجموع الكلي :"),
    "itemCustodyPageSpent": MessageLookupByLibrary.simpleMessage("ماتم إنفاقه :"),
    "equipmentPageId": MessageLookupByLibrary.simpleMessage("dsds"),
    "equipmentPageDate": MessageLookupByLibrary.simpleMessage("تاريخ :"),
    "equipmentPageRemainAmount": MessageLookupByLibrary.simpleMessage("555"),
    "equipmentPageTotalAmount": MessageLookupByLibrary.simpleMessage("2222"),
    "purchaseProcessAppBarTitle": MessageLookupByLibrary.simpleMessage("إضافة عهده"),
    "purchaseProcessSave": MessageLookupByLibrary.simpleMessage("حفظ"),
    "purchaseProcessCostHint": MessageLookupByLibrary.simpleMessage("التكلفة"),
    "purchaseProcessDescriptionHint": MessageLookupByLibrary.simpleMessage("الوصف"),
    "purchaseProcessAmountHint": MessageLookupByLibrary.simpleMessage("الكمية"),
    "purchaseProcessAddPhotoButton": MessageLookupByLibrary.simpleMessage("إضافة صورة"),
    "purchaseProcessCustomSnackBarMessage": MessageLookupByLibrary.simpleMessage("يجب ملئ جميع الحقول"),
    "purchaseProcessCustomSnackBarMessageS": MessageLookupByLibrary.simpleMessage("تم حفظ البيانات بنجاح"),
    "purchaseProcessPickWithCamera": MessageLookupByLibrary.simpleMessage("الكاميرا"),
    "purchaseProcessPickFromGallery": MessageLookupByLibrary.simpleMessage("المعرض"),
    "custodyDetailsAppBarTitle": MessageLookupByLibrary.simpleMessage("تفاصيل العهدة"),
    "custodyDetailsAddButton": MessageLookupByLibrary.simpleMessage("إضافه"),
    "custodyDetailsRaisingButton": MessageLookupByLibrary.simpleMessage("رفع للحسابات"),
    "custodyDetailsCloseButton": MessageLookupByLibrary.simpleMessage("إغلاق"),
    "custodyDetailsCustodyNumber": MessageLookupByLibrary.simpleMessage("رقم العهدة:"),
    "custodyDetailsValue1": MessageLookupByLibrary.simpleMessage("القيمة"),
    "custodyDetailsDate": MessageLookupByLibrary.simpleMessage("التاريخ:"),
    "custodyDetailsValue2": MessageLookupByLibrary.simpleMessage("القيمه"),
    "custodyDetailsCost": MessageLookupByLibrary.simpleMessage("التكلفة:"),
    "custodyDetailsValue3": MessageLookupByLibrary.simpleMessage("القيمة"),
    "custodyDetailsRemainAmount": MessageLookupByLibrary.simpleMessage("المصروف "),
    "custodyDetailsValue4": MessageLookupByLibrary.simpleMessage("القيمة"),
    "custodyDetailsCustodyNumber1": MessageLookupByLibrary.simpleMessage(":رقم العهدة"),
    "custodyDetailsValue5": MessageLookupByLibrary.simpleMessage("القيمة"),
    "itemPurchaseCustodyNumber": MessageLookupByLibrary.simpleMessage(":رقم العهدة"),
    "itemPurchaseDescription": MessageLookupByLibrary.simpleMessage("الوصف:"),
    "itemPurchaseCost": MessageLookupByLibrary.simpleMessage("التكلفة:"),
    "password_required": MessageLookupByLibrary.simpleMessage("لابد من إدخال كلمة المرور"),
    "userName_required": MessageLookupByLibrary.simpleMessage("لابد من إدخال اسم المستخدم"),
    "currency": MessageLookupByLibrary.simpleMessage("ريال"),
    "custodyReceivingNumber": MessageLookupByLibrary.simpleMessage("رقم الاستلام : "),
    "accept": MessageLookupByLibrary.simpleMessage("قبول"),
    "reject": MessageLookupByLibrary.simpleMessage("رفض"),
    "invoiceNumber": MessageLookupByLibrary.simpleMessage("رقم الفاتورة"),
    "openCamOrGallery": MessageLookupByLibrary.simpleMessage("فتح"),
    "processConfirmation":MessageLookupByLibrary.simpleMessage("لا يمكن تعديل عملية الشراء بعد التعديل هل انت متأكد؟"),
    "processConfirmationAddButton":MessageLookupByLibrary.simpleMessage("إضافه"),
    "processConfirmationCancelButton":MessageLookupByLibrary.simpleMessage("إلغاء"),
    "editSheetTFFamount":MessageLookupByLibrary.simpleMessage("ادخل القيمه المطلوبه"),
    "editSheetTFFdesc":MessageLookupByLibrary.simpleMessage("ادخل القيمه المطلوبه"),
    "editSheetSaveButton":MessageLookupByLibrary.simpleMessage("حفظ"),
    "cancelButton":MessageLookupByLibrary.simpleMessage("إلغاء"),
    "okButton":MessageLookupByLibrary.simpleMessage("تم"),
    "alertMessageOfCloseCustody":MessageLookupByLibrary.simpleMessage("لا يمكن التعديل على العهده بعد رفع العهده للحسابات "),
    "deleteButton":MessageLookupByLibrary.simpleMessage("مسـح"),
    "txtMsgDeleteOperation":MessageLookupByLibrary.simpleMessage("هل انت متاكد من مسح العملية ؟"),
    "field_required": MessageLookupByLibrary.simpleMessage("لابد من إدخال قيمة للحقل")
  };
}