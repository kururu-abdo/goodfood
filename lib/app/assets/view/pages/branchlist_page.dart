import 'package:flutter/material.dart';
import 'package:goodfoods/app/assets/view/pages/branch_machines_page.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class BranchListPage extends StatefulWidget {
  final String? cityId;
  const BranchListPage({ Key? key, this.cityId }) : super(key: key);

  @override
  _BranchListPageState createState() => _BranchListPageState();
}

class _BranchListPageState extends State<BranchListPage> {
  
      @override
  void initState() {
    // TODO: implement initState
    super.initState();

     WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<MaintenanceController>().getCityBranches(context ,
    widget.cityId
    
    );

     });
  }
  @override
  Widget build(BuildContext context) {
   var controller = Provider.of<MaintenanceController>(context);
    var appLocale =  AppLocalizations.of(context);
    return     Scaffold(
      

appBar: mLightAppBar(context, currentLang(context)=="ar"?"الفروع":"Branches" ,
      
      
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
          controller.branches!.data!.isEmpty?
          Center(child: NoContent(

currentLang(context)=="ar"?"لا توجد فروع بالمدينة":"no branches in this city"

          ),):
          ListView.builder(
            itemCount: controller.branches!.data!.length,
            itemBuilder: (BuildContext context, int index) {
            var regionData = controller.branches!.data![index];
            
            return  

            
Card(
  child:   ListTile(
  
    onTap: (){
        BrnachMachines(cityId: regionData.id.toString(),).launch(context);
    },
  title: 
  // const Text("data")
  Text(currentLang(context)=="ar"?regionData.nameAr!.toString():regionData.nameEn!.toString())
  
  ,
  
  
  trailing: IconButton(onPressed: (){
  BrnachMachines(cityId: regionData.id.toString(),).launch(context);
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