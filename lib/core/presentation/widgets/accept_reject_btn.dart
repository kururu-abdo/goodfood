import 'package:flutter/material.dart';
import 'package:goodfoods/app/order/model/order_mapper.dart';
import 'package:goodfoods/app/order/view/pages/reject_page.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/order_details.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class AcceptRejectButton extends StatelessWidget {
  final OrderMapper? orderMapper;
  const AcceptRejectButton({ Key? key, this.orderMapper }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale= AppLocalizations.of(context);
        var translation = AppLocalizations.of(context);
    var controller = Provider.of<MaintenanceController>(context);
    return 
            Builder(
              builder: (context) {
                return 


                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [



                    accept_button(orderMapper: orderMapper, 
                    
                    orderId: orderMapper!.orderId.toString(),
                    controller: controller, translation: translation)
        .onTap((){
          ///TODO: change order status

//make it clsoing   = 1
controller.setOrderAccept(orderMapper!.orderId.toString());
// controller.changeOrderStatus(context, widget.orderId!, 1.toString());
  controller.updateOrderStatus(context, orderMapper!.orderId!.toString(), null, 1.toString()).then((value) {

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



  });
        }),



                    
                    Container(
        width: 120 ,height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(translation!.translate("reject")! ,
          style: const TextStyle(
                    color: Colors.white
          ),
          
          
          ),
        ),
        )
        .onTap((){
          ///TODO: change order status

//make it clsoing   = 1

// controller.changeOrderStatus(context, widget.orderId!, 1.toString());
RejectPage(orderId:orderMapper!.orderId!.toString() ,).launch(context);
        }),


                  ],
                );
              
              
              
              }
            );
      
  }
}

class accept_button extends StatelessWidget {
  const accept_button({
    super.key,
    required this.orderMapper,
    required this.controller,
    required this.translation, this.orderId,
  });
  final String? orderId;

  final OrderMapper? orderMapper;
  final MaintenanceController controller;
  final AppLocalizations? translation;

  @override
  Widget build(BuildContext context) {
    return Consumer<MaintenanceController>(
      builder: (context, provider ,child) {
        return Container(
          key: ValueKey('id ${orderMapper!.orderId}'),
            width: 120 ,height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: 
             provider. updateOrder!.status==Status.LOADING
             
             && provider.orderIdToAccept==orderId
              ?
             const CircularProgressIndicator(
               
               strokeWidth: 1,color: Colors.white,

              
             ):
              Text(translation!.translate("accept")! ,
              style: const TextStyle(
        color: Colors.white
              ),
              
              
              ),
            ),
            );
      }
    );
  }
}