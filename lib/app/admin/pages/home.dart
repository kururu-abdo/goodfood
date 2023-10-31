import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/documents/views/pages/documents_page.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/maintainenace_dashboard.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/user_maintenance_orders.dart';
import 'package:goodfoods/app/managment_orders/views/pages/mangement_orders.dart';
import 'package:goodfoods/app/report/view/pages/reports.dart';
import 'package:goodfoods/core/controllers/admin_home_controller.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/services/notification_plugin.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() { 
    super.initState();
    NotificationApi.notificationHandler();

context.read<AdminHomeController>().updateToken();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

    
      
appBar: 
      mAppBar(context, null),


body: SizedBox.expand(
  child:   Stack(
    alignment: Alignment.center,
    children: [
      GridView.count(crossAxisCount: 2,
      mainAxisSpacing: 10,crossAxisSpacing: 10,
      padding: const EdgeInsets.all(15),
      childAspectRatio: 6/5,
      children: [
      
//            if(sharedPrefs.authList.contains("branch"))
//        Container(    padding: const EdgeInsets.all(10),

//         height: 150, 
//         width: 200,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.10)  ,
        
//       ),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset("assets/icons/office.png"
//              ,color: Colors.white,
             
//              height: 80,width: 80,
             
//              ),
// const SizedBox(height: 10,),
//               Text(translate(context, "branches"),style: const TextStyle(
//                color: Colors.white
//              ),)
//           ],
//         ),
//       ),
//       // child: ,
//       ),
      
      
       if(sharedPrefs.authList.contains("branch") || sharedPrefs.isMaintain)
       Container(    padding: const EdgeInsets.all(10)
       
       
       
       ,

        height: 150, 
        width: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.10)  ,
        
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/صيانة_الفروع-removebg-preview.png"
             ,color: Colors.white,
             
             height: 80,width: 80,
             
             ),
const SizedBox(height: 10,),
              Text(
               
               translate(context, "maintenance") ,style: const TextStyle(
               color: Colors.white
             ),)
          ],
        ),
      ),
      // child: ,
      ).onTap((){

 if(sharedPrefs.authList.contains("branch")){
const MaintainanceDashboard().launch(context);
 }else {
   const UserMaintenanceOrders().launch(context);
 }
       
      }),
      
      
      
 
        
       Container(    padding: const EdgeInsets.all(10),

        height: 150, 
        width: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.10)  ,
        
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/التقارير-removebg-preview.png"
             ,color: Colors.white,
             
             height: 80,width: 80,
             
             ),
const SizedBox(height: 10,),
              Text(translate(context, "reports") ,style: const TextStyle(
               color: Colors.white
             ),)
          ],
        ),
      ),
      // child: ,
      ).onTap((){

Navigator.of(context)
.push(
  MaterialPageRoute(builder: (_)=> const AdminRepors()  )
);

      }), 


      Container(    padding: const EdgeInsets.all(10),

        height: 150, 
        width: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.10)  ,
        
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icons/requests.png"
             ,color: Colors.white,
             
             height: 80,width: 80,
             
             ),
const SizedBox(height: 10,),
              Text(translate(context, "manage_orders")! ,
              
              maxLines: 1 ,overflow: TextOverflow.ellipsis
              ,style: const TextStyle(
               color: Colors.white
             ),)
          ],
        ),
      ),
      // child: ,
      ).onTap((){

Navigator.of(context)
.push(
  MaterialPageRoute(builder: (_)=> const ManagmentOrders()  )
);

      }), 

       Container(    padding: const EdgeInsets.all(10),

        height: 150, 
        width: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.10)  ,
        
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/send.png"
             ,color: Colors.white
             ,
             height: 80,width: 80,
             
             ),
const SizedBox(height: 10,),
              Text(translate(context, "chat") ,style: const TextStyle(
               color: Colors.white
             ),)
          ],
        ),
      ),
      // child: ,
      ).onTap((){
      const ChagePage().launch(context);
      // ChatPage2().launch(context);
      })
      ,
      
//          Container(
//         height: 150, 
//         width: 200,
//         padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.10)  ,
        
//       ),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset("assets/images/الطلبات-removebg-preview.png"
//              ,color: Colors.white,
             
//              height: 80,width: 80,
             
//              ),
// const SizedBox(height: 10,),
//               Text(translate(context, "orders") ,style: const TextStyle(
//                color: Colors.white
//              ),)
//           ],
//         ),
//       ),
//       // child: ,
//       ) ,
      
      

        Container(
        height: 150, 
        width: 200,    padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.10)  ,
        
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/icons/document.png"
             ,color: Colors.white,
             
             height: 80,width: 80,
             
             ),
const SizedBox(height: 10,),
              Text(translate(context, "manage_documents"),
              
                maxLines: 1 ,overflow: TextOverflow.ellipsis
               ,style: const TextStyle(
               color: Colors.white
             ),)
          ],
        ),
      ),
      // child: ,
      ).onTap((){


        const DocumentsPage().launch(context);
      })
      
      




,




//         Container(
//         height: 150, 
//         width: 200,    padding: const EdgeInsets.all(10),

//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.10)  ,
        
//       ),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset("assets/icons/language.png"
//              ,color: Colors.white,
             
//              height: 80,width: 80,
             
//              ),
// const SizedBox(height: 10,),
//               Text(translate(context, "lang") ,style: const TextStyle(
//                color: Colors.white
//              ),)
//           ],
//         ),
//       ),
//       // child: ,
//       )
      
      




      ],
      
      
      ),
    
    
    
      //  mDarkBottomNav(context)

    ],
  ),
),
drawer: const Drawer(),

    );
  }
}