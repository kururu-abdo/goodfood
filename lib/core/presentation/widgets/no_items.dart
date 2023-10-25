import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {
  final String? message;
  final String? icon;
  const NoContent(this.message, {super.key, this.icon='assets/images/empty.png'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            icon!,
            height: 200.0,
          ),
           Text('$message'),
        ],
      ),
    );
  }
}
