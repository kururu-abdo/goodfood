import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/new_maintance_order.dart';
import 'package:goodfoods/core/controllers/admin_home_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class BranchListMeintance extends StatefulWidget {
  const BranchListMeintance({ Key? key }) : super(key: key);

  @override
  _BranchListMeintanceState createState() => _BranchListMeintanceState();
}

class _BranchListMeintanceState extends State<BranchListMeintance> {



    @override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<AdminHomeController>().getBranches(context);
     });
  }

  @override
  Widget build(BuildContext context) {

  var controller = Provider.of<AdminHomeController>(context);

    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: mLightAppBar(context, translate(context, 'branches') ,
      
      
      IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back 
      // color: Colors.white
      ,))

,


      ),
    
    
    
    body: Stack(
      alignment: Alignment.center,
      children: [


        
        Builder(builder: (_){


if (controller.branches!.status==Status.LOADING) {
  return Center(
        child: mProgress(context ,fromPage: true),
  );
} 
else if( controller.branches!.status==Status.ERROR){
return Center(
  child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Text(controller.branches!.message!),
const SizedBox(height: 10,) ,
IconButton(onPressed: (){
  controller.getBranches(context);
}, icon:  Icon(
  Icons.refresh ,color: Theme.of(context).primaryColor,
))
        ],
  ),
);
}
else {

return

controller.branches!.data!.isEmpty?
Center(child: NoContent(translate(context, "no_branches")),)
:
// const SizedBox();
 ListView.builder(
  itemCount: controller.branches!.data!.length,
  itemBuilder: (BuildContext context, int index) {
        var branchData = controller.branches!.data![index];
        var files = 
        branchData.files!=null?
        jsonDecode(branchData.files.toString()) as List:[];
        return  
        
        
        
                  
Card(
  child:   ListTile(
  
    onTap: (){
        // BrnachMachines(cityId: branchData.id.toString(),).launch(context);
        //  BranchMeaintenancePage(
        //     branchId: branchData.id,
        //   ).launch(context);

 MaintenanceOrder(
  
      modelId: branchData.id.toString(),
      modelType: 'Branch',
      redionId: branchData.cityId.toString(),
    ).launch(context);

    },
  title: 
  // const Text("data")
  Text(currentLang(context)=="ar"?branchData.nameAr!.toString():branchData.nameEn!.toString())
  
  ,
  
  
  trailing: IconButton(onPressed: (){
  // BrnachMachines(cityId: branchData.id.toString(),).launch(context);
  //  BranchMeaintenancePage(
  //           branchId: branchData.id,
  //         ).launch(context);
   MaintenanceOrder(
  
      modelId: branchData.id.toString(),
      modelType: 'Branch',
      redionId: branchData.cityId.toString(),
    ).launch(context);
  }, icon: Icon(Icons.arrow_forward , color: Theme.of(context).primaryColor,)),
  ),
);

        
        
        
     
  },
);


}




        }),
    
    
    
    
    
    
    // mLightBottomNav(context)

      ],
    ),
    
    );
  }
}