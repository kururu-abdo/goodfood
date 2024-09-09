import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart' show FirebaseMessaging, RemoteMessage;
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:goodfoods/core/services/firebase_notifications.dart';
import 'package:goodfoods/core/utils/global.dart';



class FCMProvider with ChangeNotifier {
  static BuildContext? _context;

  static void setContext(BuildContext context) => FCMProvider._context = context;

  /// when app is in the foreground
  static Future<void> onTapNotification(NotificationResponse? response) async {
    if (FCMProvider._context == null || response?.payload == null) return;
    final Map _data = FCMProvider.convertPayload(response!.payload!);
    if (_data.containsKey("")){
      // await Navigator.of(FCMProvider._context!).push();
    }
  }

  static Map convertPayload(String payload){
    final String _payload = payload.substring(1, payload.length - 1);
    List<String> _split = [];
    _payload.split(",")..forEach((String s) => _split.addAll(s.split(":")));
    Map _mapped = {};
    for (int i = 0; i < _split.length + 1; i++) {
      if (i % 2 == 1) _mapped.addAll({_split[i-1].trim().toString(): _split[i].trim()});
    }
    return _mapped;
  }
  
  static Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    log(message.data.toString());

    log(message.toString());


      // if (FCMProvider._refreshNotifications != null) await FCMProvider._refreshNotifications!(true);
      // if this is available when Platform.isIOS, you'll receive the notification twice 
      if (Platform.isAndroid) {
        await FirebaseService.localNotificationsPlugin.show(
          0, message.notification!.title,
          message.notification!.body,
          FirebaseService.platformChannelSpecifics,
          payload: message.data.toString(),
        );
        getNotificationCount();
      }
    });
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {

  }
}