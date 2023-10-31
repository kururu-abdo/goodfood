import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class UploadButtonRounded extends StatelessWidget {

  final Function()? onTap;
  const UploadButtonRounded({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, width: 50, 
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor ,
          shape: BoxShape.circle
      ),
      child:  Center(
        child: Icon(Icons.arrow_upward_rounded ,size: 30 ,color: Colors.white,),
      ),
     ).onTap(
      (){
        onTap!();
      }
    );
  }
}