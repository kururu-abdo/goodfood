import 'package:flutter/material.dart';
import 'package:goodfoods/core/presentation/order_details.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderWidget extends StatelessWidget {
  final String? orderId;
  final List? attacments;
  final String? orderTitle;
  final String? orderDate;
  final int? confirmed;
  final String? fileLink;
  final String? from;
  final String? date;
  final String? task;
  final List? files;
   final String? to2;
  final List<String> to;
  final int? status;
  const OrderWidget({ Key? key, this.orderTitle, this.orderDate, this.fileLink, this.from, required this.to, this.status, this.task, this.orderId, this.attacments, this.files, this.date, this.to2, this.confirmed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale= AppLocalizations.of(context);
    return 
    
     ClipPath(
       clipper: const ShapeBorderClipper(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        )
    ),
      child: Container(
     margin: const EdgeInsets.only(
          bottom: 10 , left: 10 ,right: 10,
          top: 10
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8 ,horizontal: 15
        ),
        width: MediaQuery.of(context).size.width,
        height: 
        // to.length<5?
        MediaQuery.of(context).size.height/6 
        // :
        // MediaQuery.of(context).size.height/3
        
        ,
        decoration:   BoxDecoration(
    
           color: Colors.white,
    
      //      gradient: const LinearGradient(
      //   stops:  [0.05, 0.02],
      //   colors: [Colors.red, Colors.white]
      // ),
      //      borderRadius: const BorderRadius.all(
      // Radius.circular(10),
      // ),
      boxShadow: const [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.0, 3.0),
      )
      ],
    
          border: Border(
            bottom: BorderSide(
              
                width: 7.0,
              
              
              
              color:
            
           getOrderColor(status)
             
             
             )
          )
       
       
       
        ),
      
      
      
      
      child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
     Row(
      mainAxisSize: MainAxisSize.min,
      children: [
    SizedBox(
    child: Text(
      currentLang(context)=="ar"?
      "طلب #$orderId":
      "Order #${orderId!}" ,
    
    maxLines: 2, overflow: TextOverflow.ellipsis,

    style: const TextStyle(
      fontWeight: FontWeight.bold
    ),
    ), 
    
    
    ) ,
    const SizedBox(
      width: 10,
    ) ,
    
    const SizedBox.shrink()
    
    
      ],
    )
    
     ,
    5.height ,
    
    
    
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
     SizedBox(width: 100,
    child: Text("${locale!.translate("date")}: "), 
    
    
    ) ,
    const SizedBox(
      width: 10,
    ) ,
    
    Text(
    orderDate!
    )
    
    
      ],
    )
    
     ,
5.height ,
    
    
     Row(
      mainAxisSize: MainAxisSize.min,
      children: [
     SizedBox(width: 100,
    child: Text("${locale.translate("status")}: "), 
    
    
    ) ,
    const SizedBox(
      width: 10,
    ) ,
    
    Text(
    getStatusName(context, status!)!,
    maxLines: 2, 
    style:  TextStyle(
      fontWeight: FontWeight.w300,
      color: getOrderColor(status),
      fontSize: 15
    ),
    overflow: TextOverflow.ellipsis,
    )
    
    
      ],
    ),




    5.height ,
    
    
     Row(
      mainAxisSize: MainAxisSize.min,
      children: [
     SizedBox(width: 100,
    child: Text("${locale.translate("task")}: "), 
    
    
    ) ,
    const SizedBox(
      width: 10,
    ) ,
    
    Expanded(
      child: Text(
      task!,
      maxLines: 2, 
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15
      ),
      overflow: TextOverflow.ellipsis,
      ),
    )
    
    
      ],
    )
      
      ],
    
      ) ,
      ),
    ).onTap((){
 OrderDetails(
   isAdmin: sharedPrefs.authList.contains("branch"),
   orderId: orderId,
   file: files,
   confirmed: confirmed,
   task: task,
   to: to2,
   from: from,
   date: date,
   status: status.toString(),
  //  file: ,
 ).launch(context);

    });
  }


  
  
  

}