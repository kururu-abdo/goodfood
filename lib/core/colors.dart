import 'package:flutter/material.dart';

class MyColors {
  MyColors._();
  
  static const Color dark = Color(0xff222222);
  static const Color white = Color(0xffffffff);
  static const Color blue = Color(0xff0000ff);
  static const Color red = Color(0xffff0000);
  static const Color green = Color(0xff00ff00);
  static const Color lightBlue = Color(0xffaaaaff);
}
final Map<int, Color> colorMapper = {
  0: Colors.white,
  1: Colors.blueGrey[50]!,
  2: Colors.blueGrey[100]!,
  3: Colors.blueGrey[200]!,
  4: Colors.blueGrey[300]!,
  5: Colors.blueGrey[400]!,
  6: Colors.blueGrey[500]!,
  7: Colors.blueGrey[600]!,
  8: Colors.blueGrey[700]!,
  9: Colors.blueGrey[800]!,
  10: Colors.blueGrey[900]!,
};
const Color kcScaffoldBackgroundColor= Color(0xFFf5f6fb);
const Color kcPrimaryColor = Color(0xff22A45D);
const Color kcMediumGreyColor = Color(0xff868686);
const Color kcLightGreyColor = Color(0xffe5e5e5);
const Color kcVeryLightGreyColor = Color(0xfff2f2f2);