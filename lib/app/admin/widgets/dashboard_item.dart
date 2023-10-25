import 'package:flutter/material.dart';
import 'package:goodfoods/core/chart_painter.dart';

class DasboardItem extends StatelessWidget {
  final String? title;
  final int?  count; 
   final double? width;
  final Color? themeColor;
  final Function()? callback;
  const DasboardItem({ Key? key,
  
  this.width ,
   this.title, this.count, this.themeColor, this.callback }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: () {
        // Provider.of<OrderProvider>(context, listen: false).setIndex(index);
        callback!();
      },
      child:
       Container( 
         margin: const EdgeInsets.all(5),
         decoration:
         

         
          const BoxDecoration(

           color: Colors.white,
           borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    boxShadow: [
    BoxShadow(
    color: Color(0xffDDDDDD),
    blurRadius: 6.0,
    spreadRadius: 2.0,
    offset: Offset(0.0, 0.0),
    )
    ],
     ),
         
       
       
       
         width:width,
         height: MediaQuery.of(context).size.height*.20,
         child: CustomPaint(
           foregroundPainter: MyPainter(
             themeColor: themeColor
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text(title!  , style:const TextStyle(
                           fontSize: 25 , 

                           fontWeight: FontWeight.bold
                         )) , 

                Text("34",
                         style:TextStyle(
                           fontSize: 50 , color: themeColor! ,

                           fontWeight: FontWeight.bold
                         )),
             ],
           ),
         ),
       ),
    );
  }
}