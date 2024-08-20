
import 'package:flutter/material.dart';
import 'package:goodfoods/core/colors.dart';
import 'package:goodfoods/core/text_styles.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const BoxText.headingOne(this.text, {super.key}) : style = heading1Style;
  const BoxText.headingTwo(this.text, {super.key}) : style = heading2Style;
  const BoxText.headingThree(this.text, {super.key}) : style = heading3Style;
  const BoxText.headline(this.text, {super.key}) : style = headlineStyle;
  const BoxText.subheading(this.text, {super.key}) : style = subheadingStyle;
  const BoxText.caption(this.text, {super.key}) : style = captionStyle;

  BoxText.body(this.text, {super.key, Color color = MyColors.dark})
      : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}