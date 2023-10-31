import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/core/colors.dart';
import 'package:goodfoods/core/controllers/chat_controller.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SendImageMessage extends StatefulWidget {
  final bool? isEdit;
  final int? messageId;

  final String? messageImage;
  final String? messageText;
  final File? selectedImage;
  
  const SendImageMessage({ Key? key, this.selectedImage, this.isEdit=false, this.messageId, this.messageText, this.messageImage }) : super(key: key);

  @override
  _SendImageMessageState createState() => _SendImageMessageState();
}

class _SendImageMessageState extends State<SendImageMessage> {


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
    if (widget.isEdit!) {
      _controller.text = widget.messageText!;
    }
  }


File? selectedImage;

getImage(BuildContext context) async {
  var appLocale = AppLocalizations.of(context);
  bool? 
  
  isCamera = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child:Text( appLocale!.translate("camera")!),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text( appLocale.translate("gallery")!),
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

  Navigator.of(context).push(
    MaterialPageRoute(builder: (_)=>
    
      SendImageMessage(
        selectedImage: selectedImage,
      )
      )
  
  );
}

  @override
  Widget build(BuildContext context) {
          var chatController = Provider.of<ChatController>(context);
  var appLocale = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Visibility(
            visible: widget.isEdit!,
            
            child: 
           IconButton(
                                              icon: const Icon(Icons.camera_alt, color: Colors.white,),
                                              onPressed: ()async {
       
                                                  await        getImage(context);
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (builder) =>
                                                //             CameraApp()));
                                              },
                                            )
          
          )
        ],
        title: Text(
          '${chatController.chatUser!.name}',
          style: const TextStyle(
            color: Colors.white
          ),
        ),
      backgroundColor: Colors.black,
      elevation: 0, 
      leading: IconButton(onPressed: (){
Navigator.pop(context);
      }, icon: 
      const Icon(Icons.close , color: Colors.white,)),
      ),
      

body: Stack(
  children: [
Container(
  height: MediaQuery.of(context).size.height, 
  width:MediaQuery.of(context).size.height ,

  decoration: BoxDecoration(image: 
 
  
  DecorationImage(image: 
   getDecroationImage() , fit:BoxFit.cover
  )
  
  ),
),

       Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
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
                                  child: TextFormField(
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
                                    decoration:  InputDecoration(
                                      border: InputBorder.none,
                                    
                                      hintText: appLocale!.translate("type_a_message")!,
                                      hintStyle: TextStyle(color: Colors.grey),
                                     
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
                                         
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
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
                                      if (!widget.isEdit!) {
                                                                     chatController.sendMessage(chatController.chatUser,
 _controller.text, chatController.getBase64(widget.selectedImage!.path),
 
 getFileExtenstion(widget.selectedImage!.path)
 ).then((value) {


   Navigator.pop(context);
 });
                                      }else {



       chatController.editMessage(
         chatController.chatUser!.id.toString(),

         widget.messageId.toString(),
 _controller.text,
 selectedImage!=null?
  chatController.getBase64(selectedImage!.path):null).then((value) {


   Navigator.pop(context);
 });
     















                                      }
         


                                      }
                                    
                                  ),
                                ),
                              ),
                            ],
                          ),
                         
                        ],
                      ),
                    ),
       
       ) 
      
      




  ],
),


    );
  }

  ImageProvider getDecroationImage(){
     if  (widget.isEdit! && selectedImage==null ){
       return NetworkImage( "https://goodfoodsa.co${widget.messageImage!}");
     }
     else if(widget.isEdit!&&selectedImage!=null ){
       return FileImage(selectedImage!);
     }else {
       return FileImage(widget.selectedImage!);
     }

  }
}