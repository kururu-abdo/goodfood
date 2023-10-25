import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String? subTitleText;
  const SubTitle({
    Key? key,
    this.subTitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: 8, vertical: 5),
      child: Text(
        subTitleText!,
        textAlign: TextAlign.center,
        // style: kSubTextStyle,
      ),
    );
  }
}