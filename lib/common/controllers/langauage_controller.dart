import 'package:flutter/material.dart';
import 'package:goodfoods/core/keys.dart';
import 'package:nb_utils/nb_utils.dart';




SharedPreferences? prefs;
String? _languageKey;
class LanguageProvier extends ChangeNotifier {

  List<LanguageDataModel> langs = [

 LanguageDataModel( name: 'Arabic' ,flag: 'assets/icons/arabic.png' , languageCode: 'ar' )
 , 
  LanguageDataModel( name: 'English' ,flag: 'assets/icons/english.png' , languageCode: 'en' )


  ];
  String? get languageKey => _languageKey;
  LanguageProvier() {
    // _languageKey = "ar";
    // loadLanguage();
  }
  loadLanguage() async {
    await _initPrefs();
    _languageKey = prefs!.getString(loale) ?? 'ar';
    notifyListeners();
  }
  _initPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  // changeLanguage(String? code) {
  //   _languageKey = code!;
  //   saveToPrefs();
  //   notifyListeners();
  // }
  saveToPrefs() async {
    await _initPrefs();
    prefs!.setString(loale, languageKey!);
  }

 Locale? _appLocale = const Locale('en');

  Locale? get appLocal => _appLocale ?? const Locale("en");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
    return Null;
  }


  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("ar")) {
      _appLocale = const Locale("ar");
      await prefs.setString('language_code', 'ar');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }








}