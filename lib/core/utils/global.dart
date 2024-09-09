
  import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
      final ApiBaseHelper _helper = ApiBaseHelper();

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
case 3:
return locale!.locale.languageCode=="ar"?
"تحت المعالجة":"Processing";

case 4:
return locale!.locale.languageCode=="ar"?
"مرفوض":"Rejected";


    }
   return locale!.locale.languageCode=="ar"?
"تم الانشاء":"Created";
  }
  
  Color getOrderColor(status){
    switch (status) {
      case 0:
        return Colors.blue;
        
        case 1:
        return Colors.grey;
        case 2:
        return Colors.green;
         case 3:
        return Colors.orange;
         case 4:
        return Colors.red;
      default:
       return Colors.green;
    }
  }

Future<int> getNotificationCount(
  
   ) async {
     //
    final response = await _helper.get(
      
      "notifications/notifications_count" ,
    
    
    );
   int count  =response['data'];
await SharedPrefs().init();
sharedPrefs.notificationCount= count;
   
    return count;
  }
