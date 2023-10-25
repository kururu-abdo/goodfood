import 'dart:convert';

import 'package:goodfoods/core/data/models/chat_selection_model.dart';
import 'package:goodfoods/core/data/models/message_model.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';

class ChatApis {
    final ApiBaseHelper _helper = ApiBaseHelper();


  Future<MessageModel> sendMessage(
     String uid , String? msg ,String? image
   ) async {
    final response = await _helper.post("msg/send_msg" ,
  
  image!=null?
   jsonEncode(
      {
      "reciver_id":uid.toString(),
      "msg":msg.toString() ,
      
    
      "uploaded_file":
      
      image

    }
   )
    :  jsonEncode({
      "reciver_id":uid.toString(),
      "msg":msg.toString() 
    })
    );
    return MessageModel.fromJson(response);
  }







  Future<MessageModel> fetchMessages(
     String uid ,
     [
       String? limit='10'
     ]
   ) async {
     //
    final response = await _helper.get("msg/get_admin_msg?admin_id=$uid&limit=$limit" ,
   
    
    );
    return MessageModel.fromJson(response);
  }





  Future<MessageModel> deleteMessage(
     String id , String? receiver) async {
    final response = await _helper.post("msg/delete_msg/$id" ,
  
 
    {
      "resiver_id" : receiver,
      

    }
   
    );
    return MessageModel.fromJson(response);
  }




  Future<MessageModel> editeMessage( 
    
    String id,
    String receiver , String? msg ,String? image
   ) async {
    final response = await _helper.post("msg/edit_msg/$id" ,
  
  image!=null?
   jsonEncode( {
      "resiver_id":receiver.toString(),
      "msg":msg.toString() ,
      
    
      "uploaded_file":
      
      image

    })
    :  

    jsonEncode({
      "resiver_id":receiver.toString(),
      "msg":msg.toString() 
    })
    );
    return MessageModel.fromJson(response);
  }






  Future<Emp> fetchChatUser( 
    
    String id,
   ) async {
    final response = await _helper.get("show_user/$id" ,
  
 
    );
    return Emp.fromJson(response['data']);
  }





}