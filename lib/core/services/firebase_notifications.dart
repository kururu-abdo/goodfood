import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:goodfoods/core/services/fcm_provider.dart';
import 'package:goodfoods/core/services/notification_plugin.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/main.dart';

class FirebaseService {
  static FirebaseMessaging? _firebaseMessaging;
  static FirebaseMessaging get firebaseMessaging => FirebaseService._firebaseMessaging ?? FirebaseMessaging.instance;
   static final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> initializeFirebase() async {

    try {
      await Firebase.initializeApp(
//       options: const FirebaseOptions(
//   apiKey: "AIzaSyAipa8LVCV4FgkcrNUNFAsCxYqPMcMkfpE",
//    appId: "1:67902231939:android:cc9c9af108559354c952b6",
//  messagingSenderId: "67902231939",
//   projectId: "goodfood-23597"
  
//   ),
    );
    FirebaseService._firebaseMessaging = FirebaseMessaging.instance;
    // await FirebaseService.initializeLocalNotifications();
   NotificationApi.init();
//  await _firebaseMessaging!.requestPermission(
//       announcement: true,
//       carPlay: true,
//       criticalAlert: true,
//     );


    await FCMProvider.onMessage();
    await FirebaseService.onBackgroundMsg();
    } catch (e) {
      
    }
    
  }

Future<String?> getDeviceToken() async => await FirebaseMessaging.instance.getToken();

  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  static Future<void> initializeLocalNotifications() async {
    const InitializationSettings initSettings = InitializationSettings(
      android: AndroidInitializationSettings("icon_name"),
      iOS: DarwinInitializationSettings()
    );
    /// on did receive notification response = for when app is opened via notification while in foreground on android
    await FirebaseService.localNotificationsPlugin.initialize(initSettings, onDidReceiveNotificationResponse: FCMProvider.onTapNotification);
    /// need this for ios foregournd notification
    await FirebaseService.firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
     await FirebaseService.firebaseMessaging.requestPermission();
  }
  
  static NotificationDetails platformChannelSpecifics = const NotificationDetails(
    android: AndroidNotificationDetails(
      "high_importance_channel", "High Importance Notifications", priority: Priority.max, importance: Importance.max,
    ),
  );
  
  // for receiving message when app is in background or foreground
  static Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (Platform.isAndroid) {
        // if this is available when Platform.isIOS, you'll receive the notification twice 
        // await FirebaseService._localNotificationsPlugin.show(
        //   0, message.notification!.title, message.notification!.body, FirebaseService.platformChannelSpecifics,
        //   payload: message.data.toString(),
        // );
        await SharedPrefs().init();
        sharedPrefs.notificationCount++;
        

NotificationApi.pushNotification(message);

      }
    });
  }

  static Future<void> onBackgroundMsg() async {
            await SharedPrefs().init();

    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  }



}