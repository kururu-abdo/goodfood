import 'package:flutter/material.dart';

Widget appBar(String text, IconButton iconButton) {
  return AppBar(
    title: Text(
      text,
      // style: textS,
    ),
    centerTitle: true,
    leading: IconButton(icon: iconButton, onPressed: () {}),
    // backgroundColor: AppTheme.mainThemeColor(),
    // brightness: Brightness.dark,
  );
}