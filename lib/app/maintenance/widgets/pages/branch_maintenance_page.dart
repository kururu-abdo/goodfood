import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/new_maintance_order.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/machine_list_maintenanc.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/skins_list_maintenance.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class BranchMeaintenancePage extends StatefulWidget {
  final int? branchId;
  const BranchMeaintenancePage({ Key? key, this.branchId }) : super(key: key);

  @override
  _BranchMeaintenancePageState createState() => _BranchMeaintenancePageState();
}

class _BranchMeaintenancePageState extends State<BranchMeaintenancePage> {
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
  child:   GridView.count(crossAxisCount: 2,
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
        Image.asset("assets/icons/machine.png"
         ,color: Colors.white,
         
         height: 80,width: 80,
         
         ),
const SizedBox(height: 10,),
          Text(
           
           currentLang(context)=="ar"?
           
           "المعدات":"Machines",style: const TextStyle(
           color: Colors.white
         ),)
      ],
    ),
  ),
  // child: ,
  ).onTap((){


MachineListMeintance(
  branchId: widget.branchId,
).launch(context);


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
        Image.asset("assets/images/السكنات-removebg-preview.png"
         ,color: Colors.white,
         
         height: 80,width: 80,
         
         ),
const SizedBox(height: 10,),
          Text(
           currentLang(context)=="ar"?
           
           "السكنات":"Houses" ,style: const TextStyle(
           color: Colors.white
         ),)
      ],
    ),
  ),
  // child: ,
  ).onTap((){
    SkinsListMeintance(
      branchId: widget.branchId,
    ).launch(context);
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
        Image.asset("assets/icons/dots.png"
         ,color: Colors.white,
         
         height: 80,width: 80,
         
         ),
const SizedBox(height: 10,),
          Text(
           
           currentLang(context)=="ar"?
           "صيانات اخرى" :"Others",style: const TextStyle(
           color: Colors.white
         ),)
      ],
    ),
  ),
  // child: ,
  ).onTap((){
    MaintenanceOrder(
      modelId: widget.branchId!.toString(),
      modelType: 'Branch',
    ).launch(context);
  }),
















],

  )
)





    );
  }
}