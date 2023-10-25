import 'package:flutter/material.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';

class SplashController extends ChangeNotifier {
  
  isUserLoggedIn(){
   bool? result= sharedPrefs.isLoggedIn;
   
   return result;
  }
  



}