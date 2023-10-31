import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/admin_dashboard.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/managment_orders/views/pages/order_reply.dart';
import 'package:goodfoods/app/notifications/controllers/notification_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/order_details.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/notification_widget.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/services/document_service.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  final bool? fromDashboard;
  const NotificationPage({ Key? key, this.fromDashboard = false }) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {






@override
void initState() { 
  super.initState();

   WidgetsBinding.instance.addPostFrameCallback((_) {
  context.read<NotificationController>().getNotifications();

   });
}






  @override
  Widget build(BuildContext context) {
var provider = Provider.of<NotificationController>(context);

var locale = AppLocalizations.of(context);


    return Scaffold(
        backgroundColor: Colors.white,
       appBar: 
        
        AppBar(
          elevation: 1,

          actions: [

            Builder(
              builder: (context) {
                return 
                 provider.notifications!.status == Status.LOADING?


 const SizedBox.shrink():

                Visibility(
                  visible: 
                  
                  provider.notifications!.data!.isNotEmpty
                  ,
                  child: TextButton(onPressed: ()async{
               await  provider.makeAllNotificationsRead();
                  }, child:  Text(
                    locale!.locale.languageCode=="ar"?
"تحديد الكل كمقروء":
                    
                    "Mark all as read"))
                  
                  
                  ,
                )
               
                ;
              }
            )




          ],
    //       actions: [
    //         IconButton(onPressed: (){
    // const ChagePage().launch(context);
    //         }, icon: const ImageIcon(AssetImage('assets/icons/headset.png')))
    //       ,
    //         // IconButton(onPressed: (){
    
    //         // }, icon: const ImageIcon(AssetImage('assets/icons/bell.png')))
          
          
          
    //       ],
          backgroundColor: Colors.white,
          titleSpacing: 0,
          
          leading: widget.fromDashboard!?const SizedBox(): 
    
    
          IconButton(onPressed: (){
    Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          title:
           Text(

               locale!.locale.languageCode=="ar"?
            'الاشعارات':"Notifications"
          )
          
          //  Image.asset('assets/images/logo.png' 
          //  ,
          // width: 150,
          
          // )
          
          
          
          ,
        ),
     
     
       body: RefreshIndicator(
         onRefresh: ()async{
 provider.getNotifications();

         },
         child: Stack(
           alignment: Alignment.center,
           children: [
       
       
       
       
             Builder(
               builder: (context) {
       
       
       if (provider.notifications!.status==Status.LOADING) {
         return Center(
          child: mProgress(context ,fromPage: true),
         );
       } 
       else if( provider.notifications!.status==Status.ERROR){
       return Center(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       Text(provider.notifications!.message!),
       const SizedBox(height: 10,) ,
       IconButton(onPressed: (){
         provider.getNotifications();
       }, icon:  Icon(
         Icons.refresh ,color: Theme.of(context).primaryColor,
       ))
          ],
         ),
       );
       }
       
            else     
            
           {
       
       
         return 
         
         
         
         provider.notifications!.data!.isEmpty?
           
         Center(child: NoContent(
       
          locale.locale.languageCode=="ar"?
          "لا توجد اشعارات":
         'no notifications' ,
       
         icon:'assets/icons/silent.png'
       ),):
         
         
         
         
         
         ListView.builder(
         itemCount: provider.notifications!.data!.length,
         itemBuilder: (BuildContext context, int index) {
          var notification = provider.notifications!.data![index];
       
       
       return  NotificationWidget(
       mainTitle: notification.title,
       description: notification.description,
       duration:  getTimeAgo(notification.createdAt!),
       isRead: notification.readed==1,
       
       
                     ).onTap(()async{



await
provider.readNotificaiton(notification.id!.toString());
log(notification.model!.toString());
log(notification.modelId!.toString());
routeToScreen(notification.model!.toString(), notification.modelId!.toString());
                     });
       
             });
           }
            
            
            
            
            
            
            
            
            
       //            return ListView(
       //                  children: const [
       //                    NotificationWidget(
       // mainTitle: 'MAINTENANCE',
       // description: 'there new maintenance orer see it',
       // duration: '1 day',
       
       
       
       //                    ),
       // NotificationWidget(
       // mainTitle: 'ORDER',
       // description: 'there new maintenance orer see it',
       // duration: '1 day',
       
       // isRead: true,
       
       //                    ),
       
       
       // NotificationWidget(
       // mainTitle: 'MAINTENANCE',
       // description: 'there new maintenance orer see it',
       // duration: '1 hours',
       
       
       
       //                    ),
       
       
       
       //                  ],
       //                );
            
            
            
            
               }
             ),
            
            
       
       
            
            // mLightBottomNav(context)
           ],
         ),
       ),
    );
  }

routeToScreen(String modelName , String modelId){
 
    var model =modelName.toLowerCase();
    var id=modelId;
 
log("$modelName\n$modelId");
 if (model.contains("order")) {
   // go to order
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_)=> OrderDetails(
      orderId: id,
      isAdmin: !sharedPrefs.isAdmin ,
      isFromNotificaiton: true,
    ))
  );
 }

 if (model.contains("chat") ||  model.contains("message")) {
   // go to order
   Navigator.of(context).push(
    MaterialPageRoute(builder: (_)=> ChagePage(
      userId: id,
      // isAdmin: !sharedPrefs.isAdmin ,
      fromNotificatios: true,
    ))
  );
 }

if (model.contains("doc") ) {
   // go to doc
  getDocument(id).then((value) {

    if (value!.files!.isNotEmpty) {
      DocumentService().initPlatformState(value.files!.first);

    }

  }).onError((error, stackTrace) {
const Dashboard().launch(context);

  }).catchError((e){
const Dashboard().launch(context);


  });
//  Navigator.of(context).push(
//     MaterialPageRoute(builder: (_)=> OpenDocumentPage(
//       docID: id,
//       // isAdmin: !sharedPrefs.isAdmin ,
//       fromNotitications: true,
//     ))
//   );
 }

if (model.contains("request") ) {
   // go to doc
  
    
 Navigator.of(context).push(
    MaterialPageRoute(builder: (_)=> OrderReply(
      orderId: id,
      // isAdmin: !sharedPrefs.isAdmin ,
      fromNotifications: true,
    ))
  );
 
 }
}

}