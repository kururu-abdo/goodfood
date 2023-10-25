import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/send_message_with_image.dart';
import 'package:goodfoods/core/colors.dart';
import 'package:goodfoods/core/controllers/chat_controller.dart';
import 'package:goodfoods/core/data/models/message.dart';
import 'package:goodfoods/core/presentation/select_employee.dart';
import 'package:goodfoods/core/presentation/widgets/message_ui.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ChagePage extends StatefulWidget {
  final bool?  fromNotificatios;
  final String? userId;
  const ChagePage({ Key? key  , this.fromNotificatios=false, this.userId}) : super(key: key);

  @override
  _ChagePageState createState() => _ChagePageState();
}

class _ChagePageState extends State<ChagePage> {






TextEditingController messageController =TextEditingController();

  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (isTop) {
        context.read<ChatController>().getMessages();
      } else {
        print('At the bottom');
      }
    }
  });


 WidgetsBinding.instance.addPostFrameCallback((_) {
  if (widget.fromNotificatios!) {
    //load user

    //load messages
    context.read<ChatController>().loadChatUser(widget.userId!);


        scrolltoBottom();
  }

 });

  }

File? selectedImage;

getImage(BuildContext context) async {

 var appLocale = AppLocalizations.of(context);


  bool? 
  
  isCamera =
  
   await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child:  Text( appLocale!.translate("camera")!),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child:  Text( appLocale.translate("gallery")!),
          ),
        ],
      ),
    ),
  );

  if (isCamera == null) return;

  XFile? file = await ImagePicker()
      .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
  selectedImage = File(file!.path);
  setState(() {});

 SendImageMessage( 

   selectedImage: selectedImage,
 ).launch(context).then((value) {

        scrolltoBottom();
 });
}


@override
  void dispose() {
    messageController.dispose();



    super.dispose();

  }



scrolltoBottom(){
 Future.doWhile(() {
      if (_scrollController.position.extentAfter == 0) {
        return Future.value(false);
      }
      return _scrollController
          .animateTo(_scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100), curve: Curves.linear)
          .then((value) => true);
    });

}

  @override
  Widget build(BuildContext context) {
      var chatController = Provider.of<ChatController>(context);
 var appLocale = AppLocalizations.of(context);
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

        scrolltoBottom();

                      },
                    ).launch(context);
                  }),
        ),
      body:
      Builder(builder: 
(_){
if (chatController.isLaoding ){
  
  return Center(
    child: mProgress(context ,fromPage: true),
  );
}
else if(chatController.isError) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(chatController.error.toString()) ,
const SizedBox(height: 8,),
IconButton(onPressed: (){
  
}, icon: const Icon(Icons.refresh ,color: kcPrimaryColor,))
    ],
  );
}
  else  if (chatController.chatUser == null){

return 
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
);


}    

else{
  return Column(
    children: [

     

          Expanded(
            // height: MediaQuery.of(context).size.height,
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollEnd) {
                 final metrics = scrollEnd.metrics;
    if (metrics.atEdge) {
      bool isTop = metrics.pixels == 0;
      if (isTop) {
              

      } else {
      }
    }
    // if (scrollInfo.metrics.pixels ==
    //     scrollInfo.metrics.minScrollExtent) {
     
    // }
return

    true;
  },
              child: 
              chatController.messageModel==null?
              const SizedBox():
              
              
              ListView.builder(
                controller: _scrollController,
              itemCount: chatController.messageModel!.data!.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              physics: const ScrollPhysics(),
              itemBuilder: (context, index){
              var data  =  chatController.messageModel!.data![index];
                      
                      
                return Container(
                  padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: 
                    (
              
              // messages[index].messageType == "receiver"?
                    data.senderId.toString() ==sharedPrefs.user_id?
                    
                    Alignment.topLeft:Alignment.topRight),
                    child:
                    data.mediaUrl!=null?
                    MediaMessage(messsage: data):
                    MessageWithoutMedia(messsage: data)
                    
                      //          Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     color: (
                      //       data.senderId.toString() ==sharedPrefs.user_id?
                      //       // messages[index].messageType  == "receiver"?
                
                      //      Colors.blue:
                      //     Colors.grey.shade300
                
              
                
                
                      //     ),
                      //   ),
                      //   padding: const EdgeInsets.all(16),
                      //   child: Builder(
                      //     builder: (context) {
                      // if (data.mediaUrl!= null) {
                      //   return 
              
                      //   Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      // Image.network(
                      //   "https://goodfoodsa.co${data.mediaUrl!}" , height: 120,) ,
                      // const SizedBox(height: 8,),
                      // Text("${data.msg}", style:  TextStyle(
                      //         color:
                      //         data.senderId.toString() ==sharedPrefs.user_id?
                      //         // messages[index].messageType  == "receiver"
                      //         //  ?
                     
                  
                    
                      //        Colors.white:   Colors.black,
                      
                      
                      //         fontSize: 15),)
                      
                      //     ],
                      //   );
                      
                      
                      
                      // }
                      
                      
                      //     else {
                      //   return Text("${data.msg}", style:  TextStyle(
                      //         color:
                      //         data.senderId.toString() ==sharedPrefs.user_id?
                      //         // messages[index].messageType  == "receiver"
                      //         //  ?
                      //      Colors.white:   Colors.black,
                      
                      //         fontSize: 15),);
                      // }
                      //     }
                      //   ),
                      //         ),
               
               
               
                  ),
                );
              },
                      ),
            ),
          ),


  
       Visibility(
        //  visible: chatController.chatUser != null,
         child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                         margin: const EdgeInsets.only(top: 10),
                        // height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 60,
                                  child: Card(
                                    margin: const EdgeInsets.only(
                                        left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child
                                    : 
                                    
                                    TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical: TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            // sendButton = true; 
                                          });
                                        } else {
                                          setState(() {
                                            // sendButton = false;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      
                                        hintText:  appLocale!.translate("type_a_message")!,
                                        hintStyle: const TextStyle(color: Colors.grey),
                                       
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // IconButton(
                                            //   icon: const Icon(Icons.attach_file),
                                            //   onPressed: () {
                                            //     showModalBottomSheet(
                                            //         backgroundColor:
                                            //             Colors.transparent,
                                            //         context: context,
                                            //         builder: (builder) =>
                                            //             bottomSheet());
                                            //   },
                                            // ),
                                            IconButton(
                                              icon: const Icon(Icons.camera_alt),
                                              onPressed: ()async {
       
                                                  await        getImage(context);
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (builder) =>
                                                //             CameraApp()));
                                              },
                                            ),
                                          ],
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 10 ,vertical: 5
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                    right: 2,
                                    left: 2,
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: kcPrimaryColor,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.send ,
                                        color: Colors.white,
                                      ),
                                      onPressed: ()async {
                             chatController.sendMessage(chatController.chatUser,
        _controller.text, null).then((value) => {
        _controller.clear(),
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent)
        }
        );

        scrolltoBottom();
                                        }
                                      
                                    ),
                                  ),
                                ),
                              ],
                            ),
                           
                          ],
                        ),
                      ),
         
         ),
       )
            
       
  


    ],
  );
}



}
      )



//        Column(
//         children: <Widget>[


// Builder(builder: 
// (_){
// if (chatController.isLaoding ){
  
//   return Center(
//     child: mProgress(context ,fromPage: true),
//   );
// }
// else if(chatController.isError) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Text(chatController.error.toString()) ,
// const SizedBox(height: 8,),
// IconButton(onPressed: (){
  
// }, icon: const Icon(Icons.refresh ,color: kcPrimaryColor,))
//     ],
//   );
// }
// else  if (chatController.chatUser == null){

// return 
//  Center(
//   child:   Column(
//     mainAxisAlignment: MainAxisAlignment.center,
  
//     mainAxisSize: MainAxisSize.max,
//     children: [
//   const ImageIcon(AssetImage('assets/icons/chat-off.png') , 
  
//   size: 100,
//   ) ,
//   15.height ,
  
//   const Text('Please Select Chat')
  
  
//     ],
//   ),
// );


// }
// else  {
  
  
//   }
  
  
 


  
// }

// ),



// //           Align(
// //             alignment: Alignment.bottomLeft,
// //             child:
            
            
// //              Container(
// //               padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
// //               // height: 60,
// //               width: double.infinity,
// //               color: Colors.white,
// //               child: Row(
// //                 children: <Widget>[
// //                   // GestureDetector(
// //                   //   onTap: (){
// //                   //   },
// //                   //   child: Container(
// //                   //     height: 30,
// //                   //     width: 30,
// //                   //     decoration: BoxDecoration(
// //                   //       color: Colors.lightBlue,
// //                   //       borderRadius: BorderRadius.circular(30),
// //                   //     ),
// //                   //     child: const Icon(Icons.add, color: Colors.white, size: 20, ),
// //                   //   ),
// //                   // ),
// //                   // const SizedBox(width: 15,),
// //                    Expanded(
// //                     child: TextField(
// //                       controller: messageController,
// //                       enabled: chatController.chatUser!=null,
// //                       minLines: 1,
// //                       decoration: const InputDecoration(
                        
// //                         hintText: "Write message...",
                        
// //                         hintStyle: TextStyle(color: Colors.black54),
// //                         border: InputBorder.none
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(width: 15,),
// //                     FloatingActionButton(
// //                     onPressed: (){

 



// //                     },
// //                     backgroundColor: Theme.of(context).primaryColor,
// //                     elevation: 0,
// //                     child: const Icon(Icons.image,color: Colors.white,size: 18,),
// //                   ),       const SizedBox(width: 15,),
// //                   FloatingActionButton(
// //                     onPressed: (){
// // chatController.sendMessage(chatController.chatUser,
// //  messageController.text, null);
 



// //                     },
// //                     backgroundColor: Theme.of(context).primaryColor,
// //                     elevation: 0,
// //                     child: const Icon(Icons.send,color: Colors.white,size: 18,),
// //                   ),
// //                 ],
                
// //               ),
// //             ),
         
// //           ),


//       ],
      
      
      
      
//       ),
    
    
    
    
    
    
    );
  }


    Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

}
List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];




/*


void _showAlert() {
AlertDialog dialog = new AlertDialog(
  content: new Container(
    width: 260.0,
    height: 230.0,
    decoration: new BoxDecoration(
      shape: BoxShape.rectangle,
      color: const Color(0xFFFFFF),
      borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
    ),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // dialog top
        new Expanded(
          child: new Row(
            children: <Widget>[
              new Container(
                // padding: new EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                ),
                child: new Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        // dialog centre
        new Expanded(
          child: new Container(
              child: new TextField(
            decoration: new InputDecoration(
              border: InputBorder.none,
              filled: false,
              contentPadding: new EdgeInsets.only(
                  left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
              hintText: ' add review',
              hintStyle: new TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12.0,
                fontFamily: 'helvetica_neue_light',
              ),
            ),
          )),
          flex: 2,
        ),

        // dialog bottom
        new Expanded(
          child: new Container(
            padding: new EdgeInsets.all(16.0),
            decoration: new BoxDecoration(
              color: const Color(0xFF33b17c),
            ),
            child: new Text(
              'Rate product',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'helvetica_neue_light',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  ),
);

showDialog(context: context, child: dialog);
}
}






//2


return new CustomAlertDialog(
    content: new Container(
        width: 260.0,
        height: 230.0,
        decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius:
            new BorderRadius.all(new Radius.circular(32.0)),
        ),
        child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            // dialog top
            new Expanded(
            child: new Row(
                children: <Widget>[
                new Container(
                    // padding: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                    color: Colors.white,
                    ),
                    child: new Text(
                    'Rate',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                    ),
                ),
                ],
            ),
            ),

            // dialog centre
            new Expanded(
            child: new Container(
                child: new TextField(
                decoration: new InputDecoration(
                border: InputBorder.none,
                filled: false,
                contentPadding: new EdgeInsets.only(
                    left: 10.0,
                    top: 10.0,
                    bottom: 10.0,
                    right: 10.0),
                hintText: ' add review',
                hintStyle: new TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12.0,
                    fontFamily: 'helvetica_neue_light',
                ),
                ),
            )),
            flex: 2,
            ),

            // dialog bottom
            new Expanded(
            child: new Container(
                padding: new EdgeInsets.all(16.0),
                decoration: new BoxDecoration(
                color: const Color(0xFF33b17c),
                ),
                child: new Text(
                'Rate product',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.center,
                ),
            ),
            ),
        ],
        ),
    ),
    );
});











*/