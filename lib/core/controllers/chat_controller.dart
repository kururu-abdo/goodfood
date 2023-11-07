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
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
class ChatController extends ChangeNotifier {
Emp?  chatUser ;

//message
List<Message>? messages=[];

// List<Message>? messageList=[];
// //paginationLoad Completed;
// bool paginationLoadCompleted=false;

// //nexpageUrl

  bool isSending=false;
//   var nextMessagesUrl;

//scroll Controller
ScrollController scrollController = ScrollController();

//future messages
Future<List<Message>>?  messagesData;


int limit = 20;

bool moreLoading=false;

bool loadMore=true;

 ItemScrollController? itemScrollController;
 ScrollOffsetController? scrollOffsetController ;
 ItemPositionsListener? itemPositionsListener;
 ScrollOffsetListener? scrollOffsetListener;

void init() { 
 
   itemScrollController = ItemScrollController();
scrollOffsetController = ScrollOffsetController();
 itemPositionsListener = ItemPositionsListener.create();
 scrollOffsetListener = ScrollOffsetListener.create();
}
MessageModel? messageModel;

  bool isLaoding=false;
  bool isError=false;
    bool isPaingationLoading=false;
  String error = '';
// ChatSelectionModel? chatSelectionModel;
ApiResponse<ChatSelectionModel>?  chatSelectionModel = ApiResponse.completed(null);







// void startController(String? uid) {
//     scrollController.addListener(
//       () {
//         if (scrollController.offset >=
//                 scrollController.position.maxScrollExtent &&
//             !scrollController.position.outOfRange) {
//           print('reach to bottom botton');
//           if (!paginationLoadCompleted) {
//             // setState(() {
//               //add more data to list
//               messagesData = getMessageData(nextMessagesUrl+"&admin_id=$uid");
//             // });
//           }
//         }
//       },
//     );
//   }


// Future<List<Message>>

//    getMessageData(uri) async {
//     final response = await http.get(Uri.parse(uri??nextMessagesUrl) ,
    
//     headers: {
//       'Authorization':'Bearer ${sharedPrefs.token}',
//       'Content-Type':'application/json',
//       'Accept':'application/json'
//     }
//     ).timeout(const Duration(seconds: 15))
    
//     ;
//     if (response.statusCode == 200  ||  response.statusCode == 201) {
//       var testJson = json.decode(response.body);
//       // log(testJson.toString());
//       var data = testJson['data'];
//       log(response.body);
//       if (data['next_page_url'] != null) {
//         nextMessagesUrl = data['next_page_url'];
//       } else {
//         paginationLoadCompleted = true;
        
//       }
//       for (var item in data['data']) {
//         try {
//           Message test =
//             Message.fromJson(item);
            
//         messageList!.add(test);
//         } catch (e) {
//           log(e.toString());
//         }
//       }

//       notifyListeners();
//       // setState(() {
        
//       // });
//       return messageList!;
//     } else {
//       throw Exception('Failed to load Test');
//     }
//   }











updateLimit(){
  limit+=10;
  notifyListeners();
}




selectChatUser(Emp emp)async{
  chatUser = emp;

  

 isLaoding = true;
isError=false;
messageModel=null;
messages=[];
notifyListeners();
try {
  var response= await  ChatApis().fetchMessages(emp.id.toString(),
  '',null,false

  
  );
messageModel= response;
messages!.addAll(messageModel!.data!.data!);
messages!.sort((a, b) => a.id!.compareTo(b.id!));
messageModel!.data!.data!.sort((a, b) => a.id!.compareTo(b.id!));


notifyListeners();


}finally{
   isLaoding = false;
   notifyListeners();

// scrollToBottom();
//    if(itemScrollController!.isAttached){
//  itemScrollController!.scrollTo(
//   index:23,

//   duration: const Duration(seconds: 2),
//   curve: Curves.easeInOutCubic
  
//   );

// }
}



}







///msg/get_admin_msg?admin_id=1
///https://goodfoodsa.co/api/msg/send_msg
///
///




getMessages(url  , String? uid )async{

  

  // = true;
isError=false;
moreLoading= true;
notifyListeners();
await Future.delayed(const Duration(seconds: 3));
// messageModel=null;

log(url+"&admin_id=$uid".toString());
try {
 if (url == null) {
   
 }else {
   isPaingationLoading=true;
   notifyListeners();
 var response= await  ChatApis().fetchMessages(
    chatUser!.id.toString()
    ,
 limit.toString() ,
url+"&admin_id=$uid",true
 
 );
messageModel= response;

messages!.addAll(messageModel!.data!.data!);
messages!.sort((a, b) => a.id!.compareTo(b.id!));
messageModel!.data!.data!.sort((a, b) => a.id!.compareTo(b.id!));
// messages!.length==messageModel!.data!.length? loadMore=false:loadMore=true;
 isPaingationLoading=false;
   notifyListeners();
 }
 
// messageModel!.data!.sort((a, b) => a.id!.compareTo(b.id!));
// for (var data in messageModel!.data!) {
//   log(data.msg.toString());
// }
  
  

}finally{
   isLaoding = false;
   moreLoading=false;
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

Emp? emp ,String? msg, String? base64, 
String? ext

)async{
try {
  log(emp!.id.toString());
  log(msg!);
  log(base64.toString());
  log(ext.toString());
isSending=true;


  var response = await  ChatApis().sendMessage(emp.id.toString(), msg, base64 ,ext);


  log(response.data!.nextPageUrl!.toString());
  // messageModel = null;
  

// messageModel= response;
messages!.clear();
messages!.addAll(response.data!.data!);
messages!.sort((a, b) => a.id!.compareTo(b.id!));
// messageModel!.data!.data!.sort((a, b) => a.id!.compareTo(b.id!));
  // duration: Duration(seconds: 2),
  // curve: Curves.easeInOutCubic
  // scrollController
  // scrollController.jumpTo(
  //   scrollController.position.maxScrollExtent
  // );
  itemScrollController!.scrollTo(
  index: messages!.length,

  duration: const Duration(milliseconds: 100),
  curve: Curves.easeInOutCubic
  
  );
}finally{
  isSending=false;

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
  
messageModel= response;
messages!.addAll(messageModel!.data!.data!);
messages!.sort((a, b) => a.id!.compareTo(b.id!));
messageModel!.data!.data!.sort((a, b) => a.id!.compareTo(b.id!));
  log("DONE");
}finally{
notifyListeners();
}
}


scrollToBottom(){
  log('SCROLL TO BOTTOM');
    itemScrollController!.scrollTo(
  index: messages!.length,

  duration: const Duration(milliseconds: 100),
  curve: Curves.easeInOutCubic
  
  );
}



Future editMessage(
String?  receiver,String? messageId,
String? msg, String? base64

)async{
try {
  log(msg!);
isSending=true;
notifyListeners();

  var response = await  ChatApis().editeMessage(messageId!, receiver!, msg, base64);
  messageModel = null;
  
  messageModel = response;

messages!.addAll(messageModel!.data!.data!);
messages!.sort((a, b) => a.id!.compareTo(b.id!));  log("DONE");
messageModel!.data!.data!.sort((a, b) => a.id!.compareTo(b.id!));
}finally{
  isSending= false;
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


selectChatUser(response).then((e){


  scrollToBottom();
});
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


clearChat(){
  chatUser= null;
  messageModel=null;
  messages=[];
  notifyListeners();
}

}