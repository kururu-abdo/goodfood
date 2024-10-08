import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/home_dashboard.dart';
import 'package:goodfoods/app/admin/pages/home_new.dart';
import 'package:goodfoods/core/presentation/login.dart';
import 'package:goodfoods/core/services/goodfoods_remote_config.dart';
import 'package:goodfoods/core/services/notification_plugin.dart';
import 'package:goodfoods/core/services/package_info_service.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:url_launcher/url_launcher.dart';
class SplashScreen extends StatefulWidget {
final RemoteMessage? remoteMessage;

  const SplashScreen({Key? key, this.remoteMessage,}) : super(key: key);

  @override

  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller; // Define an animation controller

  @override
  void initState() {
    super.initState();
    _controller =  AnimationController( // Initialize the animation controller
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    
    _controller.forward().then((value)async { // Start the animation and when it's finished, pop the current screen
      //&& sharedPrefs.user_pos.isNotEmpty
     
     
     var remoteVersion = GoodfoodsFirebaseRemoteConfig().getString("version");
   var projectVersion = await GoodfoodsPackageInfo().getCurrentVersion();
   dev.log("PACKAGE INFO FIREBASE  $remoteVersion  ");
if (remoteVersion.toString().toLowerCase() != projectVersion.toString().toLowerCase()) {

        _showUpdateVersionDialog(context, false);


}
    else { 
      if (sharedPrefs.isLoggedIn  ) {

   
           NotificationApi.initMessage();

        //  Navigator.pushAndRemoveUntil(

        //    context, MaterialPageRoute(builder: (_)=>const Dashboard()) ,
        //   (route)=>false
        //  );
 Navigator.pushAndRemoveUntil(

           context, MaterialPageRoute(builder: (_)=>const HomeDashboard()) ,
          (route)=>false
         );
         
      //    Navigator.of(context).push(
      //   MaterialPageRoute(builder: (_)=>const HomeNew())
      // );







      }
      // if (sharedPrefs.isLoggedIn) {
      //      Navigator.of(context).push(
      //   MaterialPageRoute(builder: (_)=>const MaintainanceDashboard())
      // );
      // }
      
      else {
      //    Navigator.of(context).push(
      //   MaterialPageRoute(builder: (_)=>const LoginScreen())

        
      // );

       Navigator.pushAndRemoveUntil(

           context, MaterialPageRoute(builder: (_)=>const LoginScreen()) ,
          (route)=>false
         );
      //    Navigator.of(context).push(
      //   MaterialPageRoute(builder: (_)=>const LoginScreen())
      // );
      }
      
     

    }


    });

  

// //initalize notifications
// // Initialise  localnotification
//     LocalNotificationService.initialize();
    


//      // To initialise the sg
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
      
//     });
     
//     // To initialise when app is not terminated
//     FirebaseMessaging.onMessage.listen((message) {
//       if (message.notification != null) {
//         LocalNotificationService.display(message);
//       }
//     });
     
//     // To handle when app is open in
//     // user divide and heshe is using it
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//      print("on message opened app");
//     });



     WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.remoteMessage != null) {
        Future.delayed(const Duration(milliseconds: 1000), () async {
          // await Navigator.of(context).pushNamed(...);
        });
      }
    });
  }


// Future isLogged(context) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String isAdmin = prefs.getBool('isAdmin');
//   if (uid == null) {
//     /// If it's the first time, there is no shared preference registered
//     Navigator.pushNamedAndRemoveUntil(...);
//   } else {
//     if (isAdmin) {
//       /// If the user is an admin
//       Navigator.pushNamedAndRemoveUntil(...);
//     } else {
//       /// If the user is not an admin
//       Navigator.pushNamedAndRemoveUntil(...);
//     }
//   }



// //create a method that handles notification 
//   void notificationHandler() {
//     FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//     FirebaseMessaging.onMessage.listen((event) async {
//       await NotificationApi.pushNotification(event);
//     });
//   }







  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller when the widget is removed from the tree
    super.dispose();
  }
  Future startAnimation() async {

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {  });

    await Future.delayed(const Duration(milliseconds: 5000));

 

  }

  @override

  Widget build(BuildContext context) {

   return Scaffold(
      body:

      Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedBuilder( // Use AnimatedBuilder to animate the rotation of the bird image
              animation: _controller,
              child: SizedBox(
                width: 120.0,
                height: 120.0,
                child: Image.asset('assets/images/logo.png'), // The bird image to animate
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 *  pi, // Rotate the image by the animation value
                  child: child,
                );
              },
            ),


            Container(height: 15),

            ShaderMask( // Use ShaderMask to add a gradient to the "Flutter UIX" text
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xFF0089CF), Color(0xFF00CDBA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Text("Good Foods", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),

          ])

      ),
    );
 
  }
Future<void> _showUpdateVersionDialog(BuildContext context, bool isSkippable) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("New version available"),
        content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text("Please update to the latest version of the app."),
          ],
        ),
      ),
      actions: <Widget>[
        // A "skip" button is only shown if it's a recommended upgrade
        isSkippable
          ? TextButton(
            child: const Text('Skip'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                  ),
              );
            },
          )
          : Container(),
        TextButton(
          child: const Text('Update'),
          onPressed: () {
            _launchAppOrPlayStore();
          },
        ),
      ],
      );
    },
  );
}

  void _launchAppOrPlayStore() {
  final appId = Platform.isAndroid ? 
  'https://play.google.com/store/apps/details?id=com.goodfoods.sa' : 'YOUR_IOS_APP_ID';

  final url = Uri.parse(
    appId
       ,
  );
  launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
}


}