import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:goodfoods/core/data/models/branch_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/common_apis.dart';
import 'package:goodfoods/core/data/network/apis/notifications_apis.dart';
import 'package:goodfoods/core/services/notification_plugin.dart';

class AdminHomeController

extends ChangeNotifier
 {
  


  bool isLaoding=false;
  bool isError=false;
  String error = '';

ApiResponse<List<BranchModel>>?  branches = ApiResponse.completed([]);
getBranches(BuildContext context)async{
isLaoding = true;
isError=false;
branches=ApiResponse.loading('Fetching Popular Movies');
notifyListeners();
  try {
    var response =await CommmomApis().getBranches();

 branches=ApiResponse.completed(response);


  } catch (e) {
            branches=ApiResponse.error(e.toString());

    isError= true;

    error =e.toString();
  }finally{
    isLaoding= false;
    notifyListeners();
  }
}





updateToken()async{
 try {
   var token =await NotificationApi.getToken();
    var response =await NotificationsApis().updateToken(
      token!
    );


            log("UPDATE TOKEN=========> $response");

  } catch (e) {
            log("UPDATE TOKEN $e");
  }finally{
  
  }
}









}