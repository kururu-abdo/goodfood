import 'dart:convert';

import 'package:goodfoods/app/notifications/models/notificaiton_model.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';

class NotificationsApis {
      final ApiBaseHelper _helper = ApiBaseHelper();

  


Future<dynamic> updateToken(
   String token
  
   ) async {
     //
    final response = await _helper.post(
      
      "update_fcm_token" ,
     jsonEncode({
    
	"fcm_token":token

     })
   
    
    );
   

   
    return response;
  }




Future<dynamic> readAllNotifications(
  
   ) async {
     //
    final response = await _helper.post(
      
      "notifications/read_all_notifications" ,
      jsonEncode({})
    
    );
   

   
    return response;
  }


Future<dynamic> readNotification(
   String notificationId
  
   ) async {
     //
    final response = await _helper.post(
      
      "notifications/read_notification/$notificationId" ,
    
     jsonEncode({})
    );
   

   
    return response;
  }




Future<List<NotificationModel>> getUnreadNotifications(
  
   ) async {
     //
    final response = await _helper.get(
      
      "notifications/get_unreaded_notifications" ,
    
    
    );
   List<NotificationModel> notifications=[];
   Iterable I =response['data'];
notifications = I.map((e) => NotificationModel.fromJson(e)).toList();

   
    return notifications;
  }

Future<int> getNotificationCount(
  
   ) async {
     //
    final response = await _helper.get(
      
      "notifications/notifications_count" ,
    
    
    );
   int count  =response['data'];

   
    return count;
  }






}