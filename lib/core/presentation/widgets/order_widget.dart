import 'package:flutter/material.dart';
import 'package:goodfoods/app/order/model/order_mapper.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/presentation/order_details.dart';
import 'package:goodfoods/core/presentation/widgets/accept_reject_btn.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class OrderWidget extends StatelessWidget {
  final OrderMapper? orderMapper;
//   final String? orderId;
//   final List? attacments;
//   final String? orderTitle;
//   final String? orderDate;
//   final int? confirmed;
//     final int? maintainStatus;
//     final int? OrderStatus;
// final String? orderUserId;
//   final String? fileLink;
//   final String? from;
//   final String? modelType;

//   final String? date;
//   final String? task;
//   final List? files;
//    final String? to2;
//      final int? subnittedOrder;
// final bool? isMaintain;
//   final List<String> to;
//   final int? status;
   const OrderWidget({ Key? key, 
  //  this.orderTitle, this.orderDate, this.fileLink, this.from, required this.to, this.status, this.task, this.orderId, this.attacments, this.files, this.date, this.to2, this.confirmed, this.subnittedOrder, this.maintainStatus, this.OrderStatus, this.orderUserId, this.isMaintain, this.modelType,
   
    this.orderMapper }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale= AppLocalizations.of(context);
        var translation = AppLocalizations.of(context);
    var controller = Provider.of<MaintenanceController>(context);

    return 
    // const ListTile();
    
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
        sharedPrefs.isMaintain&&
       orderMapper!.forwardToId==sharedPrefs.user_id
&& orderMapper!.confirmd.toString()=="0"?
         MediaQuery.of(context).size.height/5:
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
            
           getOrderColor(orderMapper!.status)
             
             
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
      "طلب #${orderMapper!.maintainOrderId}":
      "Order #${orderMapper!.maintainOrderId}" ,
    
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
    orderMapper!.orderDate!
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
    getStatusName(context, orderMapper!.status!)!,
    maxLines: 2, 
    style:  TextStyle(
      fontWeight: FontWeight.w300,
      color: getOrderColor(orderMapper!.status!),
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
      orderMapper!.task!,
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
      ,
5.height,
if(
  
  sharedPrefs.isMaintain&&
  orderMapper!.forwardToId==sharedPrefs.user_id
&& orderMapper!.confirmd.toString()=="0"

)


      AcceptRejectButton(
        orderMapper: orderMapper,
      )


      ]
      
    
      ) ,
      ),
    ).onTap((){
      if ( orderMapper!.confirmd.toString()=="1") {
          
 OrderDetails(
   isMaintain: sharedPrefs.isMaintain,
   orderId: orderMapper!.orderId!.toString(),
   isFromNotificaiton: false,
  //  file: orderMapper!.files,
  //  subnittedOrder:orderMapper!.maintainOrderId ,
  //  confirmed: orderMapper!.confirmd,
  //  modelType: orderMapper!.modelType,
  // orderUserId: int.parse(orderMapper!.forwardToId!.toString()),
  // maintainStatus: orderMapper!.status,
  // OrderStatus: orderMapper!.status,
  //  task: orderMapper!.task,
  //  to: orderMapper!.forwardToName,
  //  from: orderMapper!.createrName,
  //  date: orderMapper!.orderDate,
  //  status: orderMapper!.status.toString(),
   
  //  file: ,
 ).launch(context);

      }

    
    });
  }


  
  
  

}