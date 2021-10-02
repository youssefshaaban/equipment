
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "loginPageAppBarTitle": MessageLookupByLibrary.simpleMessage("Driver"),
    "loginPageUserNameHint": MessageLookupByLibrary.simpleMessage("UserName"),
    "loginPagePasswordHint": MessageLookupByLibrary.simpleMessage("Password"),
    "loginPageButton": MessageLookupByLibrary.simpleMessage("Login"),
    "firstTabAppBarTitle": MessageLookupByLibrary.simpleMessage("custody"),
    "firstTabTitle": MessageLookupByLibrary.simpleMessage("Home"),
    "secondTabAppBarTitle": MessageLookupByLibrary.simpleMessage("profile"),
    "secondTabTitle": MessageLookupByLibrary.simpleMessage("Profile"),
    "equipmentPageNew": MessageLookupByLibrary.simpleMessage("New"),
    "equipmentPageOpened": MessageLookupByLibrary.simpleMessage("Opened"),
    "equipmentPageClosed": MessageLookupByLibrary.simpleMessage("Closed"),
    "equipmentPageDeleted": MessageLookupByLibrary.simpleMessage("Deleted"),
    "equipmentPageFinished": MessageLookupByLibrary.simpleMessage("Finished"),
    "equipmentPageRejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "itemCustodyPageReferenceNum": MessageLookupByLibrary.simpleMessage("Reference Num:"),
    "itemCustodyPageTotal": MessageLookupByLibrary.simpleMessage("Total"),
    "itemCustodyPageSpent": MessageLookupByLibrary.simpleMessage("Spent"),
    "equipmentPageId": MessageLookupByLibrary.simpleMessage("dsds"),
    "equipmentPageDate": MessageLookupByLibrary.simpleMessage("122/22/222"),
    "equipmentPageRemainAmount": MessageLookupByLibrary.simpleMessage("555"),
    "equipmentPageTotalAmount": MessageLookupByLibrary.simpleMessage("2222"),
    "purchaseProcessAppBarTitle": MessageLookupByLibrary.simpleMessage("add a purchase process"),
    "purchaseProcessSave": MessageLookupByLibrary.simpleMessage("Save"),
    "purchaseProcessCostHint": MessageLookupByLibrary.simpleMessage("Cost"),
    "purchaseProcessDescriptionHint": MessageLookupByLibrary.simpleMessage("Description"),
    "purchaseProcessAmountHint": MessageLookupByLibrary.simpleMessage("Amount"),
    "purchaseProcessAddPhotoButton": MessageLookupByLibrary.simpleMessage("Add photo"),
    "purchaseProcessCustomSnackBarMessage": MessageLookupByLibrary.simpleMessage("All fields are required"),
    "purchaseProcessCustomSnackBarMessageS": MessageLookupByLibrary.simpleMessage("Data Saved successfully"),
    "purchaseProcessPickWithCamera": MessageLookupByLibrary.simpleMessage("Camera"),
    "purchaseProcessPickFromGallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "custodyDetailsAppBarTitle": MessageLookupByLibrary.simpleMessage("Custody detail"),
    "custodyDetailsAddButton": MessageLookupByLibrary.simpleMessage("Add"),
    "custodyDetailsRaisingButton": MessageLookupByLibrary.simpleMessage("Raising to accounts"),
    "custodyDetailsCloseButton": MessageLookupByLibrary.simpleMessage("Close"),
    "custodyDetailsCustodyNumber": MessageLookupByLibrary.simpleMessage("Custody Number"),
    "custodyDetailsValue1": MessageLookupByLibrary.simpleMessage("Value"),
    "custodyDetailsDate": MessageLookupByLibrary.simpleMessage("Date"),
    "custodyDetailsValue2": MessageLookupByLibrary.simpleMessage("Value"),
    "custodyDetailsCost": MessageLookupByLibrary.simpleMessage("Cost"),
    "custodyDetailsValue3": MessageLookupByLibrary.simpleMessage("Value"),
    "custodyDetailsRemainAmount": MessageLookupByLibrary.simpleMessage("Remain Amount"),
    "custodyDetailsValue4": MessageLookupByLibrary.simpleMessage("Value"),
    "custodyDetailsCustodyNumber1": MessageLookupByLibrary.simpleMessage("Custody Number"),
    "custodyDetailsValue5": MessageLookupByLibrary.simpleMessage("Value"),
    "itemPurchaseCustodyNumber": MessageLookupByLibrary.simpleMessage("Custody Number:"),
    "itemPurchaseDescription": MessageLookupByLibrary.simpleMessage("Description:"),
    "itemPurchaseCost": MessageLookupByLibrary.simpleMessage("Cost:"),
    "password_required": MessageLookupByLibrary.simpleMessage("Password required"),
    "userName_required": MessageLookupByLibrary.simpleMessage("UserName required"),
  };
}