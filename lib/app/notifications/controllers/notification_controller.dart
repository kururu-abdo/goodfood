import 'package:flutter/material.dart';
import 'package:goodfoods/app/notifications/models/notificaiton_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/notifications_apis.dart';

class NotificationController extends ChangeNotifier {
  

ApiResponse<List<NotificationModel>>?  notifications = ApiResponse.completed([]);


ApiResponse<void>?  readNotifications = ApiResponse.completed({});




  Future<void> getNotifications()async{

notifications=ApiResponse.loading('Fetching Popular Movies');
notifyListeners();
try {

 var response =await NotificationsApis().getUnreadNotifications();

 notifications=ApiResponse.completed(response);

  
  
} catch (e) {

       notifications=ApiResponse.error(e.toString());

 
} finally{
  notifyListeners();
}

  }





  Future<void> refresh()async{

notifications=ApiResponse.loading('Fetching Popular Movies');

try {

 var response =await NotificationsApis().getUnreadNotifications();

 notifications=ApiResponse.completed(response);

  
  
} catch (e) {

       notifications=ApiResponse.error(e.toString());

 
} finally{

}

  }




 Future<void>  makeAllNotificationsRead()async{
   try {
     NotificationsApis().readAllNotifications().then((value) {

       refresh();
     }
     
     
     );
   }finally{

   }
 }




 Future<void>  readNotificaiton(String id)async{
   try {
     NotificationsApis().readNotification(id).then((value) {

       refresh();
     }
     
     
     );
   }finally{

   }
 }


}