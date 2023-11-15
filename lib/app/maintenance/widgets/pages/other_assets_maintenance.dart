
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

class OtherAssetsListMeintance extends StatefulWidget {
  final String? deptId;
  const OtherAssetsListMeintance({ Key? key, this.deptId }) : super(key: key);

  @override
  _OtherAssetsListMeintanceState createState() => _OtherAssetsListMeintanceState();
}

class _OtherAssetsListMeintanceState extends State<OtherAssetsListMeintance> {



    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // context.read<MaintenanceController>().getOtherAssets(context);
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<MaintenanceController>().getDepartementAssets(context , widget.deptId!);

     });
  }

  @override
  Widget build(BuildContext context) {

  var controller = Provider.of<MaintenanceController>(context);

    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: mLightAppBar(context, 
     translate(context, "other_assests") ,
      
      
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


if (controller.departmeentAssets!.status==Status.LOADING) {
  return Center(
        child: mProgress(context ,fromPage: true),
  );
} 
else if( controller.departmeentAssets!.status==Status.ERROR){
return Center(
  child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Text(controller.departmeentAssets!.message!),
const SizedBox(height: 10,) ,
IconButton(onPressed: (){
  controller.getDepartementAssets(context,widget.deptId!);
}, icon:  Icon(
  Icons.refresh ,color: Theme.of(context).primaryColor,
))
        ],
  ),
);
}
else {

return 

controller.departmeentAssets!.data!.isEmpty?
Center(child: NoContent(currentLang(context)=="ar"?

"لا توجد اصول":"No Assets"
),):

ListView.builder(
  itemCount: controller.departmeentAssets!.data!.length,
  itemBuilder: (BuildContext context, int index) {
        var assetData = controller.departmeentAssets!.data![index];
        var files = 
        assetData.files!=null?
       assetData.files!:[];
        return   
        
        
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/8,


          margin: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
 padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
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


        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


files.isNotEmpty?
Image.network('https://goodfoodsa.co${files.first}' ,
// color: Colors.white,
width: 50,

):


      Center(
        child: Image.asset('assets/icons/machine.png'  ,
      height: 50,
        // ,color:
        //  Colors.white,
      width: 50,
      color: Theme.of(context).primaryColor,
      
      ),
      ),

const SizedBox(width: 10,),
Expanded(
  child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
              Text(

                currentLang(context)=="ar"?
           assetData.nameAr! :  assetData.nameEn! ,maxLines: 1,overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // color: Colors.white ,
              fontSize: 20 ,
              fontWeight: FontWeight.bold
            ), 
             ),
const SizedBox(height: 8,),
              Text(   currentLang(context)=="ar"?
            "${assetData.desAr}" :   "${assetData.desEn}" ,
maxLines: 2,
overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // color: Colors.white ,
              fontSize: 15 ,fontWeight: FontWeight.w400 ,color: Colors.grey
            ), 
             ),
        ],
  ),
)
 , const SizedBox(width: 10,),


TextButton(onPressed: (){
MaintenanceOrder(
  modelType: 'OtherAsset',
  modelId: assetData.id.toString(),
).launch(context);
}, child: Text(
  currentLang(context)=="ar"? "طلب صيانة":"Add order"

))

          ],
        ),
        ).onTap((){
MaintenanceOrder(
  modelType: 'OtherAsset',
  modelId: assetData.id.toString(),
).launch(context);

        });





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