import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/app_state.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/utils/utils.dart';

class HelpController extends AppState {
  
ApiResponse<void> helpRequest = ApiResponse.completed({})
;

String? base64Image;
File? imageFile;
String? imagePath;


List<Map>  issueTypes =[


  {
"en":"Problem in app",
"ar":"مشكلة في التطبيق" ,
"value":0
  },
 {
"en":"Maintenance Order not completed",
"ar":"لم يكتمل الطلب" ,
"value":1

  },
 {
"en":"Problem with order response",
"ar":"مشكلة في الرد على الطلب" ,
"value":2

  },
   {
"en":"Problem with notifications",
"ar":"مشكلة في الاشعارات" ,
"value":3

  },


  {
"en":"Other",
"ar":"اخرى" ,
"value":4

  },
];
int? selectedOption =0;
setSelectedIssue(val){
  selectedOption=val;
  notifyListeners();
}
Map? getSelectedIssueObject(){
  if (selectedOption==null) {
    return null;
  }else {
   Map? value= issueTypes.firstWhere((e)=>  e['value']==selectedOption);
    

    return value;

  }
}


setImage(String data){
  imageFile= File(data);
  var base64Image= getBase64(data);
  imagePath =data;
  notifyListeners();

 
}
removeImage(){
  imageFile= null;
  base64Image= null;
  notifyListeners();
}

sendHelpRequest(BuildContext context )async{
helpRequest = ApiResponse.loading('loading');
notifyListeners();

  try {
    await Future.delayed(const Duration(seconds: 5));
helpRequest = ApiResponse.completed({});
showToast(currentLang(context)=="ar"?"تم ارسال الطلب":"Request Sent", false);
  } catch (e) {
    helpRequest = ApiResponse.error(e.toString());

  }
  finally{
    notifyListeners();
  }
}

}