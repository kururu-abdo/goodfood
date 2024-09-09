import 'dart:convert';
import 'dart:io';

import 'package:clear_all_notifications/clear_all_notifications.dart';
import 'package:eraser/eraser.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/admin/pages/home_new.dart';
import 'package:goodfoods/app/managment_orders/views/pages/order_reply.dart';
import 'package:goodfoods/core/presentation/login.dart';
import 'package:goodfoods/core/presentation/order_details.dart';
import 'package:goodfoods/core/services/document_service.dart';
import 'package:goodfoods/core/services/navigation_service.dart';
import 'package:goodfoods/core/utils/global.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:goodfoods/main.dart' as main;
import 'package:goodfoods/main.dart';
// import 'package:goodfoods/main.dart';
import 'package:nb_utils/nb_utils.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/subjects.dart';
final NavigationService navService = NavigationService();
  final notification = FlutterLocalNotificationsPlugin();

class NotificationApi{
    final BehaviorSubject<bool> behaviorSubject = BehaviorSubject();
  //code here

 static final notification = FlutterLocalNotificationsPlugin();
static bool isFlutterLocalNotificationsInitialized = false;

  static void init() async{

    if(isFlutterLocalNotificationsInitialized){
      return;
    }
     NotificationApi.createNorifiacationChannel();
    notification.initialize(
       const InitializationSettings(
        android: AndroidInitializationSettings('app_icon'),
        iOS: DarwinInitializationSettings(),



        
      ),




// We're receiving the payload as string that looks like this
 onDidReceiveNotificationResponse:
 
 (NotificationResponse response)async{
   log("CLIKED FOREGROUND");
   log(response.payload!.toString());
   selectNotification(response.payload!);
 }
 ,
      onDidReceiveBackgroundNotificationResponse:
      
      notificationTapBackground
//  (NotificationResponse response)async{
//     log("CLIKED BACKGROUND");
    
//    selectNotification(response.payload!);


//  }
 
 ,










    );
    askForNotificationPermission();
isFlutterLocalNotificationsInitialized=true;
// final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//     await notification.getNotificationAppLaunchDetails();

// if (notificationAppLaunchDetails!.notificationResponse!= null) {
//   onSelectNotification(notificationAppLaunchDetails.notificationResponse);
// }


  }
  
    static void askForNotificationPermission() {
    Permission.notification.request().then((permissionStatus) {
      if (permissionStatus != PermissionStatus.granted) {
        // AppSettings.openAppSettings(type: AppSettingsType.notification);
      }
    });
  }

static createNorifiacationChannel()async{
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  //for notificaiton initialization
  'Notification channel Id', // id
  'High Importance Notifications', // title
 description: 'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
);


 await notification
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

 if(Platform.isIOS){
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
 }
}



static pushNotification(
    RemoteMessage message,
  ) async {

log(message.data.toString());



 await         sharedPrefs.init();

          sharedPrefs.notificationCount++;

sharedPrefs.isOpen= false;


    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channed id',
      'channel name',
      channelDescription: 'channel description',
        icon: 'app_icon',

      importance: Importance.max,
      priority: Priority.high,
      playSound: true ,

      // actions: [


      //    AndroidNotificationAction('action_1', 'View', showsUserInterface: true),
      //       AndroidNotificationAction('action_2', 'Dismiss', showsUserInterface: true)
      // ]
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
    
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );



log("${message.data}2ND LINE");




    await notification.show(
        message.notification.hashCode,
        message.data['title'],
        message.data['body'],
        
        platformChannelSpecifics,
        payload: 
        jsonEncode({
          "screen": message.data['model'],
          "model_id": message.data['model_id']
        })
       
        );
  }



static  void notificationHandler() {
   
 FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  alert: true, // Required to display a heads up notification
  badge: true,
  sound: true,
);


    // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((event) async {
       await         sharedPrefs.init();

     sharedPrefs.isOpen= false;
     sharedPrefs.notificationCount++;
      await NotificationApi.pushNotification(event);
    });


    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //     NotificationApi.pushNotification(event);


    // });
// onBackgroundMsg();
  }


static Future<String?> getToken()async{
  return await FirebaseMessaging.instance.getToken();
}



 static Future<void> onBackgroundMsg() async {
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  }
static void requestPermission()async{
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

}




static Future<RemoteMessage> getInitialMessage()async{
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();

  if (message != null) {
      // _handleMessage(initialMessage);
    }

return message!;
}

void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
     

    }
  }
 static Map convertPayload(String payload){
    final String payload0 = payload.substring(1, payload.length - 1);
    List<String> split = [];
    payload0.split(",").forEach((String s) => split.addAll(s.split(":")));
    Map mapped = {};
    for (int i = 0; i < split.length + 1; i++) {
      if (i % 2 == 1) mapped.addAll({split[i-1].trim().toString(): split[i].trim()});
    }
    return mapped;
  }


static selectNotification(String payload) async {
  
   final Map data = jsonDecode(payload);
    var model =data['screen'].toString().toLowerCase();
    var id=data['model_id'].toString().toLowerCase();
 if (sharedPrefs.isLoggedIn) {
   

 if (model.contains("order")) {
   // go to order
  Navigator.of(main.navigatorKey.currentContext!).push(
    MaterialPageRoute(builder: (_)=> OrderDetails(
      orderId: id,
      isMaintain: sharedPrefs.isMaintain ,
      isFromNotificaiton: true,
    ))
  );
 }

 if (model.contains("chat") ||  model.contains("message")) {
   // go to order
   Navigator.of(main.navigatorKey.currentContext!).push(
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
const HomeNew().launch(main.navigatorKey.currentContext!);

  }).catchError((e){
const HomeNew().launch(main.navigatorKey.currentContext!);


  })


;

getNotificationCount();

//  Navigator.of(main.navigatorKey.currentContext!).push(
//     MaterialPageRoute(builder: (_)=> OpenDocumentPage(
//       docID: id,
//       // isAdmin: !sharedPrefs.isAdmin ,
//       fromNotitications: true,
//     ))
//   );
 }

if (model.contains("request") ) {
   // go to doc
  
    
 Navigator.of(main.navigatorKey.currentContext!).push(
    MaterialPageRoute(builder: (_)=> OrderReply(
      orderId: id,
      // isAdmin: !sharedPrefs.isAdmin ,
      fromNotifications: true,
    ))
  );
 
 }
 ClearAllNotifications.clear();
NotificationApi.clear();





 }else {
    ClearAllNotifications.clear();
NotificationApi.clear();
    Navigator.pushAndRemoveUntil(

          main.navigatorKey.currentContext!, MaterialPageRoute(builder: (_)=>const LoginScreen()) ,
          (route)=>false
         );
 }
sharedPrefs.isOpen= true;

}




static onSelectNotification(NotificationResponse? notificationResponse) async {
log("CLCIKED");
 selectNotification(notificationResponse!.payload!);
  
 


}





static Future<void> requestPermissions() async {
    // await Permission.notification.request();
    var status = await Permission.notification.request();
    if (status.isPermanentlyDenied) {
  // The user opted to never again see the permission request dialog for this
  // app. The only way to change the permission's status now is to let the
  // user manually enable it in the system settings.
  openAppSettings();
}
if (status.isDenied || !status.isGranted) {
  if (Platform.isIOS || Platform.isMacOS) {
      await notification
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await notification
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          notification.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
          await androidImplementation!.requestNotificationsPermission();
     
     
    }
}


    
    
  }
static  Future initMessage()async{
   NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
          Platform.isLinux
      ? null
      : await notification.getNotificationAppLaunchDetails();
if (!sharedPrefs.isOpen) {
   if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    NotificationApi.onSelectNotification(notificationAppLaunchDetails!.notificationResponse);
    // notification.cancelAll();
    notificationAppLaunchDetails =null;
      // Eraser.clearAllAppNotifications();
      getNotificationCount();

        ClearAllNotifications.clear();
      sharedPrefs.isOpen= true;
  }
}
 

}


static Future<void> clear()async{
   try {
     
   } catch (e) {
      FirebaseMessaging.instance.deleteToken();
      // FirebaseMessaging.instance.ca();
// notification.cancelAll();
    ClearAllNotifications.clear();
      Eraser.clearAllAppNotifications();
   }

}
}