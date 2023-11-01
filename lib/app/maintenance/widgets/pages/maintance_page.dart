import 'package:flutter/material.dart';
import 'package:goodfoods/app/assets/view/pages/maintainace_type.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/branch_list_maintenance.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/other_assets_maintenance.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({ Key? key }) : super(key: key);

  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Theme.of(context).primaryColor,
      appBar: mAppBar(context, null,
      
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back ,color: Colors.white,))
      ),
body: SizedBox.expand(
  child:  
   Stack(
     alignment: Alignment.center,
     children: [
       GridView.count(crossAxisCount: 2,
  mainAxisSpacing: 10,crossAxisSpacing: 10,
  padding: const EdgeInsets.all(15),
  childAspectRatio: 6/5,

children: [

           
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
            Image.asset("assets/icons/office.png"
             ,color: Colors.white,
             
             height: 80,width: 80,
             
             ),
const SizedBox(height: 10,),
              Text(
               
                currentLang(context)=="ar"?
               "الفروع":"Branches" ,style: const TextStyle(
               color: Colors.white
             ),)
          ],
        ),
  ),
  // child: ,
  ).onTap((){
    const BranchListMeintance().launch(context);
        // const BranchMeaintenancePage().launch(context);
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
            Image.asset("assets/images/السيارات-removebg-preview.png"
             ,color: Colors.white,
             
             height: 80,width: 80,
             
             ),
const SizedBox(height: 10,),
              Text(
                currentLang(context)=="ar"?
               
               "السيارات":"Cars" ,style: const TextStyle(
               color: Colors.white
             ),)
          ],
        ),
  ),
  // child: ,
  ).onTap((){
    const CarMaintainanceType().launch(context);
     
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
            Image.asset("assets/icons/financial.png"
             ,color: Colors.white,
             
             height: 80,width: 80,
             
             ),
const SizedBox(height: 10,),
              Text(
                currentLang(context)=="ar"?
               "الاصول الاخرى":"Other Assets" ,style: const TextStyle(
               color: Colors.white
             ),)
          ],
        ),
  ),
  // child: ,
  ).onTap((){


        const OtherAssetsListMeintance().launch(context);
  }),
  
//        Container(    padding: const EdgeInsets.all(10),

//         height: 150, 
//         width: 200,
//   decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.10)  ,
        
//   ),
//   child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset("assets/icons/instant-messaging.png"
//              ,color: Colors.white,
             
//              height: 80,width: 80,
             
//              ),
// const SizedBox(height: 10,),
//               Text(
//                currentLang(context)=="ar"?
//                "صيانة فورية" :"Urgent Maintanance",style: const TextStyle(
//                color: Colors.white
//              ),)
//           ],
//         ),
//   ),
//   // child: ,
//   ),










],

  ),
   
   
  //  mDarkBottomNav(context)
   
     ],
   )
  )
    );
  }
}