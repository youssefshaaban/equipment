

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();

  static S? current;

  static const AppLocalizationDelegate delegate =
  AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current!;
    });
  }

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }


  String get loginPageAppBarTitle {
    return Intl.message(
      'Driver',
      name: 'loginPageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String get loginPageUserNameHint {
    return Intl.message(
      'UserName',
      name: 'loginPageUserNameHint',
      desc: '',
      args: [],
    );
  }

  String get loginPagePasswordHint {
    return Intl.message(
      'Password',
      name: 'loginPagePasswordHint',
      desc: '',
      args: [],
    );
  }

  String get loginPageButton {
    return Intl.message(
      'Login',
      name: 'loginPageButton',
      desc: '',
      args: [],
    );
  }


  String get firstTabAppBarTitle {
    return Intl.message(
      'custody',
      name: 'firstTabAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String get firstTabTitle {
    return Intl.message(
      'الصفحه الرئسيه',
      name: 'firstTabTitle',
      desc: '',
      args: [],
    );
  }

  String get secondTabAppBarTitle {
    return Intl.message(
      'profile',
      name: 'secondTabAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String get secondTabTitle {
    return Intl.message(
      'Profile',
      name: 'secondTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get homePageMainFormTitle {
    return Intl.message(
      'Personal Information',
      name: 'homePageMainFormTitle',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageNew {
    return Intl.message(
      'New',
      name: 'equipmentPageNew',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageOpened {
    return Intl.message(
      'Opened',
      name: 'equipmentPageOpened',
      desc: '',
      args: [],
    );
  }

  String get password_required {
    return Intl.message(
      'Password required',
      name: 'password_required',
      desc: '',
      args: [],
    );
  }
  String get userName_required {
    return Intl.message(
      'UserName required',
      name: 'userName_required',
      desc: '',
      args: [],
    );
  }


  String get equipmentPageClosed {
    return Intl.message(
      'Closed',
      name: 'equipmentPageClosed',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageDeleted {
    return Intl.message(
      'Deleted',
      name: 'equipmentPageDeleted',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageFinished {
    return Intl.message(
      'Finished',
      name: 'equipmentPageFinished',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageRejected {
    return Intl.message(
      'Rejected',
      name: 'equipmentPageRejected',
      desc: '',
      args: [],
    );
  }


  String get itemCustodyPageReferenceNum {
    return Intl.message(
      'Reference Num:',
      name: 'itemCustodyPageReferenceNum',
      desc: '',
      args: [],
    );
  }
  String get custodyReceivingNumber {
    return Intl.message(
      'Receiving Num:',
      name: 'custodyReceivingNumber',
      desc: '',
      args: [],
    );
  }

  String get itemCustodyPageTotal {
    return Intl.message(
      'Total:',
      name: 'itemCustodyPageTotal',
      desc: '',
      args: [],
    );
  }

  String get itemCustodyPageSpent {
    return Intl.message(
      'Spent:',
      name: 'itemCustodyPageSpent',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageId {
    return Intl.message(
      'dsds',
      name: 'equipmentPageId',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageDate {
    return Intl.message(
      'Date',
      name: 'equipmentPageDate',
      desc: '',
      args: [],
    );
  }
  String get currency {
    return Intl.message(
      'Date',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageRemainAmount {
    return Intl.message(
      '555',
      name: 'equipmentPageRemainAmount',
      desc: '',
      args: [],
    );
  }

  String get equipmentPageTotalAmount {
    return Intl.message(
      '2222',
      name: 'equipmentPageTotalAmount',
      desc: '',
      args: [],
    );
  }

  String get purchaseProcessAppBarTitle {
    return Intl.message(
      'add a purchase process',
      name: 'purchaseProcessAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String get purchaseProcessSave {
    return Intl.message(
      'Save',
      name: 'purchaseProcessSave',
      desc: '',
      args: [],
    );
  }



  String get purchaseProcessCostHint {
    return Intl.message(
      'Cost',
      name: 'purchaseProcessCostHint',
      desc: '',
      args: [],
    );
  }


  String get purchaseProcessDescriptionHint {
    return Intl.message(
      'Description',
      name: 'purchaseProcessDescriptionHint',
      desc: '',
      args: [],
    );
  }


  String get purchaseProcessAmountHint {
    return Intl.message(
      'Amount',
      name: 'purchaseProcessAmountHint',
      desc: '',
      args: [],
    );
  }


  String get field_required {
    return Intl.message(
      'Filed required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }


  String get purchaseProcessAddPhotoButton {
    return Intl.message(
      'Add photo',
      name: 'purchaseProcessAddPhotoButton',
      desc: '',
      args: [],
    );
  }


  String get purchaseProcessCustomSnackBarMessage {
    return Intl.message(
      'All fields are required',
      name: 'purchaseProcessCustomSnackBarMessage',
      desc: '',
      args: [],
    );
  }


  String get purchaseProcessCustomSnackBarMessageS {
    return Intl.message(
      'Data Saved successfully',
      name: 'purchaseProcessCustomSnackBarMessageS',
      desc: '',
      args: [],
    );
  }

  String get purchaseProcessPickWithCamera {
    return Intl.message(
      'Camera',
      name: 'purchaseProcessPickWithCamera',
      desc: '',
      args: [],
    );
  }

  String get purchaseProcessPickFromGallery {
    return Intl.message(
      'Gallery',
      name: 'purchaseProcessPickFromGallery',
      desc: '',
      args: [],
    );
  }


  String get custodyDetailsAppBarTitle {
    return Intl.message(
      'Custody Details',
      name: 'custodyDetailsAppBarTitle',
      desc: '',
      args: [],
    );
  }


  String get custodyDetailsAddButton {
    return Intl.message(
      'Add',
      name: 'custodyDetailsAddButton',
      desc: '',
      args: [],
    );
  }

  String get custodyDetailsRaisingButton {
    return Intl.message(
      'Raising to accounts',
      name: 'custodyDetailsRaisingButton',
      desc: '',
      args: [],
    );
  }

  String get acceptButton {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  String get rejectButton {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }


  String get custodyDetailsCloseButton {
    return Intl.message(
      'Close',
      name: 'custodyDetailsCloseButton',
      desc: '',
      args: [],
    );
  }
  String get custodyDetailsCustodyNumber {
    return Intl.message(
      'Custody Number',
      name: 'custodyDetailsCustodyNumber',
      desc: '',
      args: [],
    );
  }


  String get custodyDetailsValue1 {
    return Intl.message(
      'Value',
      name: 'custodyDetailsValue1',
      desc: '',
      args: [],
    );
  }


  String get custodyDetailsDate {
    return Intl.message(
      'Date',
      name: 'custodyDetailsDate',
      desc: '',
      args: [],
    );
  }

  String get custodyDetailsValue2 {
    return Intl.message(
      'Value',
      name: 'custodyDetailsValue2',
      desc: '',
      args: [],
    );
  }

  String get textCost {
    return Intl.message(
      'Cost',
      name: 'custodyDetailsCost',
      desc: '',
      args: [],
    );
  }

  String get custodyDetailsValue3 {
    return Intl.message(
      'Value',
      name: 'custodyDetailsValue3',
      desc: '',
      args: [],
    );
  }

  String get custodyDetailsRemainAmount {
    return Intl.message(
      'Remain Amount',
      name: 'custodyDetailsRemainAmount',
      desc: '',
      args: [],
    );
  }

  String get custodyDetailsValue4 {
    return Intl.message(
      'Value',
      name: 'custodyDetailsValue4',
      desc: '',
      args: [],
    );
  }


  String get custodyDetailsCustodyNumber1 {
    return Intl.message(
      'Custody Number',
      name: 'custodyDetailsCustodyNumber1',
      desc: '',
      args: [],
    );
  }

  String get custodyDetailsValue5 {
    return Intl.message(
      'Value',
      name: 'custodyDetailsValue5',
      desc: '',
      args: [],
    );
  }


  String get itemPurchaseCustodyNumber {
    return Intl.message(
      'Custody Number',
      name: 'itemPurchaseCustodyNumber',
      desc: '',
      args: [],
    );
  }

  String get invoiceNumber {
    return Intl.message(
      'Invoice number',
      name: 'invoiceNumber',
      desc: '',
      args: [],
    );
  }
  String get itemPurchaseDescription {
    return Intl.message(
      'Description',
      name: 'itemPurchaseDescription',
      desc: '',
      args: [],
    );
  }


  String get itemPurchaseCost {
    return Intl.message(
      'Cost',
      name: 'itemPurchaseCost',
      desc: '',
      args: [],
    );
  }

  String get openCamOrGallery {
    return Intl.message(
      'open',
      name: 'openCamOrGallery',
      desc: '',
      args: [],
    );
  }
  String get processConfirmation {
    return Intl.message(
      'open',
      name: "process can't be modified after raise are you sure?",
      desc: '',
      args: [],
    );
  }
  String get processConfirmationAddButton {
    return Intl.message(
      'Add',
      name: 'processConfirmationAddButton',
      desc: '',
      args: [],
    );
  }
  String get editSheetTFFamount {
    return Intl.message(
      'enter a valid value',
      name: 'editSheetTFFamount',
      desc: '',
      args: [],
    );
  }

  String get editSheetTFFdesc {
    return Intl.message(
      'enter a valid value',
      name: 'editSheetTFFdesc',
      desc: '',
      args: [],
    );
  }

  String get editSheetSaveButton {
    return Intl.message(
      'Save',
      name: 'editSheetSaveButton',
      desc: '',
      args: [],
    );
  }

  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }
  String get deleteButton {
    return Intl.message(
      'Delete',
      name: 'deleteButton',
      desc: '',
      args: [],
    );
  }
  String get txtMsgDeleteOperation {
    return Intl.message(
      'Are you sure delete operation ?',
      name: 'txtMsgDeleteOperation',
      desc: '',
      args: [],
    );
  }



  String get okButton {
    return Intl.message(
      'Ok',
      name: 'okButton',
      desc: '',
      args: [],
    );
  }
  String get alertMessageOfCloseCustody {
    return Intl.message(
      "Custody can't be modified after raise to accountant",
      name: 'alertMessageOfCloseCustody',
      desc: '',
      args: [],
    );
  }



  String get processConfirmationCancelButton {
    return Intl.message(
      'Cancel',
      name: 'processConfirmationCancelButton',
      desc: '',
      args: [],
    );
  }


  String get editAppBarTitle {
    return Intl.message(
      'Edit operation',
      name: 'editAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String get saveSuccess {
    return Intl.message(
      'Save success',
      name: 'saveSuccess',
      desc: '',
      args: [],
    );
  }


  String get editCostTF {
    return Intl.message(
      'Add',
      name: 'editCostTF',
      desc: '',
      args: [],
    );
  }


  String get editCostValueValidation {
    return Intl.message(
      'Enter a valid value',
      name: 'editCostValueValidation',
      desc: '',
      args: [],
    );
  }


  String get editAmountTF {
    return Intl.message(
      'amount',
      name: 'editAmountTF',
      desc: '',
      args: [],
    );
  }


  String get editAmountValueValidation {
    return Intl.message(
      'Enter a valid value',
      name: 'editAmountValueValidation',
      desc: '',
      args: [],
    );
  }


  String get editDescTF {
    return Intl.message(
      'description',
      name: 'editDescTF',
      desc: '',
      args: [],
    );
  }


  String get editDescValueValidation {
    return Intl.message(
      'Enter a valid value',
      name: 'editDescValueValidation',
      desc: '',
      args: [],
    );
  }

  String get editDescValueValidation1 {
    return Intl.message(
      "desc can't be less than 5 chars",
      name: 'editDescValueValidation1',
      desc: '',
      args: [],
    );
  }

  String get editAddPhotoButton {
    return Intl.message(
      'Add Photo',
      name: 'editAddPhotoButton',
      desc: '',
      args: [],
    );
  }

  String get editSaveButton {
    return Intl.message(
      'Save',
      name: 'editSaveButton',
      desc: '',
      args: [],
    );
  }

  String get editCancelButton {
    return Intl.message(
      'Cancel',
      name: 'editCancelButton',
      desc: '',
      args: [],
    );
  }

  String get profileEnUserNameEditText {
    return Intl.message(
      'user name(English)',
      name: 'profileEnUserNameEditText',
      desc: '',
      args: [],
    );
  }

  String get profileEnUserNameValidationEditText {
    return Intl.message(
      'enter a valid value',
      name: 'profileEnUserNameValidationEditText',
      desc: '',
      args: [],
    );
  }

  String get profileEnUserNameValidationEditText1 {
    return Intl.message(
      "user name can't be less than 5 chars",
      name: 'profileEnUserNameValidationEditText1',
      desc: '',
      args: [],
    );
  }

  String get profileArUserNameEditText {
    return Intl.message(
      'user name(Arabic)',
      name: 'profileArUserNameEditText',
      desc: '',
      args: [],
    );
  }

  String get profileArUserNameValidationEditText {
    return Intl.message(
      'enter a valid value',
      name: 'profileArUserNameValidationEditText',
      desc: '',
      args: [],
    );
  }

  String get profileArUserNameValidationEditText1 {
    return Intl.message(
      "user name can't be less than 5 chars",
      name: 'profileArUserNameValidationEditText1',
      desc: '',
      args: [],
    );
  }

  String get profilePassword {
    return Intl.message(
      'password',
      name: 'profilePassword',
      desc: '',
      args: [],
    );
  }

  String get profileArUserNameValidationPassword {
    return Intl.message(
      'enter a valid value',
      name: 'profileArUserNameValidationPassword',
      desc: '',
      args: [],
    );
  }

  String get profileSaveButton {
    return Intl.message(
      'Save',
      name: 'profileSaveButton',
      desc: '',
      args: [],
    );
  }

  String get profileArUserNameValidationPassword1 {
    return Intl.message(
      "password can't be less than 5 chars",
      name: 'profileArUserNameValidationPassword1',
      desc: '',
      args: [],
    );
  }

}






class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'SA'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}