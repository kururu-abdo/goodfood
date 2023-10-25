import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:goodfoods/core/presentation/dialogs/dynamic_dilog.dart';

class LocalNotificationService {
   // Instance of Flutternotification plugin
   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();


      static void initialize() {
    // Initialization  setting for android
    const InitializationSettings initializationSettingsAndroid =
        InitializationSettings(
          iOS: DarwinInitializationSettings(
            requestBadgePermission: true ,
            requestSoundPermission: true ,
            
          ),
            android: AndroidInitializationSettings("@drawable/ic_launcher"));
    _notificationsPlugin.initialize(
      initializationSettingsAndroid,
      // to handle event when we receive notification
      onDidReceiveNotificationResponse: (details) {
           _notificationsPlugin.cancelAll();
        if (details.input != null) {}
      },
      onDidReceiveBackgroundNotificationResponse: (details) {
        
            _notificationsPlugin.cancelAll();
          if (details.input != null) {

          }
      },
    );
  }

  static Future<void> display(RemoteMessage message) async {
    // To display the notification in device
    try {
      print(message.notification!.android!.sound);
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
        iOS: const DarwinNotificationDetails(
          
        ),
        android: AndroidNotificationDetails(

            message.notification!.android!.sound ?? "Channel Id",
            message.notification!.android!.sound ?? "Main Channel",

            groupKey: "gfg",
            icon: '@mipmap/ic_launcher',
            color: Colors.green,
            importance: Importance.max,
            sound: RawResourceAndroidNotificationSound(
                message.notification!.android!.sound ?? "gfg"),
           
            // different sound for
            // different notification
            playSound: true,
            priority: Priority.high),
      );
      await _notificationsPlugin.show(id, message.notification?.title,
          message.notification?.body, notificationDetails,
          payload: message.data['route']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  void messageListener(BuildContext context) {
    // Either you can pass buildcontext or you
      // can take a context from navigator key
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message in the foreground!');
      print('Message data: ${message.data}');
 
      if (message.notification != null) {
        print(
            'Message also contained a notification:  so it will pop up ${message.notification!.body}');
        showDialog(
            context: context,
            // context: navigatorKey!.currentContext!,
            builder: ((BuildContext context) {
              return DynamicDialog(
                  title: message.notification!.title,
                  body: message.notification!.body);
            }));
      }
    });
  }
}