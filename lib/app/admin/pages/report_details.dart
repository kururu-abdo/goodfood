import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/report/controllers/report_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/presentation/widgets/task_widget.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ReportDetailsPage extends StatefulWidget {
  final String? reportId;
  final bool? isEmp;
  const ReportDetailsPage({ Key? key, this.reportId, this.isEmp =false}) : super(key: key);

  @override
  _ReportDetailsPageState createState() => _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<ReportDetailsPage> {
  int? activeMeterIndex; // Expansion Panel
  final StreamController activeMeterIndexStreamControl =
      StreamController.broadcast();
  Stream get onUpdateActiveIndex => activeMeterIndexStreamControl.stream;
  void updateExpansionTile() =>
      activeMeterIndexStreamControl.sink.add(activeMeterIndex);
@override
void initState() { 
  super.initState();
  context.read<ReportController>().getReportDetails(context ,
  widget.reportId
  );
}
  @override
  Widget build(BuildContext context) {
       var controller = Provider.of<ReportController>(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
             
        appBar: AppBar(
        elevation: 1,
        actions: const [

        //  Center(
        //    child: Padding(
        //      padding: const EdgeInsets.all(8.0),
        //      child: Text.rich(
        //        TextSpan(
        //          text: 'بواسطة: ' , style: TextStyle(
        //            color: Theme.of(context).primaryColor
                    
        //          ) , 
                    
        //          children: const [
        //              TextSpan(
        //          text: 'كرورو - مدير الفرع' , style: TextStyle(
        //           //  color: Theme.of(context).primaryColor
                    
        //          ) , 
        //              )
                    
        //          ]
        //        )
        //      ),
        //    ),
        //  )
        
        
        ],
        backgroundColor: Colors.white,
        titleSpacing: 0,
       
        title:  Text(
          locale!.locale.languageCode=="ar"?
"تقرير ${widget.reportId}":
      'Report ${widget.reportId}'
        )
      ),



      body:
      
      
      
       Builder(
         builder: (context) {


if (controller.reportDetails!.status==Status.LOADING) {
  return Center(
        child: mProgress(context ,fromPage: true),
  );
} 
else if( controller.reportDetails!.status==Status.ERROR){
return Center(
  child: 
  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Text(controller.reportDetails!.message!),
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
else 











            return 
            
            Column(
            children: [
15.height ,
Container(
  margin: const EdgeInsets.symmetric(
    horizontal: 10
  ),
  padding: const EdgeInsets.symmetric(
    horizontal: 10 , vertical: 20
  ),
  height: MediaQuery.of(context).size.height*.20,
  width:  MediaQuery.of(context).size.width,
  decoration:  BoxDecoration(
    color: Colors.white , 
borderRadius: BorderRadius.circular(10),

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
  child:  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
 Text(
   locale.locale.languageCode=="ar"?
   
  
  
  'معلومات التقرير:  ':"Report Information : ") ,
15.height , 
Expanded(child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

Row(mainAxisSize: MainAxisSize.min,
  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
SizedBox(
  width: 100,
  child:   Text(
  
     locale.locale.languageCode=="ar"?
     "تاريخ التقرير: ":"Report Date: "
  ),
) ,

8.width,
Text(getMaintenanceFormattedDate(
  controller.reportDetails!.data!.createdAt!
))




  ],
)


,
10.height,

Row(
mainAxisSize: MainAxisSize.min,
  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
SizedBox(
  width: 100,
  child:   Text(
  
     locale.locale.languageCode=="ar"?
     "نوع التقرير: ":"Report Type: "
  ),
) ,
8.width,

Text(locale.locale.languageCode=="ar"?
  controller.reportDetails!.data!.reportType!.nameAr!

: 
  controller.reportDetails!.data!.reportType!.nameEn!
)




  ],
)


,
10.height,

Row(
  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  mainAxisSize: MainAxisSize.min,
  children: [
SizedBox(
  width: 100,
  child:   Text(
  
     locale.locale.languageCode=="ar"?
     " العلامة التجارية: ":"Brand : "
  ),
) ,
8.width,

Text(locale.locale.languageCode=="ar"?
  controller.reportDetails!.data!.brand!.nameAr!

: 
  controller.reportDetails!.data!.brand!.nameEn!
)




  ],
)










          ],
        )
// Wrap(
//   spacing: 8,
//   runSpacing: 10,
//   children: 
  
//   controller.reportDetails!.data..
//   [
    
// Container(
//   padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
//   decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
//     color: Colors.blue.shade100
//   ),
//   child: const Text("أسامة "),
// )
//  ,
//  Container(
//   padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
//   decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
//     color: Colors.blue.shade100
//   ),
//   child: const Text("السماني"),
// )
// ,
// Container(
//   padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
//   decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
//     color: Colors.blue.shade100
//   ),
//   child: const Text("أسامة "),
// )
//  ,
//  Container(
//   padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
//   decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
//     color: Colors.blue.shade100
//   ),
//   child: const Text("السماني"),
// )

//  ,

//  Container(
//   padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
//   decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
//     color: Colors.blue.shade100
//   ),
//   child: const Text("أسامة "),
// )
//  ,
//  Container(
//   padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
//   decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
//     color: Colors.blue.shade100
//   ),
//   child: const Text("السماني"),
// )
// ,
// Container(
//   padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
//   decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
//     color: Colors.blue.shade100
//   ),
//   child: const Text("أسامة "),
// )
//  ,
//  Container(
//   padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
//   decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
//     color: Colors.blue.shade100
//   ),
//   child: const Text("السماني"),
// )



//   ],
// )



)



    ],
  ),
)
 ,
20.height ,
Expanded(child: 

Container( width:  MediaQuery.of(context).size.width,
 margin: const EdgeInsets.symmetric(
    horizontal: 10
  ),padding: const EdgeInsets.symmetric(
    horizontal: 10 , vertical: 20
  ),
decoration:  BoxDecoration(
    color: Colors.white , 
borderRadius: BorderRadius.circular(10),

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
  child:
 Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
 Text(
  locale.locale.languageCode=="ar"?
  
  'المهام :  ':"Tasks: ") ,
15.height , 

Expanded(child: 

ListView(
  children:
  
   controller.reportDetails!.data!.tasks!.map((e) => 
    TaskWidget(
      index: 0,
      
      tasks: e,
       brand:controller.reportDetails!.data!.brand ,
      branch: 'القصيم',
      isAdmin: !sharedPrefs.isAdmin,
      onNotifiy: (){
            
      },
    ),
   
   ).toList()
  
  
  
  //  [






  //   TaskWidget(
  //     index: 0,
  //     branch: 'القصيم',
  //     isAdmin: !sharedPrefs.isAdmin,
  //     onNotifiy: (){
            
  //     },
  //   ),


    
  //   TaskWidget(   index: 1,
  //     branch: 'القصيم',
  //     onNotifiy: (){
            
  //     },
  //   )
  // ],
)

)
    ])
)

)

            ],
      );
         }
       ),
      
    
    
    
    );
  }
}