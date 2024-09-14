import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/maintainenace_dashboard.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/user_maintenance_orders.dart';
import 'package:goodfoods/core/utils/global.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderStatusWidget extends StatefulWidget {
  final String? title;
  final int? status;
  final int? region;
  final String? icon;
  final dynamic count;
  const OrderStatusWidget({super.key, this.status, this.title, this.icon, this.count, this.region});

  @override
  State<OrderStatusWidget> createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
       clipper: const ShapeBorderClipper(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        )
    ),
    child:
 Container(
  
     margin: const EdgeInsets.only(
          bottom: 10 , left: 5 ,right: 5,
          top: 10
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 6 ,horizontal: 15
        ),
        width: MediaQuery.of(context).size.width*.45,
        height: MediaQuery.of(context).size.width*.45,
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
            
           getOrderColor(widget.status)
             
             
             )
          )
       
       
       
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
Text(widget.title??'',style: const TextStyle(
  fontSize: 20,
),), 
Image.asset(widget.icon??''

,  color:
            
           getOrderColor(widget.status), 
           width: 60,height: 60,
)
, 


Text(widget.count.toString(), style: const TextStyle(
  fontSize: 35,
),), 


          ],
        ),

 )


    ).onTap((){
if(!sharedPrefs.isMaintain || sharedPrefs.isSuper){
 MaintainanceDashboard(status:widget.status.toString(),
 region: widget.region,
 
 ).launch(context , );
 }else {
    UserMaintenanceOrders(status:widget.status.toString()).launch(context);
 }
      
    });
  }
}