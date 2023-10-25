import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goodfoods/core/data/models/chat_selection_model.dart';
import 'package:goodfoods/core/data/models/message_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/chat_apis.dart';
import 'package:goodfoods/core/data/network/apis/common_apis.dart';

class ChatController extends ChangeNotifier {
Emp?  chatUser ;

int limit = 20;


MessageModel? messageModel;

  bool isLaoding=false;
  bool isError=false;
  String error = '';
// ChatSelectionModel? chatSelectionModel;
ApiResponse<ChatSelectionModel>?  chatSelectionModel = ApiResponse.completed(null);








updateLimit(){
  limit+=10;
  notifyListeners();
}




selectChatUser(Emp emp)async{
  chatUser = emp;

  

 isLaoding = true;
isError=false;
messageModel=null;
notifyListeners();
try {
  var response= await  ChatApis().fetchMessages(emp.id.toString(),
  
  
  );
messageModel= response;
messageModel!.data!.sort((a, b) => a.id!.compareTo(b.id!));
for (var data in messageModel!.data!) {
  log(data.msg.toString());
}

}finally{
   isLaoding = false;
   notifyListeners();
}



}







///msg/get_admin_msg?admin_id=1
///https://goodfoodsa.co/api/msg/send_msg
///
///




getMessages()async{

  

//  isLaoding = true;
isError=false;
// messageModel=null;
notifyListeners();
try {
 updateLimit();
  var response= await  ChatApis().fetchMessages(
    chatUser!.id.toString()
    ,
 limit.toString());
messageModel= response;
messageModel!.data!.sort((a, b) => a.id!.compareTo(b.id!));
for (var data in messageModel!.data!) {
  log(data.msg.toString());
}

}finally{
   isLaoding = false;
   notifyListeners();
}



}





Future

getChatSelectionModel()async{
 isLaoding = true;
isError=false;
chatSelectionModel=ApiResponse.loading('Fetching Popular Movies');
notifyListeners();
  try {
    var response =await CommmomApis().getMessageSelection();
log(response.regions!.length.toString());
 chatSelectionModel=ApiResponse.completed(response);


  } catch (e) {
            chatSelectionModel=ApiResponse.error(e.toString());

    isError= true;

    error =e.toString();
  }finally{
    isLaoding= false;
    notifyListeners();
  }
}



getBase64(String imagePath ){
  File file = File(imagePath);
Uint8List bytes = file.readAsBytesSync();
String base64Image = base64Encode(bytes);
return base64Image;
}


Future sendMessage(

Emp? emp ,String? msg, String? base64

)async{
try {
  log(emp!.id.toString());
  log(msg!);


  var response = await  ChatApis().sendMessage(emp.id.toString(), msg, base64);
  messageModel = null;
  
  messageModel = response;
 messageModel!.data!.sort((a, b) => a.id!.compareTo(b.id!));
  log("DONE");
}finally{
notifyListeners();
}
}






    bool getDateDiff(String? date) {
            var  today =  DateTime.now();  //  not time

            var messageTime = DateTime.parse(date!);
  var diff = today.difference(messageTime);

          return diff.inMinutes<1;

        }

       



Future deleteMessage(
String? reciver,
String? messageId

)async{
try {



  var response = await  ChatApis().deleteMessage(messageId!, reciver!);
  messageModel = null;
  
  messageModel = response;
 messageModel!.data!.sort((a, b) => a.id!.compareTo(b.id!));
  log("DONE");
}finally{
notifyListeners();
}
}






Future editMessage(
String?  receiver,String? messageId,
String? msg, String? base64

)async{
try {
  log(msg!);


  var response = await  ChatApis().editeMessage(messageId!, receiver!, msg, base64);
  messageModel = null;
  
  messageModel = response;
 messageModel!.data!.sort((a, b) => a.id!.compareTo(b.id!));
  log("DONE");
}finally{
notifyListeners();
}
}

Future  loadChatUser(String id)async{
  isLaoding = true;
isError=false;
chatUser=null;
// chatSelectionModel=ApiResponse.loading('Fetching Popular Movies');
notifyListeners();
  try {
    var response =await ChatApis().fetchChatUser(id);


selectChatUser(response);
//  chatSelectionModel=ApiResponse.completed(response);


  } catch (e) {
            // chatSelectionModel=ApiResponse.error(e.toString());

    isError= true;

    error =e.toString();
  }finally{
    isLaoding= false;
    notifyListeners();
  }
}
}