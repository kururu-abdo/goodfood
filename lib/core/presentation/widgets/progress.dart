import 'package:flutter/material.dart';

Widget mProgress(
  BuildContext context ,
 { bool fromPage=false ,
Color? color = Colors.white
 }
){

return Builder(builder
:(_){
if (fromPage) {
  return Container(
    
    padding: const EdgeInsets.all(6),
    decoration: const BoxDecoration(
      color: Colors.white,
    shape: BoxShape.circle ,
  ),

  child: CircularProgressIndicator(
     color: Theme.of(context).primaryColor,
     backgroundColor: Colors.white,
      strokeCap: StrokeCap.round,
     strokeWidth: 2,
  ),
  );
}

return  

  CircularProgressIndicator(
     color: color!,
     strokeCap: StrokeCap.round,
     strokeWidth: 2,
    //  backgroundColor: Colors.white,
  );

}


);



}