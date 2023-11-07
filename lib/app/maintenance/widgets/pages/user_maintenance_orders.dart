import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/widgets/view/maintenance_filter_bottomsheet.dart';
import 'package:goodfoods/app/order/view/widgets/next_pg_btn.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
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

           appBar:
           AppBar(
             elevation: 1,
             title: Text(translate(context, 'maintains')),

             actions: [
               
IconButton(onPressed: (){
showModalBottomSheet(context: context,

shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(20)
  )
),
 builder: (_){
return const FilterBottomSheet(isMaintain: true,);
 });
}, icon: ImageIcon(const AssetImage('assets/icons/filter2.png') ,size: 20 , 
                   
                   color: Theme.of(context).primaryColor
                   ,),) ,


  //       PopupMenuButton(
  //                  // add icon, by default "3 dot" icon
  //                  icon:  ImageIcon(const AssetImage('assets/icons/filter2.png') ,size: 20 , 
                   
  //                  color: Theme.of(context).primaryColor
  //                  ,),
  //                  itemBuilder: (context){
  //                    return [
  //                            PopupMenuItem<int>(
  //                               value: 0,
  //                               child: Text(


  //                                 currentLang(context)=="ar"?
  //                                 "طلبات جديدة":"New Orders"
  //                               ),
  //                           ),

  //                            PopupMenuItem<int>(
  //                               value: 1,
  //                               child: Text(

  //                                   currentLang(context)=="ar"?
  //                                 "طلبات قيد الاغلاق":" Closing Orders"
  //                               ),
  //                           ),

  //                          PopupMenuItem<int>(
  //                               value: 2,
  //                               child: Text(

  //                                   currentLang(context)=="ar"?
  //                                 "طلبات  مغلقة":" Closed Orders"
  //                               ),
  //                           ),


  //                       ];
  //                  },
  //                  onSelected:(value){
  //                     if(value == 0){
  //                        print("My account menu is selected.");
  //                     }else if(value == 1){
  //                        print("Settings menu is selected.");
  //                     }else if(value == 2){
  //                        context.read<MaintenanceController>().
  // getUserOrders(context , status: 2.toString());
  //                     }
  //                  }
  //                 ),


             ],
           ),
           
            // mLightAppBar(context,translate(context, 'maintains'),
      
      // IconButton(onPressed: (){
      //   Navigator.pop(context);
      // }, icon: const Icon(Icons.arrow_back ,
      // color: Colors.black,))
      // ),


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
         
         return 
         
         controller.userOrdersData.isEmpty?
         Center(child: NoContent(currentLang(context)=="ar"?
         "لا توجد طلبات"
         :"No Orders"
         ),) :
         ListView.builder(
           itemCount: controller.userOrdersData.length+1,
           itemBuilder: (BuildContext context, int index) {
             // var files = jsonDecode(carData.files!) as List;


             if (index==controller.userOrdersData.length
             
             && controller.userOrders!.data!.nextPageUrl!=null
             ) {
               return NextPageButton(
                 isLaoding: controller.userOrderPaginate!.status==Status.LOADING,
                 onTap: (){

controller.getUserOrdersPaginate(context, controller.userOrders!.data!.nextPageUrl);


                 },
               );
             }
             else {
               var i =index==0?0: index==controller.userOrdersData.length?  index-1:index;
               var orderData = controller.userOrdersData[i];

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
           
             }

           
           },
         );
         
         
         }
         
         
         
         
             }),
         ),
     













    );
  }
}