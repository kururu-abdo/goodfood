import 'package:flutter/material.dart';
import 'package:goodfoods/app/managment_orders/controllers/requests_controller.dart';
import 'package:goodfoods/app/managment_orders/models/management_order.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ManagementOrderWidget extends StatefulWidget {
  final ManagementOrderModel? orderModel;
  final Function(ManagementOrderModel)? onReply;
  const ManagementOrderWidget({ Key? key, this.orderModel, this.onReply }) : super(key: key);

  @override
  State<ManagementOrderWidget> createState() => _ManagementOrderWidgetState();
}

class _ManagementOrderWidgetState extends State<ManagementOrderWidget> {

    bool _showReply =false;

  @override
  Widget build(BuildContext context) {
    var controller =  Provider.of<RequestController>(context);
    return  
    
   
     AnimatedCrossFade(
      
      firstChild: 
      
      Container(
      height:
MediaQuery.of(context).size.height/8 ,
padding: const EdgeInsets.symmetric(
  horizontal: 10 ,vertical: 15
),
margin: const EdgeInsets.symmetric(
  vertical: 10 ,horizontal: 5
),
        decoration:   const BoxDecoration(
    
           color: Colors.white,
    
      //      gradient: const LinearGradient(
      //   stops:  [0.05, 0.02],
      //   colors: [Colors.red, Colors.white]
      // ),
      //      borderRadius: const BorderRadius.all(
      // Radius.circular(10),
      // ),
      boxShadow: [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.0, 3.0),
      )
      ],
    
         
      



       
       
        ),
      

child: 


         Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
  
  
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
          Text(
            
            currentLang(context)=="ar"?
            widget.orderModel!.taskAr!: widget.orderModel!.taskEn!,
            
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            )
      , 
          const SizedBox(
            width: 20,
          ) , 
          Container(
            height: 30 ,
            decoration: const BoxDecoration(
             
            ),
            child:  Center(
              child: Text(getMaintenanceFormattedDate(


                widget.orderModel!.createdAt! ,
  currentLang(context)=="ar"?"ar":"en_US"
              )),
            ),
          )
    
    ],
  ) , 
  
  
 TextButton(onPressed: (){
widget.onReply!(widget.orderModel!);
 }, child: Text(translate(context, "replay")))
  
  
    ],
  ),
          
           



    ),
    
     secondChild:  SizedBox(
  height: _showReply? 
   MediaQuery.of(context).size.height/2: 
   MediaQuery.of(context).size.height/8,
       



       child: 
       
       
       
  AnimatedCrossFade(firstChild:
   
   
    Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
  horizontal: 10 ,vertical: 15
),
         decoration:    BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.20),
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 3.0, //extend the shadow
          offset: const Offset(
            3.0, // Move to right 5  horizontally
            3.0, // Move to bottom 5 Vertically
          ),
        )
      ],
  ) ,
         margin: const EdgeInsets.symmetric(
  vertical: 6 ,
         ),
        child:
        
         Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  
  
  Row(
    children: [
          Text(
            
            currentLang(context)=="ar"?
            widget.orderModel!.taskAr!: widget.orderModel!.taskEn!)    , 
          const SizedBox(
            width: 20,
          ) , 
          Container(
            height: 30 , 
            decoration: const BoxDecoration(
              
            ),
            child:  Center(
              child: Text(getMaintenanceFormattedDate(


                widget.orderModel!.createdAt! ,
  currentLang(context)=="ar"?"ar":"en_US"
              )),
            ),
          )
    
    ],
  ) , 
  
  
  IconButton(onPressed: (){
  _showReply=   !_showReply;
  setState(() {
    
  });
  }, icon: Icon(Icons.add ,   color: Theme.of(context).primaryColor  ))
  
  
  
    ],
  ),
          
           
         
         
         
         ),
   
   
   
   secondChild:  SizedBox(
     height: MediaQuery.of(context).size.height/2,
     child: Column(
       children: [
   Container(padding: const EdgeInsets.symmetric(
  horizontal: 10 ,vertical: 15
),
         decoration:    BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.20),
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 3.0, //extend the shadow
          offset: const Offset(
            3.0, // Move to right 5  horizontally
            3.0, // Move to bottom 5 Vertically
          ),
        )
      ],
   ) ,
         margin: const EdgeInsets.symmetric(
   vertical: 6 ,
         ),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
 
 Row(
    children: [
          Text(
            
            currentLang(context)=="ar"?
            widget.orderModel!.taskAr!: widget.orderModel!.taskEn!)    , 
          const SizedBox(
            width: 20,
          ) , 
          Container(
            height: 30 ,
            decoration: const BoxDecoration(
              
            ),
            child:  Center(
              child: Text(getMaintenanceFormattedDate(


                widget.orderModel!.createdAt! ,
  currentLang(context)=="ar"?"ar":"en_US"
              )),
            ),
          )
    
    ],
  ) , 
  
   
   IconButton(onPressed: (){
   _showReply=   !_showReply;
   setState(() {
      
   });
   }, icon: Icon(Icons.remove ,   color: Theme.of(context).primaryColor  ))
   
   
   
      ],
   ),
          
           
         
         
         
         ),
     10.height , 
     
   Expanded(child: 
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Text(
       widget.orderModel!.replay??"",
     
     
     textAlign: TextAlign.justify,
     ),
   )
   )
     
   
       ],
     ),
   ),
    crossFadeState: !_showReply?
    CrossFadeState.showFirst:CrossFadeState.showSecond
    , 
    duration: const Duration(
  
  milliseconds: 300
    )),

       














    ),
     crossFadeState: 
     
     widget.orderModel!.replay !=null ?
CrossFadeState.showSecond:CrossFadeState.showFirst
     
     , duration: const Duration(milliseconds: 100));
  }
}