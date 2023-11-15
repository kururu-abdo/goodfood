import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/department_maintanance_page.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class DepartmentListMaintanance extends StatefulWidget {
  const DepartmentListMaintanance({ Key? key }) : super(key: key);

  @override
  _DepartmentListMaintananceState createState() => _DepartmentListMaintananceState();
}

class _DepartmentListMaintananceState extends State<DepartmentListMaintanance> {

  @override
  void initState() { 
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<MaintenanceController>().getDepartements(context);

     });
  }
  @override
  Widget build(BuildContext context) {
   var controller = Provider.of<MaintenanceController>(context);
    var appLocale =  AppLocalizations.of(context);
    return     Scaffold(
      

appBar: mLightAppBar(context, currentLang(context)=="ar"?"الاقسام":"Departments" ,
      
      
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
 controller.getDepartements(context);
          },
          child: SizedBox.expand(
child: 
            Builder(builder: (_){
          
          
          if (controller.departments2!.status==Status.LOADING) {
            return Center(
            child: mProgress(context ,fromPage: true),
            );
          } 
          else if( controller.departments2!.status==Status.ERROR){
          return Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(controller.departments2!.message!),
          const SizedBox(height: 10,) ,
          IconButton(onPressed: (){
            controller.getDepartements(context );
          }, icon:  Icon(
            Icons.refresh ,color: Theme.of(context).primaryColor,
          ))
            ],
            ),
          );
          }
          else {
          
          return 
          controller.departments2!.data!.isEmpty?
          Center(child: NoContent(

currentLang(context)=="ar"?"لا توجد اقسام ":"no departments"

          ),):
          ListView.builder(
            itemCount: controller.departments2!.data!.length,
            itemBuilder: (BuildContext context, int index) {
            var regionData = controller.departments2!.data![index];
            
            return  

            
Card(
  child:   ListTile(
  
    onTap: (){
      DepartmentMaintenancePage(deptId: regionData.id.toString()).launch(context);
        // DepartmentAssetsPage(deptId: regionData.id.toString(),).launch(context);

    },
  title: 
  // const Text("data")
  Text(currentLang(context)=="ar"?regionData.nameAr!.toString():regionData.nameEn!.toString())
  
  ,
  
  
  trailing: IconButton(onPressed: (){
          DepartmentMaintenancePage(deptId: regionData.id.toString(),).launch(context);

  // DepartmentAssetsPage(deptId: regionData.id.toString(),).launch(context);
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