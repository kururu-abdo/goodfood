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