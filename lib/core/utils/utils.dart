import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodfoods/core/presentation/splash_screen.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path/path.dart' as path;
import 'package:timeago/timeago.dart' as timeago;
String getBase64(String imagePath ){
  File file = File(imagePath);
Uint8List bytes = file.readAsBytesSync();
String base64Image = base64Encode(bytes);
return base64Image;
}
String getFileExtenstion(String filePath){
  final extension = path.extension(filePath, 2);

  return extension;
}
String getFileName(String filePath){
  final name = path.basename(filePath);

  return name;
}

  String? getStatusName(
    BuildContext context ,
    int status){
          var locale= AppLocalizations.of(context);

    switch (status){

case 0:
return locale!.locale.languageCode=="ar"?
"تم الانشاء":"Created";
case 1:
return locale!.locale.languageCode=="ar"?
"قيد الاغلاق":"Closing";

case 2:
return locale!.locale.languageCode=="ar"?
"تم الاغلاق":"Closed";



    }
    return null;
  }
  
String getMaintenanceFormattedDate(String date, [String locale="en_US"]){
  DateTime now = DateTime.parse(date);
var formattedDate = DateFormat('EEEE, MMM d, yyyy HH:mm:ss',
locale

)
.format(now ,);

return formattedDate;
}


  
  Color getOrderColor(status){
    switch (status) {
      case 0:
        return Colors.orange;
        
        case 1:
        return Colors.green;
       
      default:
       return Colors.red;
    }
  }








showToast(String message, bool isError) {


//   toast(
// message ,
// bgColor:  isError?Colors.red:
      
//        Colors.green,

//        textColor: Colors.black
//   );
    Fluttertoast.showToast(
    
     msg: message,
      // child: toast(message,isError),
      backgroundColor:  isError?Colors.red:
      
       Colors.green,

       textColor: Colors.black,
      gravity: ToastGravity.BOTTOM,
      // toastDuration: const Duration(seconds: 2),
    );
  }
 Widget toasty(String message, bool isError) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color:
      isError?Colors.redAccent:
      
       Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
           isError?
           Icons.report:
          Icons.check,
          color: Colors.white,
          
          ),
        const SizedBox(
          width: 12.0,
        ),
        Text(message),
      ],
    ),
  );





  logout(BuildContext context){
  sharedPrefs.clear();

const SplashScreen().launch(context);
}


String getTimeAgo(String d , {String locale="ar"}){
  DateTime date =DateTime.parse(d);
  final fifteenAgo = DateTime.now().subtract(  (DateTime.now().difference(date))  );

    print(timeago.format(fifteenAgo)); // 15 minutes ago
    print(timeago.format(fifteenAgo, locale:locale=="en"? 'en_short':"ar_short")); // 15m
    print(timeago.format(fifteenAgo, locale: 'es')); // hac

    return timeago.format(fifteenAgo, locale:locale=="en"? 'en_short':"ar_short");
}

translate(
  BuildContext? context,
  String key){
    var appLocale =  AppLocalizations.of(
      context??
      navigatorKey.currentContext!);



return appLocale!.translate(key);

}

currentLang(
  BuildContext? context,
  ){
    var appLocale =  AppLocalizations.of(
      context??
      navigatorKey.currentContext!);



return appLocale!.locale.languageCode;

}
