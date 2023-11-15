import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/new_maintance_order.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/other_assets_maintenance.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class DepartmentMaintenancePage extends StatefulWidget {
    final String? deptId;

  const DepartmentMaintenancePage({ Key? key, this.deptId }) : super(key: key);

  @override
  _DepartmentMaintenancePageState createState() => _DepartmentMaintenancePageState();
}

class _DepartmentMaintenancePageState extends State<DepartmentMaintenancePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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


         OtherAssetsListMeintance(
          deptId: widget.deptId,
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
        Image.asset("assets/icons/machine.png"
         ,color: Colors.white,
         
         height: 80,width: 80,
         
         ),
const SizedBox(height: 10,),
          Text(
           
           currentLang(context)=="ar"?
           
           "اخرى":"Other",style: const TextStyle(
           color: Colors.white
         ),)
      ],
    ),
  ),
  // child: ,
  ).onTap((){


// MachineListMeintance(
//   branchId: widget.branchId,
// ).launch(context);

MaintenanceOrder(
  modelId: widget.deptId,
  modelType: 'Department',
).launch(context);
  }),
  








])
)
    );
  }
}