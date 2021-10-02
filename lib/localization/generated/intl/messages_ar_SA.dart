
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
    "equipmentPageNew": MessageLookupByLibrary.simpleMessage("جديد"),
    "equipmentPageOpened": MessageLookupByLibrary.simpleMessage("فتح"),
    "equipmentPageClosed": MessageLookupByLibrary.simpleMessage("غلق"),
    "equipmentPageDeleted": MessageLookupByLibrary.simpleMessage("مسح"),
    "equipmentPageFinished": MessageLookupByLibrary.simpleMessage("إنهاء"),
    "equipmentPageRejected": MessageLookupByLibrary.simpleMessage("رفض"),
    "itemCustodyPageReferenceNum": MessageLookupByLibrary.simpleMessage("رقم المرجع:"),
    "itemCustodyPageTotal": MessageLookupByLibrary.simpleMessage("المجموع الكلي"),
    "itemCustodyPageSpent": MessageLookupByLibrary.simpleMessage("ماتم إنفاقه"),
    "equipmentPageId": MessageLookupByLibrary.simpleMessage("dsds"),
    "equipmentPageDate": MessageLookupByLibrary.simpleMessage("122/22/222"),
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
    "custodyDetailsRemainAmount": MessageLookupByLibrary.simpleMessage(":الكمية الباقية"),
    "custodyDetailsValue4": MessageLookupByLibrary.simpleMessage("القيمة"),
    "custodyDetailsCustodyNumber1": MessageLookupByLibrary.simpleMessage(":رقم العهدة"),
    "custodyDetailsValue5": MessageLookupByLibrary.simpleMessage("القيمة"),
    "itemPurchaseCustodyNumber": MessageLookupByLibrary.simpleMessage(":رقم العهدة"),
    "itemPurchaseDescription": MessageLookupByLibrary.simpleMessage("الوصف:"),
    "itemPurchaseCost": MessageLookupByLibrary.simpleMessage("التكلفة:"),
    "itemEmptyPassword": MessageLookupByLibrary.simpleMessage("لابد من إدخال كلمة المرور"),
    "itemEmptyUserName": MessageLookupByLibrary.simpleMessage("لابد من إدخال اسم المستخدم"),
  };
}