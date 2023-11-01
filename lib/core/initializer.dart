import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goodfoods/app/documents/controllers/document_controller.dart';
import 'package:goodfoods/app/help/controller/help_controller.dart';
import 'package:goodfoods/app/managment_orders/controllers/requests_controller.dart';
import 'package:goodfoods/app/notifications/controllers/notification_controller.dart';
import 'package:goodfoods/app/report/controllers/report_controller.dart';
import 'package:goodfoods/common/controllers/langauage_controller.dart';
import 'package:goodfoods/common/controllers/theme_provider.dart';
import 'package:goodfoods/core/controllers/admin_home_controller.dart';
import 'package:goodfoods/core/controllers/app_state.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/controllers/chat_controller.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/services/firebase_notifications.dart';
import 'package:goodfoods/main.dart';
import 'package:provider/provider.dart';

import '../di.dart' as di;
class AppInitializer extends StatefulWidget {

  final Widget? child;
  const AppInitializer({ Key? key, this.child }) : super(key: key);

  @override
  _AppInitializerState createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
 RemoteMessage? _message;

initMessage()async{
    await FirebaseService.initializeFirebase();
 _message = await FirebaseService.firebaseMessaging.getInitialMessage();
}

@override
void initState() {
  super.initState();
  
  // initalize firebase
  // Firebase.initializeApp();


  // initMessage();
   fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast!.init(context);
}
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
           ChangeNotifierProvider(create: (context) => di.sl<AuthController>()),

           ChangeNotifierProvider(create: (context) => di.sl<AdminHomeController>()),


           ChangeNotifierProvider(create: (context) => di.sl<ChatController>()),

ChangeNotifierProvider<LanguageProvier>(create: (_)=>LanguageProvier())

,

ChangeNotifierProvider<ThemeProvier>(create: (_)=>ThemeProvier()),

ChangeNotifierProvider<AppState>(create: (_)=>AppState()),
ChangeNotifierProvider<NotificationController>(create: (_)=>NotificationController()),

           ChangeNotifierProvider(create: (context) => di.sl<MaintenanceController>()),

           ChangeNotifierProvider(create: (context) => di.sl<ReportController>()),
           ChangeNotifierProvider(create: (context) => di.sl<DocumentController>()),
                      ChangeNotifierProvider(create: (context) => di.sl<RequestController>()),
                      ChangeNotifierProvider(create: (context) => di.sl<HelpController>()),


      ],
      child:
        widget.child!,
    
    );
  }
}