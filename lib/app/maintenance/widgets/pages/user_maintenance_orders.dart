import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/order_widget.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:provider/provider.dart';

class UserMaintenanceOrders extends StatefulWidget {
  const UserMaintenanceOrders({ Key? key }) : super(key: key);

  @override
  _UserMaintenanceOrdersState createState() => _UserMaintenanceOrdersState();
}

class _UserMaintenanceOrdersState extends State<UserMaintenanceOrders> {
  
  @override
  void initState() { 
    super.initState();


     WidgetsBinding.instance.addPostFrameCallback((_) {
  
  context.read<MaintenanceController>().
  getUserOrders(context);
     } );

  
  
  
  
  
  
  }
  
  
  @override
  Widget build(BuildContext context) {

var controller = Provider.of<MaintenanceController>(context);







    return   Scaffold(

           appBar: mLightAppBar(context,translate(context, 'maintains'),
      
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back ,
      color: Colors.black,))
      ),


  body: 
         
         
         
         RefreshIndicator(
           onRefresh: ()async{
              
  context.read<MaintenanceController>().
  getUserOrders(context);
           },
           child: Builder(builder: (_){
         
         
         if (controller.userOrders!.status==Status.LOADING) {
           return Center(
             child: mProgress(context, fromPage: true),
           );
         } 
         else if( controller.userOrders!.status==Status.ERROR){
         return Center(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
         Text(controller.userOrders!.message!),
         const SizedBox(height: 10,) ,
         IconButton(onPressed: (){
           context.read<MaintenanceController>().
  getUserOrders(context);
         }, icon:  Icon(
           Icons.refresh ,color: Theme.of(context).primaryColor,
         ))
             ],
           ),
         );
         }
         else {
         
         return ListView.builder(
           itemCount: controller.userOrders!.data!.data!.length,
           itemBuilder: (BuildContext context, int index) {
             var orderData = controller.userOrders!.data!.data![index];
             // var files = jsonDecode(carData.files!) as List;
             return 
             
             OrderWidget(to: const ['Samani' ,'Husam']  , 
                 
                 from:orderData.maintainOrder!.admin!.name,
                 confirmed: orderData.confirmed,
                 fileLink: 'a.com',
                 to2: sharedPrefs.user_name,
                 orderTitle: 'maintanenace machine x',
         files: orderData.maintainOrder!.files,
         
         orderId: orderData.maintainOrder!.id.toString(),
                 task: orderData.maintainOrder!.task,
                 orderDate: 
                 getMaintenanceFormattedDate(
            orderData.createdAt!
                 ),
                 date:  orderData.createdAt!,
                 
                 // '12-10-2023'
                 
                 status: orderData.maintainOrder!.status,
         
                 
                 );
           
           },
         );
         
         
         }
         
         
         
         
             }),
         ),
     













    );
  }
}