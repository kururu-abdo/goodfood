import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/chat_controller.dart';
import 'package:goodfoods/core/data/models/chat_selection_model.dart';
import 'package:goodfoods/core/data/models/message_model.dart';
import 'package:goodfoods/core/data/network/apis/chat_apis.dart';
import 'package:goodfoods/core/presentation/select_employee.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
class ChatPage2 extends StatefulWidget {
    final bool?  fromNotificatios;
  final String? userId;
  const ChatPage2({ Key? key, this.fromNotificatios, this.userId }) : super(key: key);

  @override
  _ChatPage2State createState() => _ChatPage2State();
}

class _ChatPage2State extends State<ChatPage2> {
  final ScrollController _scrollController = ScrollController();

var notificationUrl='https://goodfoodsa.co/api/msg/get_admin_msg';
//future messages
Future<List<Message>>?  messagesData;

//scroll Controller
ScrollController scrollController = ScrollController();
void startController(String? uid) {
    scrollController.addListener(
      () {
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange) {
          print('reach to bottom botton');
          if (!paginationLoadCompleted) {
            // setState(() {
              //add more data to list
              messagesData = getMessageData(nextMessagesUrl+"&admin_id=$uid");
            // });
          }
        }
      },
    );
  }

Future<List<Message>>

   getMessageData(uri) async {
    final response = await http.get(Uri.parse(uri??nextMessagesUrl) ,
    
    headers: {
      'Authorization':'Bearer ${sharedPrefs.token}',
      'Content-Type':'application/json',
      'Accept':'application/json'
    }
    ).timeout(const Duration(seconds: 15))
    
    ;
    if (response.statusCode == 200  ||  response.statusCode == 201) {
      var testJson = json.decode(response.body);
      // log(testJson.toString());
      var data = testJson['data'];
      log(response.body);
      if (data['next_page_url'] != null) {
        nextMessagesUrl = data['next_page_url'];
      } else {
        paginationLoadCompleted = true;
        
      }
      for (var item in data['data']) {
        try {
          Message test =
            Message.fromJson(item);
            
        messageList!.add(test);
        } catch (e) {
          log(e.toString());
        }
      }

      setState(() {
        
      });
      // setState(() {
        
      // });
      return messageList!;
    } else {
      throw Exception('Failed to load Test');
    }
  }

Emp?  chatUser ;

//message
List<Message>? messages=[];

List<Message>? messageList=[];
//paginationLoad Completed;
bool paginationLoadCompleted=false;

  var nextMessagesUrl;



Future<Emp>?  futureUser ;
  var notificaitonLoadCompleted = false;
    List<Message> notificationList = [];






Future<List<Message>>?  notificationData;



Future<List<Message>>

   getNotificationData(uri) async {
    final response = await http.get(Uri.parse(uri) ,
    
    headers: {
      'Authorization':'Bearer ${sharedPrefs.token}',
      'Content-Type':'application/json',
      'Accept':'application/json'
    }
    ).timeout(const Duration(seconds: 15))
    
    ;
    if (response.statusCode == 200  ||  response.statusCode == 201) {
      var testJson = json.decode(response.body);
      // log(testJson.toString());
      var data = testJson['data'];
      log(response.body);
      if (testJson['next_page_url'] != null) {
        nextNotificationUrl = testJson['next_page_url'];
      } else {
        notificaitonLoadCompleted = true;
        
      }
      for (var item in data) {
        try {
          Message test =
             Message.fromJson(item);
            
        notificationList.add(test);
        } catch (e) {
          log(e.toString());
        }
      }
      setState(() {
        
      });
      return notificationList;
    } else {
      throw Exception('Failed to load Test');
    }
  }

// void startController() {
//     _scrollController.addListener(
//       () {
//         if (_scrollController.offset >=
//                 _scrollController.position.maxScrollExtent &&
//             !_scrollController.position.outOfRange) {
//           print('reach to bottom botton');
//           if (!notificaitonLoadCompleted) {
//             setState(() {
//               //add more data to list
//               notificationData = getNotificationData(nextNotificationUrl);
//             });
//           }
//         }
//       },
//     );
//   }


  
  
  var nextNotificationUrl;

loadUser()async{
  futureUser=
ChatApis().fetchChatUser(widget.userId!);

}



  @override
  Widget build(BuildContext context) {
          var chatController = Provider.of<ChatController>(context);
 var appLocale = AppLocalizations.of(context);
    return FutureBuilder(
  future: notificationData,
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
return

 Scaffold(
        appBar: AppBar(
          elevation: 0,

          title: 
           Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Text(
                        chatController.chatUser==null?
                        'Select chat':
                          chatController.chatUser!.name!
                       ,style: const TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 6,),
                      Text(
                          chatController.chatUser==null?
                        
                        "":
                        chatController.chatUser!.email!
                        
                        ,style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ).onTap((){
                     SelectEmployee(

                      onSelect: (user){
                        // chatController.selectChatUser(user);
                        futureUser = Future.value(user);

        // scrolltoBottom();

                      },
                    ).launch(context);
                  }),
        ),
      body:  
       Scaffold(
        appBar: AppBar(
          elevation: 0,

          title: 
           Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Text(
                        chatController.chatUser==null?
                        'Select chat':
                          chatController.chatUser!.name!
                       ,style: const TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 6,),
                      Text(
                          chatController.chatUser==null?
                        
                        "":
                        chatController.chatUser!.email!
                        
                        ,style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ).onTap((){
                     SelectEmployee(

                      onSelect: (user){
                        chatController.selectChatUser(user);

        // scrolltoBottom();

                      },
                    ).launch(context);
                  }),
        ),
      body:
      Center(
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.center,
  
    mainAxisSize: MainAxisSize.max,
    children: [
  const ImageIcon(AssetImage('assets/icons/chat-off.png') , 
  
  size: 100,
  ) ,
  15.height ,
  
   Text(appLocale!.translate("select_emp")!)
  
  
    ],
  ).onTap((){
     SelectEmployee(

                      onSelect: (user){
                        chatController.selectChatUser(user);

                      },
                    ).launch(context);
  }),
)
      ));






    }else {



return

 Scaffold(
        appBar: AppBar(
          elevation: 0,

          title: 
           Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Text(
                        chatController.chatUser==null?
                        'Select chat':
                          chatController.chatUser!.name!
                       ,style: const TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      const SizedBox(height: 6,),
                      Text(
                          chatController.chatUser==null?
                        
                        "":
                        chatController.chatUser!.email!
                        
                        ,style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ).onTap((){
                     SelectEmployee(

                      onSelect: (user){
                        
                        chatController.selectChatUser(user);

        // scrolltoBottom();

                      },
                    ).launch(context);
                  }),
        ),

body: FutureBuilder(
  future: messagesData,
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
return Center(child: mProgress(context ,fromPage: true),);

    }
 else  { 

 if (
                          messageList!.isEmpty) {
                              log('DATA ${snapshot.data}');
                     return        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(Icons.notifications ,
                color: Theme.of(context).primaryColor,
                ),
              ),
            ),

            Text('لا توجد اشعاارات بعد' ,
            
            style: TextStyle(color: Colors.black,fontSize: 20 ,fontWeight: FontWeight.bold),
            )
          ],
        );
        
                          }
else {

return Expanded(child: 

SingleChildScrollView( 
  controller: scrollController,

  child: ListView(

children: messageList!.map((e) => Text(e.msg.toString())).toList(),
  ),
 ));


}














 }
  
  
  
  }
  )
    
 );




    }
  }
    );
  }

}