
import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/maintance_page.dart';
import 'package:goodfoods/app/maintenance/widgets/view/maintenance_filter_bottomsheet.dart';
import 'package:goodfoods/app/order/view/widgets/next_pg_btn.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/order_widget.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class MaintainanceDashboard extends StatefulWidget {
  final dynamic status;
  
  final int? region;
  const MaintainanceDashboard({ Key? key, this.status, this.region }) : super(key: key);

  @override
  _MaintainanceDashboardState createState() => _MaintainanceDashboardState();
}

class _MaintainanceDashboardState extends State<MaintainanceDashboard> {
 

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<MaintenanceController>().
    getMaintainOrders(context , widget.status , widget.region);
    });
  }
 
 
 
  @override
  Widget build(BuildContext context) {
var controller = Provider.of<MaintenanceController>(context);

    
     Widget mSideMenu(var text, var icon, Function onTap) {
      return SettingItemWidget(
        title: text,
        leading:
        (icon is String)?
        ImageIcon(AssetImage(icon) ,  
        
        color:
             Theme.of(context).textTheme.titleSmall!.color
        ): 

            Icon(icon, color:
             Theme.of(context).textTheme.titleSmall!.color),


        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          onTap.call();
        },
        titleTextStyle: secondaryTextStyle(size: 16),
      );
    }
    
    return 
    
      DefaultTabController(
          length: 3,
      
      child:
      
       Scaffold(

           appBar: AppBar(
elevation: 1,
             title: Text(  translate(context, "maintains")),
             actions:  [

            
IconButton(onPressed: (){
showModalBottomSheet(context: context,

shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(20)
  )
),
 builder: (_){
return  FilterBottomSheet(
  status: widget.status,
);
 });
}, icon: ImageIcon(const AssetImage('assets/icons/filter2.png') ,size: 20 , 
                   
                   color: Theme.of(context).primaryColor
                   ,),) ,

             ],
           )
            ,
           

       
         body: 
         
         
         
         RefreshIndicator(
           onRefresh: ()async{


             controller.getMaintainOrders(context , widget.status,  widget.region);
           },
           child: Builder(builder: (_){
         
         
         if (controller.maintainOrders!.status==Status.LOADING) {
           return Center(
             child: mProgress(context, fromPage: true),
           );
         } 
         else if( controller.maintainOrders!.status==Status.ERROR){
         return Center(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
         Text(controller.maintainOrders!.message!),
         const SizedBox(height: 10,) ,
         IconButton(onPressed: (){
           controller.getMaintainOrders(context , widget.status,  widget.region);
         }, icon:  Icon(
           Icons.refresh ,color: Theme.of(context).primaryColor,
         ))
             ],
           ),
         );
         }
         else {
         
         return 
         controller.adminOrders.isEmpty?
         Center(child: NoContent(translate(context, "no_maintain_orders")),):
         
         ListView.builder(
           itemCount:
          //  controller.adminOrders.length>10
           
           controller.maintainOrders!.data!.data!.nextPageUrl !=null
           ?
           
           
            controller.adminOrders.length+1
            :   
            controller.adminOrders.length, //logical
           itemBuilder: (BuildContext context, int index) {
        
             // var files = jsonDecode(carData.files!) as List;
             
            //  return const ListTile();
              if (index==controller.adminOrders.length+1
             
             && controller.maintainOrders!.data!.data!.nextPageUrl !=null
             ) {
               return NextPageButton(
                 isLaoding: controller.maintainOrdersPaginate!.status==Status.LOADING,
                 onTap: (){
// log(controller.maintainOrders!.data!.data!.nextPageUrl!);
controller.getMaintainOrdersPaginate(context, controller.maintainOrders!.data!.data!.nextPageUrl!);


                 },
               );
             }
             
        
                  else {
               var i =index==0?0: 
               index==controller.adminOrders.length?  index-1:index;
                  var orderData = controller.adminOrders[i];  //logical  
              return  OrderWidget(
                orderMapper: orderData,
                 );
             
              }
               
             
             
              
             
           
           },
         );
         
         
         }
         
         
         
         
             }),
         ),
     
     
//          Column(children: [  


// Container(
//   padding: const EdgeInsets.symmetric(horizontal: 10),
// margin: const EdgeInsets.only(
//   top: 10
// ),
//   height: MediaQuery.of(context).size.height/5,    
//     width: MediaQuery.of(context).size.width,

//   child:
//     SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       physics: const BouncingScrollPhysics(),
//       child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//           DasboardItem(
//         title: 'المكتملة' , count: 4,
//         themeColor: Colors.purple,
//        width:MediaQuery.of(context).size.width/3,
//       ) , 
//       DasboardItem(  width:MediaQuery.of(context).size.width/3,
//         title: 'قيد التنفيذ' , count: 4,
//         themeColor: Colors.purple,
//       ) ,     DasboardItem(
//         title: 'تم الالغاء' , count: 4,
//         themeColor: Colors.purple, 
//         width:MediaQuery.of(context).size.width/3,
//       ) , 
//       ],
//       ),
//     )
//    ,
// )

//  , 
//  const SizedBox(
//    height: 80,
//    child:  TabBar(
//      labelColor: Colors.black,
     
//           tabs: [
//             Tab(
//             text: 'قيد التفيذ',
//             // child: Tex,
//           iconMargin: EdgeInsets.only(
//             bottom: 5
//           ),
              
//               icon: Icon(Icons.directions_car)),
//             Tab(
//                    text: 'تم التنفيذ',
              
              
//               icon: Icon(Icons.directions_transit)),
//             Tab(
              
//                    text: 'تم الالغاء',
              
//               icon: Icon(Icons.directions_bike)),
//           ],
//         ),
//  )
//  , 
// const Expanded(child: 
// TabBarView(children: [

// OrderList(status: 0,) ,

// OrderList(status:1 ,) ,
// OrderList(status: 2,) ,


  
// ],)

// )

//          ]),






         floatingActionButton: 
         FloatingActionButton(onPressed: 
         
         
         (){


            const MaintenancePage().launch(context);
         }

         ,
         backgroundColor: Theme.of(context).primaryColor,
         child: const Icon(Icons.add ,color: Colors.white,),
         )
         
         .visible(
           sharedPrefs.authList.contains("branch")
         ),
      ),
    );
  
  }
}