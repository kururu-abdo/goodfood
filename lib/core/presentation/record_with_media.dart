import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/image_picker_container.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class RecordWithMediaPage extends StatefulWidget {
  final String? orderId;
  const RecordWithMediaPage({ Key? key, this.orderId }) : super(key: key);

  @override
  _RecordWithMediaPageState createState() => _RecordWithMediaPageState();
}

class _RecordWithMediaPageState extends State<RecordWithMediaPage> {
TextEditingController commentController = 
TextEditingController();
var formKey =GlobalKey<FormState>();
  @override
  void initState() { 
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    
      var controller = Provider.of<MaintenanceController>(context);
    return    Scaffold(
      
resizeToAvoidBottomInset: false,
appBar: AppBar( 
  elevation: 1,
  title: Text(currentLang(context)=="ar"?
  "الرد بملف":"Comment by file"
  )
  ,
      
      leading:
      IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back 
      // color: Colors.white
      ,))

,









      ),
      body: SizedBox.expand(



   
   child:                
Builder(builder: (_){


return
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Column(
                    children: [
                              15.height ,
                     
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                              
                              
                               20.height,
                              
                               Form(
                                 key: formKey,
                                 
                                 child: 
                               
                               Column(
                              children: [
                              
                              
                    BoxInputField(

                      validator: (str){
                        if (str!.isEmpty) {
                          return 
                            currentLang(context)=="ar"?
                             "الرجاء كتابة تعليق"   :"Please Write a comment"; 
                        }
                        return null;
                      },
                      isInputAea: true, 
                      
                      controller: 
                    commentController
                     , 
                  
                     placeholder: translate(context, "type_a_comment"),
                    ),
                              
                                    10.height,


   controller.recordFile ==null
   
   ?
  ImagePickerContainer(
    showFiles: true,
    onSelect: (file, isImage){

     
         controller.setRecordFile(file!.path);
     
 
    },
  ): 
  Center(

    child:
    

    controller.recordFile !=null?
    
      Container(
         width: 220,
                  height: 220,
      padding: EdgeInsets.zero,
            // clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
               SizedBox(
                  width: 200,
                  height: 200,
                 child:
                 
                 (
                           controller.recordFile!.path!.
                          toLowerCase()
                          .toString().contains("png")|| 
                        
                         controller.recordFile!.path!.toLowerCase().toString().contains("jpeg")|| 
                         controller.recordFile!.path!.toLowerCase().toString().contains("jpg") )?
                 
                 
                 
                 
                 
                 
                 
                 
                 
                  Image.file(
               File(  controller.recordFile!.path!),
                  width: 200,
                  height: 200,
                  
                  ):
                  
                   Image.asset(
              getFileIocn(controller.recordFile!.path!),
                  width: 200,
                  height: 200,
                  
                  )
                  
                  ,
               ),
                Positioned(
                  right: 10,
                  top: 0,
                  child: InkWell(
                  child: const Icon(
                    Icons.remove_circle,
                    size: 20,
                    color: Colors.red,
                  ),
                  onTap: () {
                    controller.removeRecordFile();
                  },
                  ),
                ),
              ],
            ))
     
     
     
     
     :

      Container(
         width: 220,
                  height: 220,
      padding: EdgeInsets.zero,
            // clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
               SizedBox(
                  width: 200,
                  height: 200,
                 child: Image.asset(
                getFileIocn(controller.filePath!),
                  width: 200,
                  height: 200,
                  
                  ),
               ),
                Positioned(
                  right: 10,
                  top: 0,
                  child: InkWell(
                  child: const Icon(
                    Icons.remove_circle,
                    size: 20,
                    color: Colors.red,
                  ),
                  onTap: () {
                    controller.removeRecordFile();
                  },
                  ),
                ),
              ],
            ))
     
     
     
     
     ,
  ),
  
                    // const Spacer() ,
                              
                    // const Spacer() ,
                              
                                    20.height,
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                              minimumSize: const Size.fromHeight(50)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                     
                           
                  
                               //submit
                            
                  if (controller.recordFile==null) {
                  //    controller.addReplyument(context,
                                
                  //                  widget.order!.id.toString(), commentController.text ,
                  //                  getBase64(controller.imagePath!),
                  //                  getFileExtenstion(controller.imagePath!)
                                 
                  //                  );
                  showToast(currentLang(context)=="ar"?"الرجاء اختيار  ملف":"Please upload file", true);
                  }else {

controller.addRecord(context, widget.orderId.toString(), commentController.text,

controller.recordFile!.fileBase64 ,
controller.recordFile!.extension
).then((value) {


  Navigator.pop(context);
});

                  }
                  
                  // if (controller.fileDoc!=null) {
                  //    controller.addReplyument(context,
                                
                  //                  widget.order!.id.toString(), commentController.text ,
                  //                  getBase64(controller.filePath!),
                  //                  getFileExtenstion(controller.filePath!)
                                 
                  //                  );
                  // }
                  // else {
                  //   showToast(currentLang(context)=="ar"?"الرجاء اختيار  ملف":"Please upload file", true);
                  
                  //               //The form has some validation errors.
                  //               //Do Something...
                  //              }
                          }
                          
                          
                          
                          },
                          child:  
                          
                          controller.addRecordStatus!.status==Status.LOADING?
                          const Center(child: CircularProgressIndicator(
                            
                          ),)
                          :
                          Text(
                              currentLang(context)=="ar"?
                              "ارسال":
                            
                            'SEND'))
                   
                              ],
                              
                               )
                               
                               )
                    ]),
                  

                    ]
                    
                    
                  
                
              


                  )
                  )

                );
             
              
              
              
              }
            ),
      
      
      
      
      
    )
    
    );
  
  
  }
}