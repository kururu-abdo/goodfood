import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/report_details.dart';
import 'package:goodfoods/app/report/controllers/report_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class AdminRepors extends StatefulWidget {
    final bool? fromDashboard;

  const AdminRepors({ Key? key, this.fromDashboard =false}) : super(key: key);

  @override
  _AdminReporsState createState() => _AdminReporsState();
}

class _AdminReporsState extends State<AdminRepors> {




  @override
  void initState() { 
    super.initState();
    context.read<ReportController>().getReports(context);
  }
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ReportController>(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      
       
        appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (){

          }, icon: const ImageIcon(AssetImage('assets/icons/headset.png')))
        ,
          IconButton(onPressed: (){

          }, icon: const ImageIcon(AssetImage('assets/icons/bell.png')))
        
        
        
        ],
        backgroundColor: Colors.white,
        titleSpacing: 0,
        
        leading: widget.fromDashboard!?const SizedBox(): 


        IconButton(onPressed: (){
Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        title: Image.asset('assets/images/logo.png' ,
        width: 150,
        
        ),
      ),
     
body: Container(
  
  padding: const EdgeInsets.all(10),
  child: 
  
  
  
        
        Builder(builder: (_){


if (controller.repors!.status==Status.LOADING) {
  return Center(
        child: mProgress(context ,fromPage: true),
  );
} 
else if( controller.repors!.status==Status.ERROR){
return Center(
  child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Text(controller.repors!.message!),
const SizedBox(height: 10,) ,
IconButton(onPressed: (){
  controller.getReports(context);
}, icon:  Icon(
  Icons.refresh ,color: Theme.of(context).primaryColor,
))
        ],
  ),
);
}
else {

return
controller.repors!.data!.isEmpty?
Center(
  child:   NoContent(
   locale!.locale.languageCode=="ar"?
   "لا توجد تقارير":"No Reports"
  ),
)
:
 ListView.builder(
  itemCount: controller.repors!.data!.length,
  itemBuilder: (BuildContext context, int index) {
        var reportData = controller.repors!.data![index];
     return    
Container(
  //  height: 200.0,
  // width: 200.0,
  margin: const EdgeInsets.only(
    bottom: 10
  ),
  padding: const EdgeInsets.all(5),
  decoration:  BoxDecoration(
    color: const Color(0xFFffffff),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.20),
        blurRadius: 5.0, // soften the shadow
        spreadRadius: 2.0, //extend the shadow
        offset: const Offset(
          1.0, // Move to right 5  horizontally
          2.0, // Move to bottom 5 Vertically
        ),
      )
    ],
  ),

  child:  ListTile(
    title:  Text(
      
      locale!.locale.languageCode=="ar"?
"تقرير ${reportData.id}":
      'Report ${reportData.id}'),      
    subtitle:  Text(getMaintenanceFormattedDate("${reportData.createdAt}",
    
    locale.locale.languageCode=="ar"?
    "ar":"en_US"
    
    ))  ,
    trailing: IconButton(onPressed: (){
 ReportDetailsPage(

  reportId: reportData.id.toString(),
).launch(context);
    }, icon: const Icon(Icons.arrow_forward)),
  ),
);

  },
);


}




        }),
    
    
  
//   ListView(

//     children: [

// Container(
//   //  height: 200.0,
//   // width: 200.0,
//   margin: const EdgeInsets.only(
//     bottom: 10
//   ),
//   padding: const EdgeInsets.all(5),
//   decoration:  BoxDecoration(
//     color: const Color(0xFFffffff),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(.20),
//         blurRadius: 5.0, // soften the shadow
//         spreadRadius: 2.0, //extend the shadow
//         offset: const Offset(
//           1.0, // Move to right 5  horizontally
//           2.0, // Move to bottom 5 Vertically
//         ),
//       )
//     ],
//   ),

//   child:  ListTile(
//     title: const Text('Report 1'),      
//     subtitle: const Text('12-09-2022')  ,
//     trailing: IconButton(onPressed: (){
// const ReportDetailsPage().launch(context);
//     }, icon: const Icon(Icons.arrow_forward)),
//   ),
// )

//  ,

 
// Container(
//   //  height: 200.0,
//   // width: 200.0,
//   margin: const EdgeInsets.only(
//     bottom: 10
//   ),
//   padding: const EdgeInsets.all(5),
//   decoration:  BoxDecoration(
//     color: const Color(0xFFffffff),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(.20),
//         blurRadius: 5.0, // soften the shadow
//         spreadRadius: 2.0, //extend the shadow
//         offset: const Offset(
//           1.0, // Move to right 5  horizontally
//           2.0, // Move to bottom 5 Vertically
//         ),
//       )
//     ],
//   ),

//   child:  ListTile(
//     title: const Text('Report 1'),      
//     subtitle: const Text('12-09-2022')  ,
//     trailing: IconButton(onPressed: (){

//     }, icon: const Icon(Icons.arrow_forward)),
//   ),
// )

//  ,

//     ],
//   ),



),

    );
  }
}