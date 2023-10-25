import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/managment_orders/models/management_order.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/requests_apis.dart';
import 'package:goodfoods/core/utils/utils.dart';

class RequestController extends ChangeNotifier {

ApiResponse<List<ManagementOrderModel>>?  orders = ApiResponse.completed([]);

ApiResponse<dynamic>?  addReply = ApiResponse.completed({});
ApiResponse<ManagementOrderModel>?  order = ApiResponse.completed(null);

Future<void> getMyRquests(BuildContext context)async{
   orders = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await RequestApis().getRequests();



    orders=ApiResponse.completed(response);
  } catch (e) {
       orders = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}



Future<void> getRequest(BuildContext context ,String? id)async{
   order = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await RequestApis().fetchRequest(id);



    order=ApiResponse.completed(response);
  } catch (e) {
       order = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}



Future<void> addReplyument(BuildContext context ,

String? id ,
String? replay
)async{
   addReply = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await RequestApis().addReuestReply(id , replay!);
    
addReply =  ApiResponse.completed(response);

notifyListeners();
 showToast('Successfully', false);

  } catch (e) {
    log(e.toString());
       addReply = ApiResponse.error('$e');
     showToast('$e', true);  
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}

  
}