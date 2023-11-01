
import 'package:flutter/material.dart';
import 'package:goodfoods/core/presentation/splash_screen.dart';
import 'package:goodfoods/core/services/notification_plugin.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:nb_utils/nb_utils.dart';

class AppState extends ChangeNotifier {
  bool _isBusy = false;
  bool get isbusy => _isBusy;
  set isBusy(bool value) {
    if (value != _isBusy) {
      _isBusy = value;
      notifyListeners();
    }
  }

  int _pageIndex = 0;
  int get pageIndex {
    return _pageIndex;
  }

  set setPageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
logout(BuildContext context){
  NotificationApi.clear();
  sharedPrefs.logout();

const SplashScreen().launch(context);
}



}