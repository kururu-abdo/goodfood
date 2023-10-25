import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NotificationWidget extends StatelessWidget {
  final String? mainTitle;
  final String? description;
  final  String? duration;
  final bool? isRead;

  const NotificationWidget({ Key? key, this.mainTitle, this.description, this.duration, this.isRead=false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(
        vertical: 5 ,horizontal:10 
      ),
      height: MediaQuery.of(context).size.height/7,
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(
           isRead!? 0:5
        ),
        color: 
        isRead!?
        
        Colors.white:
Theme.of(context).primaryColor.withOpacity(.20)
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
  Container(

    padding: const EdgeInsets.all(15),
    decoration:  BoxDecoration(
      shape: BoxShape.circle ,
      color: isRead!? Colors.black:Colors.blue
    ),
    child: const Icon(Icons.notifications , 
    color: Colors.white,
    
    
     size: 30,),
  ) ,

10.width,
 Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(mainTitle.toString().toUpperCase() , 
      style: const TextStyle(
        // color: Colors.grey
        fontSize: 18 , fontWeight: FontWeight.bold
      ),
      )
 ,
  Text(description! , 
      style: const TextStyle(
     fontSize: 15 , fontWeight: FontWeight.w500
      ),
      )
,
  Text(duration.toString() , 
      style: const TextStyle(
       fontSize: 12 , fontWeight: FontWeight.w300
      ),
      )
    ],
) ,

  

],



      ),
    );
  }
}