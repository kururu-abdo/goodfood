
import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/maintance_page.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/order_widget.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class MaintainanceDashboard extends StatefulWidget {
  const MaintainanceDashboard({ Key? key }) : super(key: key);

  @override
  _MaintainanceDashboardState createState() => _MaintainanceDashboardState();
}

class _MaintainanceDashboardState extends State<MaintainanceDashboard> {
 

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<MaintenanceController>().getMaintainOrders(context);
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

           appBar: mLightAppBar(context,
            translate(context, "maintains"),
      
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back ,
      color: Colors.black,))
      ),
// drawer:

// Drawer(
//     child: ListView(
//       // Important: Remove any padding from the ListView.
//       padding: EdgeInsets.zero,
//       children: [
//           UserAccountsDrawerHeader( // <-- SEE HERE
//           decoration: const BoxDecoration(color: 
          
//           scaffoldLightColor
          
//           ),
//           accountName: const Text(
//             "السماني",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.black
//             ),
//           ),
//           accountEmail: const Text(
//             "فني صيانة",

//             style: TextStyle(
//                color: Colors.black ,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           currentAccountPictureSize:const Size.square(100.0) ,
//           currentAccountPicture: SizedBox(
//             width: 200,
//             child: Image.asset('assets/images/logo.png' ,
            
//             // width: 200,
//             // height: 150,
//             ),
//           ),
//         ),
//    Divider(height: 4, thickness: 2, color: context.dividerColor)
//                       .paddingOnly(top: 16, bottom: 8)
//                       .visible(true),
//                   mSideMenu(
//                       'رسالة',
//                        'assets/icons/headset.png',
//                       () async {  Navigator.pop(context);
//                    const ChagePage().launch(context);
//                   }).visible(true),  
//  Divider(height: 4, thickness: 2, color: context.dividerColor)
//                       .paddingOnly(top: 16, bottom: 8)
//                       .visible(true),
//                   mSideMenu(
//                       'تغيير اللغة',
//                        'assets/icons/language.png',
//                       () async {
//                           Navigator.pop(context);
//                    showAdaptiveActionSheet(
//  context: context,
//  title: const Text('الرجاء اختيار  اللغة: '),
//  androidBorderRadius: 30,
//  actions: <BottomSheetAction>[
//     BottomSheetAction(leading: const Text('عربي'),
//     title: const SizedBox(),
//    trailing: const Icon(Icons.fire_truck),
//      onPressed: (context) {


//     }),
//     BottomSheetAction(
//          trailing: const Icon(Icons.car_crash),

//       title: const SizedBox(),
//       leading: const Text('انجليزي'), onPressed: (context) {}),
//  ],
//  cancelAction: CancelAction(
   
//    textStyle: TextStyle(
//      color: Theme.of(context).primaryColor
//    ),
//    title: const Text('ألغاء')),// onPressed parameter is optional by default will dismiss the ActionSheet
// );


//                   }).visible(true), 
  
  
  
//                        Divider(height: 4, thickness: 2, color: context.dividerColor)
//                       .paddingOnly(top: 16, bottom: 8)
//                       .visible(true),
//                   mSideMenu(
//                       'خروج',
//                        'assets/icons/power-off.png',
//                       () async {  Navigator.pop(context);
//                    Dialogs.materialDialog(
//           msg: 'Are you want to sign out?',
//           title: "Signout",
//           color: Colors.white,
//           context: context,
//           actions: [
//             IconsOutlineButton(
//               onPressed: () {
                
//               },
//               text: 'Cancel',
//               iconData: Icons.cancel_outlined,
//               textStyle: const TextStyle(color: Colors.grey),
//               iconColor: Colors.grey,
//             ),
//             IconsButton(
//               onPressed: () {

// sharedPrefs.clear();
// const SplashScreen().launch(context);

//               },
//               text: 'Signout',
//               iconData: Icons.delete,
//               color: Colors.red,
//               textStyle: const TextStyle(color: Colors.white),
//               iconColor: Colors.white,
//             ),
//           ]);
//                   }).visible(true),

        
      
//       ],
//     ),
//   ),


          
          
          
          
//           appBar: 
        
//         AppBar(
//           elevation: 0,
//           actions: [
//             IconButton(onPressed: (){
//     const ChagePage().launch(context);
//             }, icon: const ImageIcon(AssetImage('assets/icons/headset.png')))
//           ,
//             IconButton(onPressed: (){
//     const NotificationPage().launch(context);
//             }, icon: const ImageIcon(AssetImage('assets/icons/bell.png')))
          
          
          
//           ],
//           backgroundColor: Colors.white,
//           titleSpacing: 0,
          
//           // leading:  const SizedBox()
          
//           //  widget.fromDashboard!?const SizedBox()
//           //  : 

//           //  ,
    
    
//     //       IconButton(onPressed: (){
//     // Navigator.pop(context);
//     //       }, icon: const Icon(Icons.arrow_back))
          
          
//           title: Image.asset('assets/images/logo.png' ,
//           width: 150,
          
//           ),
//         ),
       
         body: 
         
         
         
         RefreshIndicator(
           onRefresh: ()async{


             controller.getMaintainOrders(context);
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
           controller.getMaintainOrders(context);
         }, icon:  Icon(
           Icons.refresh ,color: Theme.of(context).primaryColor,
         ))
             ],
           ),
         );
         }
         else {
         
         return 
         controller.maintainOrders!.data!.isEmpty?
         Center(child: NoContent(translate(context, "no_maintain_orders")),):
         
         ListView.builder(
           itemCount: controller.maintainOrders!.data!.length,
           itemBuilder: (BuildContext context, int index) {
             var orderData = controller.maintainOrders!.data![index];
             // var files = jsonDecode(carData.files!) as List;
             return 
             
             OrderWidget(to: const ['Samani' ,'Husam']  , 
                 
                 from:sharedPrefs.user_name,
                 to2: orderData.forwardTo!.admin!.name,
                 fileLink: 'a.com',
                 orderId: orderData.forwardTo!.maintainId!.toString(),
                 date: orderData.createdAt,
                 orderTitle: 'maintanenace machine x',
         files: orderData.files,
         
                 task: orderData.task!,
                 orderDate: 
                 getMaintenanceFormattedDate(
            orderData.createdAt!
                 )
                 
                 
                 // '12-10-2023'
                 ,
                 status: orderData.status,
                 confirmed: orderData.forwardTo!.confirmed,
                 );
           
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
         ).visible(
           sharedPrefs.authList.contains("branch")
         ),
      ),
    );
  
  }
}