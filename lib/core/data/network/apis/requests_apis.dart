import 'dart:convert';
import 'dart:developer';

import 'package:goodfoods/app/managment_orders/models/management_order.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';

class RequestApis {
  
      final ApiBaseHelper _helper = ApiBaseHelper();

   Future<List<ManagementOrderModel>> getRequests(
   ) async {

     List<ManagementOrderModel> requests=[];
    final response = await _helper.get("request/get_requests" ,
    
    
    );
Iterable I =response['data'];
requests = I.map((e) => ManagementOrderModel.fromJson(e)).toList();





    return requests;
  }




   Future<ManagementOrderModel> fetchRequest(
     String? id
   ) async {

    //  List<ManagementOrderModel> requests=[];
    final response = await _helper.get("request/get_requests" ,
    
    
    );
// Iterable I =response['data'];
// requests = I.map((e) => ManagementOrderModel.fromJson(e)).toList();





    return  ManagementOrderModel.fromJson(response['data'].first);
  }



Future<dynamic> addReuestReply(
    String? order  ,
    String reply,
  String? image,
String extension
   ) async {
     //
     log(
       
       jsonEncode({
    
	"replay":reply ,
  "file" :image ,
"extention" : extension

     })
     );
    final response = await _helper.post(
      
      "request/add_replay/$order" ,
     jsonEncode({
    
	"replay":reply ,
  "file" :image ,
"extention" : extension

     })
   
    
    );
   

  //  ManagementOrderModel.fromJson(response['data'])
    return  response;
  }



}