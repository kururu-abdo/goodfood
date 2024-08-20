
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goodfoods/common/controllers/langauage_controller.dart';
import 'package:goodfoods/core/initializer.dart';
import 'package:goodfoods/core/presentation/app_theme.dart';
import 'package:goodfoods/core/presentation/splash_screen.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/services/document_service.dart';
import 'package:goodfoods/core/services/notification.dart';
import 'package:goodfoods/core/services/notification_plugin.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:open_document/my_files/init.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'di.dart' as di;
bool trueValue= true;
bool falseValue= false;
FToast? fToast;
typedef   YES=bool;
typedef   NO=bool;

typedef OnClickEvent<T> = Function(T);



GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  sharedPrefs.isOpen= true;
  // handle action
  NotificationApi.onSelectNotification(notificationResponse);
}


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //  Firebase.initializeApp();
  //  NotificationApi.init();
print('Receivd ');
  
    NotificationApi.pushNotification(message);
    sharedPrefs.isOpen= false;
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

//  bool? isLaucnByNotifion=false;



var  _notification = FlutterLocalNotificationsPlugin();

String? selectedNotificationPayload;
 main() async{
   WidgetsFlutterBinding.ensureInitialized();

     // NotificationApi.requestPermissions();
     LanguageProvier appLanguage = LanguageProvier();
  await appLanguage.fetchLocale();
 try {
    await sharedPrefs.init();
  await di.init();
DocumentService().initCheckPermission();
     Firebase.initializeApp();
    
    NotificationApi.init();
      

      NotificationApi.requestPermissions();

  
 
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb && Platform.isLinux
  //     ? null
  //     : await notification.getNotificationAppLaunchDetails();

//  String initialRoute = Nor.routeName;
  // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //   selectedNotificationPayload = notificationAppLaunchDetails!.notificationResponse?.payload;
  //   isLaucnByNotifion = true;
  // }


 } catch (e) {
 }


 timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());
 timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setLocaleMessages('en_short', timeago.EnShortMessages());





 





  runApp( RootRestorationScope(
      restorationId: 'root', // <-- and give the resorationId
    
    child: AppInitializer(child: MyApp(  appLanguage: appLanguage,
    // isLauchByNotificaiton: isLaucnByNotifion,
    ))));
}
Future backgroundHandler(RemoteMessage msg) async {
  NotificationApi.pushNotification(msg);
}
class MyApp extends StatelessWidget { 
  final LanguageProvier? appLanguage;
  // final bool? isLauchByNotificaiton;

  const MyApp({super.key, this.appLanguage ,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageProvier>(
      create: (_)=>appLanguage!,
      builder: (_ ,child) =>
      //  appLanguage,
      // child:
      
       Consumer<LanguageProvier>(
        builder: (context , locale , child) {
           
          return MaterialApp(
             restorationScopeId: 'app',
            title: 'Flutter Demo',
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
              supportedLocales: locale.langs.map((e) => Locale(e.languageCode!)).toList(),
               localizationsDelegates: const [
              // CountryLocalizations.delegate,
                 AppLocalizations.delegate,
            
                GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            
              GlobalWidgetsLocalizations.delegate,
            ],
            //  localeResolutionCallback: (locale, supportedLocales) => 
            //  const Locale("ar"),
            // localeResolutionCallback: ,
                locale: 
                locale.appLocal
                //  Locale(locale.languageKey!)
                 ,
            theme: 
     getAppTheme(context,
      // ref.watch(appThemeProvider)
      false
      ),
           
           
           
            home:  SplashScreen(
            // isLauchByNotificationPlugin:   isLauchByNotificaiton,
            )
          );
        }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
