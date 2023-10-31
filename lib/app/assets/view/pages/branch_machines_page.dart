
import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/new_maintance_order.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class BrnachMachines extends StatefulWidget {
  final String? cityId;
  const BrnachMachines({ Key? key, this.cityId }) : super(key: key);

  @override
  _BrnachMachinesState createState() => _BrnachMachinesState();
}

class _BrnachMachinesState extends State<BrnachMachines> {

  @override
  void initState() { 
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<MaintenanceController>().
    getBranchAssets(context, 
    widget.cityId.toString()
    
    // 1.toString()
    // 
    );
      });
  }
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<MaintenanceController>(context);
    var appLocale =  AppLocalizations.of(context);
    return     Scaffold(
      

appBar: mLightAppBar(context, currentLang(context)=="ar"?"المعدات":"Machines" ,
      
      
      IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back 
      // color: Colors.white
      ,))
)
, 
body:
 RefreshIndicator(
          onRefresh: ()async{
 controller.getCityBranches(context,widget.cityId );
          },
          child: SizedBox.expand(
child: 
            Builder(builder: (_){
          
          
          if (controller.branchAssets!.status==Status.LOADING) {
            return Center(
            child: mProgress(context ,fromPage: true),
            );
          } 
          else if( controller.branchAssets!.status==Status.ERROR){
          return Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(controller.branchAssets!.message!),
          const SizedBox(height: 10,) ,
          IconButton(onPressed: (){
            controller.getCityBranches(context,widget.cityId );
          }, icon:  Icon(
            Icons.refresh ,color: Theme.of(context).primaryColor,
          ))
            ],
            ),
          );
          }
          else {
          
          return 
          controller.branchAssets!.data!.isEmpty?
          Center(child: NoContent(

currentLang(context)=="ar"?"لا توجد  معدات":"no Machines"

          ),):
          ListView.builder(
            itemCount: controller.branchAssets!.data!.length,
            itemBuilder: (BuildContext context, int index) {
            var regionData = controller.branchAssets!.data![index];
             

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


Transform.rotate(
  angle: 0,
  child: 
  regionData.imgUrl!=null?
  Image.network('https://goodfoodsa.co${ regionData.imgUrl}' ,
  // color: Colors.white,
   width: 80,
height: 80 ,

  ):
  
  
    Image.asset('assets/icons/machine.png' ,
    // color: Colors.white,
  width: 80,
height: 80 ,
  ),
),

const SizedBox(width: 8,),
Expanded(
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
              Text(
          currentLang(context)=="ar"?
              "الاسم :  ${regionData.nameAr }"  :
              "Name :  ${regionData.nameEn  }"  
            ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // color: Colors.white ,
              fontSize: 15
            ), 
             ),
const SizedBox(height: 8,),
              Text(
                currentLang(context)=="ar"?   
                    "عدد الصيانات:  ${regionData.maintainDuation!}"  :
            "Maintain. Duration :  ${regionData.maintainDuation!}"  ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
               fontSize: 12
            ), 
            
             ),
             const SizedBox(height: 8,),
              Text(
                currentLang(context)=="ar"?   
                    " اخر صيانة:  ${getPlainDate(regionData.lastMaintain! ,
                    
                    currentLang(context)=="ar"?"ar":"en_US"                    )}"  :
            "Last Maintain. :  ${getPlainDate(regionData.lastMaintain! ,
                    
                    currentLang(context)=="ar"?"ar":"en_US"                    )}"  ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
               fontSize: 10
            ), 
            
             ),
    ],
  ),
)
,const SizedBox(width: 5,),

TextButton(onPressed: (){
 MaintenanceOrder(
          modelId: regionData.id.toString(),
          modelType: 'Asset',
        ).launch(context);
}, child: Text(
  currentLang(context)=="ar"? "طلب صيانة":"Add order"

))
          ],
    ),
    );
Card(
  child:   ListTile(
  
    onTap: (){
      
    },
  title: 
  // const Text("data")
  Text(currentLang(context)=="ar"?regionData.nameAr!.toString():regionData.nameEn!.toString())
  
  ,
  
  
  trailing: IconButton(onPressed: (){
  
  }, icon: Icon(Icons.arrow_forward , color: Theme.of(context).primaryColor,)),
  ),
);

// DocumentWidget(
// id: documentData.id.toString(),
// docTitle: documentData.nameAr,

// documentDate: documentData.createdAt,
// icon: "assets/icons/document.png",
// onView: (id){


//   //go to view document page



// OpenDocumentPage(docID: id,).launch(context);
// },

// );



          
            },
          );
          
          
          }
          
          
          
          
            }),
         
         
          )
 )

    );
  }
}