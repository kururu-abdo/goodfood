import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/send_message_with_image.dart';
import 'package:goodfoods/core/controllers/chat_controller.dart';
import 'package:goodfoods/core/data/models/message_model.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';

class MessageWithoutMedia extends StatefulWidget {
  final MessageData messsage;
  const MessageWithoutMedia({ Key? key, required this.messsage }) : super(key: key);

  @override
  _MessageWithoutMediaState createState() => _MessageWithoutMediaState();
}

class _MessageWithoutMediaState extends State<MessageWithoutMedia> {


TextEditingController controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var appLocale = AppLocalizations.of(context);
      var chatController = Provider.of<ChatController>(context);

    return 
                   GestureDetector(
                     onLongPress: (){

if (
  widget.messsage.senderId.toString()==sharedPrefs.user_id &&
  
  chatController.getDateDiff(widget.messsage.createdAt)) {
  
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 0, 0, 0),
                    // onSelected: () => setState(() => imageList.remove(index))},

                    items: <PopupMenuEntry>[
                      PopupMenuItem(
                        onTap: (){

                          //show confirmation dialog


                   Dialogs.materialDialog(
          msg:   appLocale.translate("sure_delete_msg")!,
          title: appLocale.translate("ok")!,
          color: Colors.white,
          context: context,
          actions: [
            IconsOutlineButton(
              onPressed: () {
                
              },
              text: appLocale.translate("cancel")!,
              iconData: Icons.cancel_outlined,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: ()async {

 chatController.deleteMessage(widget.messsage.reciverId!.toString(), widget.messsage.id.toString());
 
              },
              text:appLocale.translate("delete")!,
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
                        },
                        value:  widget.messsage.id,
                        child:  Row(                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

    Text(appLocale!.translate("edit")!),   SizedBox(width: 10,),


                            Icon(Icons.delete , color: Colors.red,)
                          ],
                        ),
                      ) ,
                       PopupMenuItem(
                         onTap: (){
                           controller.text= widget.messsage.msg.toString();
                           AlertDialog dialog = AlertDialog(
  content: Container(
    width: 260.0,
    height: 230.0,
    decoration: const BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color(0x00ffffff),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // dialog top
        Expanded(
          child: Row(
            children: <Widget>[
              Container(
                // padding: new EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child:  Text(
                  appLocale.translate("edit_msg")!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        // dialog centre
        Expanded(
          flex: 2,
          child: Container(
              child: TextField(
controller: controller,
maxLines: 999,

            decoration: InputDecoration(
              border: InputBorder.none,
              filled: false,
              contentPadding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
              hintText:  appLocale.translate("edit_msg"),
              hintStyle: TextStyle(
              
                color: Colors.grey.shade500,
                fontSize: 12.0,
              ),
            ),
          )),
        ),

        // dialog bottom
        Expanded(
          child: GestureDetector(
            onTap: (){
                   chatController.editMessage(widget.messsage.reciverId!.toString(),
                    widget.messsage.id!.toString(),
                     controller.text, null)
        .then((value) => {
   Navigator.pop(context)
        }
        );
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child:  Text(
              appLocale.translate("save_edit")!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);

showDialog(context: context, builder:(_)=> dialog);
                         },
                        value:  widget.messsage.id,
                        child: const Row(                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                             Text("Edit"),   SizedBox(width: 10,),
                            Icon(Icons.edit_square ,color: Colors.green,),
                          
                           
                          ],
                        ),
                      )
                    ],


                    
                  );
      
}          

                       
                     },
                     child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 color: (
                                   widget.messsage.senderId.toString() ==sharedPrefs.user_id?
                                   // messages[index].messageType  == "receiver"?
                                 
                                  Colors.blue:
                                 Colors.grey.shade300
                                 
                             
                                 
                                 
                                 ),
                   
                               ),
                               padding: const EdgeInsets.all(16),
                         child: Text("${widget.messsage.msg}", style:  TextStyle(
                                     color:
                                     widget.messsage.senderId.toString() ==sharedPrefs.user_id?
                                     // messages[index].messageType  == "receiver"
                                     //  ?
                                  Colors.white:   Colors.black,
                             
                                     fontSize: 15),)
                       ),
                   );
  }
}
class MediaMessage extends StatefulWidget {
    final MessageData messsage;

  const MediaMessage({ Key? key, required this.messsage }) : super(key: key);

  @override
  _MediaMessageState createState() => _MediaMessageState();
}

class _MediaMessageState extends State<MediaMessage> {
  @override
  Widget build(BuildContext context) {
        var appLocale = AppLocalizations.of(context);
      var chatController = Provider.of<ChatController>(context);

    return   GestureDetector(
      onLongPress: (){
        if (
  widget.messsage.senderId.toString()==sharedPrefs.user_id &&
  
  chatController.getDateDiff(widget.messsage.createdAt)) {
  
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 0, 0, 0),
                    // onSelected: () => setState(() => imageList.remove(index))},

                    items: <PopupMenuEntry>[
                      PopupMenuItem(
                        onTap: (){

                          //show confirmation dialog


                   Dialogs.materialDialog(
          msg:  appLocale.translate("sure_delete_msg")!,
          title: appLocale.translate("ok")!,
          color: Colors.white,
          context: context,
          actions: [
            IconsOutlineButton(
              onPressed: () {
                
              },
              text: appLocale.translate("cancel")!,
              iconData: Icons.cancel_outlined,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {


              },
              text: 'Delete',
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
                        },
                        value:  widget.messsage.id,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                              Text(appLocale!.translate("delete")!),   SizedBox(width: 10,),
                            Icon(Icons.delete , color: Colors.red,),
                            
                          ],
                        ),
                      ) ,
                       PopupMenuItem(
                         onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: 
                            (_)=> 
                            
                            SendImageMessage(
                              isEdit: true, 
                              messageId: widget.messsage.id,
                              messageImage: widget.messsage.mediaUrl,
                              messageText: widget.messsage.msg,
                            )

                            
                            )
                          );
                         },
                        value:  widget.messsage.id,
                        child:  Row(                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                              Text(appLocale!.translate("edit")!),   SizedBox(width: 10,),
                            Icon(Icons.edit_square ,color: Colors.green,),
                          
                          ],
                        ),
                      )
                    ],


                    
                  );
      
}    
      },
      child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: (
                  widget.messsage.senderId.toString() ==sharedPrefs.user_id?
                  // messages[index].messageType  == "receiver"?
                
                 Colors.blue:
                Colors.grey.shade300
                
            
                
                
                ),
    
              ),
              padding: const EdgeInsets.all(16),
        child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            Image.network(
              "https://goodfoodsa.co${widget.messsage.mediaUrl!}" , height: 120,) ,
            const SizedBox(height: 8,),
            Text("${widget.messsage.msg}", style:  TextStyle(
                    color:
                    widget.messsage.senderId.toString() ==sharedPrefs.user_id?
                    // messages[index].messageType  == "receiver"
                    //  ?
                     
                  
                    
                   Colors.white:   Colors.black,
            
            
                    fontSize: 15),)
            
                ],
              )
            
      ),
    );
  }
}