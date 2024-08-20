
import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/new_maintance_order.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class SkinsListMeintance extends StatefulWidget {
  final  int? branchId;
  const SkinsListMeintance({ Key? key, this.branchId }) : super(key: key);

  @override
  _SkinsListMeintanceState createState() => _SkinsListMeintanceState();
}

class _SkinsListMeintanceState extends State<SkinsListMeintance> {



    @override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
  context.read<MaintenanceController>().
    getSkins(context, 
    // widget.branchId.toString()
    
    2.toString()
    
    );

   });
    
  }

  @override
  Widget build(BuildContext context) {

  var controller = Provider.of<MaintenanceController>(context);

    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: mLightAppBar(context, translate(context, 'skins') ,
      
      
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


if (controller.skins!.status==Status.LOADING) {
  return Center(
        child: mProgress(context ,fromPage: true),
  );
} 
else if( controller.skins!.status==Status.ERROR){
return Center(
  child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Text(controller.skins!.message!),
const SizedBox(height: 10,) ,
IconButton(onPressed: (){
  controller.getSkins(context,
  
  2.toString()
  );
}, icon:  Icon(
  Icons.refresh ,color: Theme.of(context).primaryColor,
))
        ],
  ),
);
}
else {

return 
controller.skins!.data!.isEmpty?

Center(child:NoContent(
  
  currentLang(context)=="ar"?
  "لا توجد مساكن":"No Housing"
),)
:
ListView.builder(
  itemCount: controller.skins!.data!.length,
  itemBuilder: (BuildContext context, int index) {
        var skinData = controller.skins!.data![index];
        // var files = 
        // skinData.!=null?
        // jsonDecode(skinData.files!) as List:[];
        return   Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height/8,


          margin: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
 padding: const EdgeInsets.symmetric(horizontal: 10 , 
 vertical: 5),
          decoration: BoxDecoration(

borderRadius: BorderRadius.circular(5) ,
color: Colors.white,
 boxShadow: const [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 2.0,
      offset: Offset(0.0, 3.0),
      )
      ],
    
          ),


        child:

        ListTile(

          title:  Text(
           skinData.nameAr! ,
            style: const TextStyle(
              // color: Colors.white ,
              fontSize: 20 ,
              fontWeight: FontWeight.bold
            ), 
             )
        )
        
        
//          Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [


// Expanded(
//   child:   Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//               Text(
//            skinData.nameAr! ,
//             style: const TextStyle(
//               // color: Colors.white ,
//               fontSize: 20 ,
//               fontWeight: FontWeight.bold
//             ), 
//              ),
// const SizedBox(height: 8,),
//               Text(
//             "Num of Branches: ${skinData.branchs}"  ,
//             style: const TextStyle(
//               // color: Colors.white ,
//               fontSize: 15 ,fontWeight: FontWeight.w500
//             ), 
//              ),
//         ],
//   ),
// )


//           ],
//         ),
    
    
    
        ).onTap(
          (){
            MaintenanceOrder(
              modelType: "Skin",
              modelId: skinData.id!.toString(),
            ).launch(context);
          }
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