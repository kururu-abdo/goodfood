import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
final String key = "theme";
SharedPreferences? prefs;
bool? _darkTheme;
class ThemeProvier extends ChangeNotifier {
  bool? get darkTheme => _darkTheme;
  ThemeProvier() {
    _darkTheme = true;
    loadFromPrefs();
  }
  loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs!.getBool(key) ?? true;
    notifyListeners();
  }
  _initPrefs() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme!;
    saveToPrefs();
    notifyListeners();
  }
  saveToPrefs() async {
    await _initPrefs();
    prefs!.setBool(key, darkTheme!);
  }
}