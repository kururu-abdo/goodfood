import 'package:flutter/material.dart';
import 'package:goodfoods/app/managment_orders/controllers/requests_controller.dart';
import 'package:goodfoods/app/managment_orders/views/pages/order_reply.dart';
import 'package:goodfoods/app/managment_orders/views/widgets/mangement_order_widget.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ManagmentOrders extends StatefulWidget {
  const ManagmentOrders({ Key? key }) : super(key: key);

  @override
  _ManagmentOrdersState createState() => _ManagmentOrdersState();
}

class _ManagmentOrdersState extends State<ManagmentOrders> {




  @override
  void initState() { 
    super.initState();

     WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<RequestController>().getMyRquests(context);


 });

  }











  @override
  Widget build(BuildContext context) {
      var controller = Provider.of<RequestController>(context);
    var appLocale =  AppLocalizations.of(context);

    return Scaffold(
      

appBar: mLightAppBar(context, translate(context, "manage_orders") ,
      
      
      IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back 
      // color: Colors.white
      ,))

,


      ),
      body: 
        RefreshIndicator(
          onRefresh: ()async{
   context.read<RequestController>().getMyRquests(context);
          },
          child: SizedBox.expand(
            child: Builder(builder: (_){
          
          
          if (controller.orders!.status==Status.LOADING) {
            return Center(
            child: mProgress(context ,fromPage: true),
            );
          } 
          else if( controller.orders!.status==Status.ERROR){
          return Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(controller.orders!.message!),
          const SizedBox(height: 10,) ,
          IconButton(onPressed: ()async{
            controller.getMyRquests(context );
          }, icon:  Icon(
            Icons.refresh ,color: Theme.of(context).primaryColor,
          ))
            ],
            ),
          );
          }
          else {
          
          return 
          controller.orders!.data!.isEmpty?
          Center(child: NoContent(
              
  currentLang(context)=="ar"?
  "لا توجد طلبات":"No Orders"
          ),)
          :
          ListView.builder(
            itemCount: controller.orders!.data!.length,
            itemBuilder: (BuildContext context, int index) {
            var orderData = controller.orders!.data![index];
            
            return  
ManagementOrderWidget(
  orderModel: orderData,
  onReply: (id){

OrderReply(
  order: id,
).launch(context).then((value) {
controller.getMyRquests(context);

});

  },
)   ;
          
            },
          );
          
          
          }
          
          
          
          
            }),
          ),
        ),
    
    
    );
  }
}