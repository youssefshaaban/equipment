
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
    "equipmentPageNew": MessageLookupByLibrary.simpleMessage("New custody"),
    "equipmentPageOpened": MessageLookupByLibrary.simpleMessage("Opened custody"),
    "equipmentPageClosed": MessageLookupByLibrary.simpleMessage("Closed custody"),
    "equipmentPageDeleted": MessageLookupByLibrary.simpleMessage("Deleted custody"),
    "equipmentPageFinished": MessageLookupByLibrary.simpleMessage("Finished custody"),
    "equipmentPageRejected": MessageLookupByLibrary.simpleMessage("Rejected custody"),
    "itemCustodyPageReferenceNum": MessageLookupByLibrary.simpleMessage("Reference Num :"),
    "itemCustodyCost": MessageLookupByLibrary.simpleMessage("Cost :"),
    "itemCustodyPageTotal": MessageLookupByLibrary.simpleMessage("Total : "),
    "itemCustodyPageSpent": MessageLookupByLibrary.simpleMessage("Spent"),
    "equipmentPageId": MessageLookupByLibrary.simpleMessage("dsds"),
    "equipmentPageDate": MessageLookupByLibrary.simpleMessage("Date : "),
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
    "txtCost": MessageLookupByLibrary.simpleMessage("Cost"),
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
    "currency": MessageLookupByLibrary.simpleMessage("SAR"),
    "custodyReceivingNumber": MessageLookupByLibrary.simpleMessage("Receiving Number : "),
    "accept": MessageLookupByLibrary.simpleMessage("Accept"),
    "reject": MessageLookupByLibrary.simpleMessage("Reject"),
    "invoiceNumber": MessageLookupByLibrary.simpleMessage("Invoice number"),
    "openCamOrGallery": MessageLookupByLibrary.simpleMessage("open"),
    "processConfirmation":MessageLookupByLibrary.simpleMessage("process can't be modified after raise are you sure?"),
    "processConfirmationAddButton":MessageLookupByLibrary.simpleMessage("Add"),
    "processConfirmationCancelButton":MessageLookupByLibrary.simpleMessage("Cancel"),
    "editSheetTFFamount":MessageLookupByLibrary.simpleMessage("enter a valid value"),
    "editSheetTFFdesc":MessageLookupByLibrary.simpleMessage("enter a valid value"),
    "editSheetSaveButton":MessageLookupByLibrary.simpleMessage("Save"),
    "cancelButton":MessageLookupByLibrary.simpleMessage("Cancel"),
    "alertMessageOfCloseCustody":MessageLookupByLibrary.simpleMessage("Custody can't be modified after raise to accountant"),
    "deleteButton":MessageLookupByLibrary.simpleMessage("Delete"),
    "txtMsgDeleteOperation":MessageLookupByLibrary.simpleMessage("Are you sure delete operation ?"),
    "field_required": MessageLookupByLibrary.simpleMessage("field required"),
    "editAppBarTitle":MessageLookupByLibrary.simpleMessage("Edit operation"),
    "editCostTF":MessageLookupByLibrary.simpleMessage("cost"),
    "editCostValueValidation":MessageLookupByLibrary.simpleMessage("Enter a valid value"),
    "editAmountTF":MessageLookupByLibrary.simpleMessage("amount"),
    "editAmountValueValidation":MessageLookupByLibrary.simpleMessage("Enter a valid value"),
    "editDescTF":MessageLookupByLibrary.simpleMessage("description"),
    "editDescValueValidation":MessageLookupByLibrary.simpleMessage("Enter a valid value"),
    "editDescValueValidation1":MessageLookupByLibrary.simpleMessage("desc can't be less than 5 chars"),
    "editAddPhotoButton":MessageLookupByLibrary.simpleMessage("Add Photo"),
    "editSaveButton":MessageLookupByLibrary.simpleMessage("Save"),
    "editCancelButton":MessageLookupByLibrary.simpleMessage("Cancel"),
    "profileEnUserNameEditText":MessageLookupByLibrary.simpleMessage("user name(English)"),
    "profileEnUserNameValidationEditText":MessageLookupByLibrary.simpleMessage("enter a valid value"),
    "profileEnUserNameValidationEditText1":MessageLookupByLibrary.simpleMessage("user name can't be less than 5 chars"),
    "profileArUserNameEditText":MessageLookupByLibrary.simpleMessage("user name(Arabic)"),
    "profileArUserNameValidationEditText":MessageLookupByLibrary.simpleMessage("enter a valid value"),
    "profileArUserNameValidationEditText1":MessageLookupByLibrary.simpleMessage("user name can't be less than 5 chars"),
    "profilePassword":MessageLookupByLibrary.simpleMessage("password"),
    "profileArUserNameValidationPassword":MessageLookupByLibrary.simpleMessage("enter a valid value"),
    "profileArUserNameValidationPassword1":MessageLookupByLibrary.simpleMessage("password can't be less than 5 chars"),
    "profileSaveButton":MessageLookupByLibrary.simpleMessage("Save"),
    "saveSuccess":MessageLookupByLibrary.simpleMessage("Save success"),
    "shopName":MessageLookupByLibrary.simpleMessage("Shop name"),
    "versionNumber":MessageLookupByLibrary.simpleMessage("Version Number"),
  };
}