

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

  String get custodyDetailsCost {
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