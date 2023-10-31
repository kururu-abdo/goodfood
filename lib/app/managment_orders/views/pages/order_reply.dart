import 'package:flutter/material.dart';
import 'package:goodfoods/app/documents/views/pages/open_document_page.dart';
import 'package:goodfoods/app/managment_orders/controllers/requests_controller.dart';
import 'package:goodfoods/app/managment_orders/models/management_order.dart';
import 'package:goodfoods/core/box_text.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/image_picker_container.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/document_service.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class OrderReply extends StatefulWidget {
  final ManagementOrderModel? order;
  final bool? fromNotifications;
  final  String? orderId;
  const OrderReply({ Key? key, this.order, this.fromNotifications=false, this.orderId }) : super(key: key);

  @override
  _OrderReplyState createState() => _OrderReplyState();
}

class _OrderReplyState extends State<OrderReply> {

TextEditingController commentController = 
TextEditingController();
var formKey =GlobalKey<FormState>();

@override
  void initState() { 
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
if (widget.fromNotifications!) {
  //load data


context.read<RequestController>().getRequest(context, widget.orderId);



} else {
}

   });

  }








  @override
  Widget build(BuildContext context) {

      var controller = Provider.of<RequestController>(context);
    return    Scaffold(
      

appBar: mLightAppBar(context, translate(context, "replay") ,
      
      
      IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back 
      // color: Colors.white
      ,))

,









      ),
      body: SizedBox.expand(



        child: 
           
           
            Builder(
              builder: (context) {

                if (widget.fromNotifications!) {
   return                
Builder(builder: (_){


 if (controller.order!.status==Status.LOADING) {
            return Center(
            child: mProgress(context ,fromPage: true),
            );
          } 
          else if( controller.order!.status==Status.ERROR){
          return Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(controller.order!.message!),
          const SizedBox(height: 10,) ,
          IconButton(onPressed: (){
            controller.getRequest(context ,widget.orderId!);
          }, icon:  Icon(
            Icons.refresh ,color: Theme.of(context).primaryColor,
          ))
            ],
            ),
          );
          }
else {
var orderData = controller.order!.data;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                      children: [
                                15.height ,
                                Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10 , vertical: 20
                      ),
                      height: MediaQuery.of(context).size.height*.15,
                      width:  MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                        color: Colors.white , 
                                borderRadius: BorderRadius.circular(10),
                                
                         boxShadow: [
                          BoxShadow(
                      color: Colors.grey.withOpacity(.20),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                      offset: const Offset(
                        1.0, // Move to right 5  horizontally
                        2.0, // Move to bottom 5 Vertically
                      ),
                          )
                        ],
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                 Text(
                       currentLang(context)=="ar"?
                       
                      
                      
                      'معلومات الطلب:  ':"Request Information : ") ,
                                15.height , 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Row(mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                                    SizedBox(
                      width: 100,
                      child:   Text(
                      
                         currentLang(context)=="ar"?
                         "تاريخ الطلب: ":"Request Date: "
                      ),
                                    ) ,
                                    
                                    8.width,
                                    Text(getMaintenanceFormattedDate(
                      orderData!.createdAt!
                                    ))
                                    
                                    
                                    
                                    
                      ],
                                    )
                                    
                                    
                                    ,
                                    10.height,
                                    
                                    Row(
                                    mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                                    SizedBox(
                      width: 100,
                      child:   Text(
                      
                         currentLang(context)=="ar"?
                         "المهمة : ":"Task: "
                      ),
                                    ) ,
                                    8.width,
                                    
                                    Text(currentLang(context)=="ar"?
                     orderData.taskAr!
                                    
                                    : 
                     orderData.taskEn!
                                    )
                                    
                                    
                                    
                                    
                      ],
                                    )
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  ],
                                )
                                
                                
                                
                        ],
                      ),
                                )
                                 ,
                                
                                10.height,
                                
                                 BoxText.body(translate(context,"attachments")+": " )
                         
                         
                          , 
                        10.height ,
                        
                          orderData.files!.isEmpty
                           ?
                         Center(child: NoContent(
                        
                        
                          translate(context,"no_files")
                        ),):
                           
                            GridView.count(
                          shrinkWrap: true,
                          crossAxisCount:3,
                          childAspectRatio: 1,
                           children:
                        orderData.files ==null?
                            []:
                         orderData.files!.map((e) {
                        if (e.toString().contains("png")|| 
                        
                        e.toString().contains("jpeg")|| 
                        e.toString().contains("jpg") ) {
                          return Container(
                           child: 
                           
                           Image.network(
                               "https://goodfoodsa.co$e",
                          width: 300,
                          height: 300,
                        ),
                           
                          ).onTap((){
        OpenDocumentPage(needLoadfromUrl: false,url: e,);
      });
                        }else {
                           return Container(
                           child: Image.asset(
                           
                             "assets/icons/pdf.png"
                             ,
                          width: 300,
                          height: 300,
                           ),
                           ).onTap((){
        OpenDocumentPage(needLoadfromUrl: false,url: e,);
      });
                        }
                        
                        
                            }).toList()
                        
                        
                        //      List.generate(5, (index) {
                        
                        //  return Card(
                        //         clipBehavior: Clip.antiAlias,
                        //         child: Stack(
                        //           children: <Widget>[
                        //            Image.asset(
                        //               'assets/images/logo.png',
                        //               width: 300,
                        //               height: 300,
                        //             ),
                        
                        //             // Positioned(
                        //             //   right: 5,
                        //             //   top: 5,
                        //             //   child: InkWell(
                        //             //     child: const Icon(
                        //             //       Icons.remove_circle,
                        //             //       size: 20,
                        //             //       color: Colors.red,
                        //             //     ),
                        //             //     onTap: () {
                            
                        //             //     },
                        //             //   ),
                        //             // ),
                      
                        //           ],
                        //         ));
                        //     })
                           
                           ),
                          
                                
                                
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


   controller.imageFile ==null
   && controller.fileDoc ==null
   
   ?
  ImagePickerContainer(
    showFiles: true,
    onSelect: (file, isImage){

      if (isImage!) {
         controller.setImage(file!.path);
      }else {
        controller.setFile(file!.path);
      }
 
    },
  ): 
  Center(

    child:
    

    controller.imageFile !=null?
    
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
                 child: Image.file(
                 controller.imageFile!,
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
                      controller.removeImage();
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
                      controller.removeFile();
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
                              
                  if (controller.imageFile!=null) {
                     controller.addReplyument(context,
                                  
                                   widget.order!.id.toString(), commentController.text ,
                                   getBase64(controller.imagePath!),
                                   getFileExtenstion(controller.imagePath!)
                                   
                                   );
                  }
                  
                  if (controller.fileDoc!=null) {
                     controller.addReplyument(context,
                                  
                                   widget.order!.id.toString(), commentController.text ,
                                   getBase64(controller.filePath!),
                                   getFileExtenstion(controller.filePath!)
                                   
                                   );
                  }
                  else {
                    showToast(currentLang(context)=="ar"?"الرجاء اختيار  ملف":"Please upload file", true);
                    
                                //The form has some validation errors.
                                //Do Something...
                               }
                            }},
                            child:  
                            
                            controller.addReply!.status==Status.LOADING?
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
                    ),
                  ),
                );
              
}
});



                }
                else {
                  return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                      children: [
                                15.height ,
                                Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10 , vertical: 20
                      ),
                      height: MediaQuery.of(context).size.height*.15,
                      width:  MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                        color: Colors.white , 
                                borderRadius: BorderRadius.circular(10),
                                
                         boxShadow: [
                          BoxShadow(
                      color: Colors.grey.withOpacity(.20),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                      offset: const Offset(
                        1.0, // Move to right 5  horizontally
                        2.0, // Move to bottom 5 Vertically
                      ),
                          )
                        ],
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                 Text(
                       currentLang(context)=="ar"?
                       
                      
                      
                      'معلومات الطلب:  ':"Request Information : ") ,
                                15.height , 
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Row(mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                                    SizedBox(
                      width: 100,
                      child:   Text(
                      
                         currentLang(context)=="ar"?
                         "تاريخ الطلب: ":"Request Date: "
                      ),
                                    ) ,
                                    
                                    8.width,
                                    Text(getMaintenanceFormattedDate(
                      widget.order!.createdAt!
                                    ))
                                    
                                    
                                    
                                    
                      ],
                                    )
                                    
                                    
                                    ,
                                    10.height,
                                    
                                    Row(
                                    mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                                    SizedBox(
                      width: 100,
                      child:   Text(
                      
                         currentLang(context)=="ar"?
                         "المهمة : ":"Task: "
                      ),
                                    ) ,
                                    8.width,
                                    
                                    Text(currentLang(context)=="ar"?
                      widget.order!.taskAr!
                                    
                                    : 
                      widget.order!.taskEn!
                                    )
                                    
                                    
                                    
                                    
                      ],
                                    )
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                  ],
                                )
                                
                                
                                
                        ],
                      ),
                                )
                                 ,
                                
                                10.height,
                                
                                 BoxText.body(translate(context,"attachments")+": " )
                         
                         
                          , 
                        10.height ,
                        
                           widget.order!.files!.isEmpty
                           ?
                         Center(child: NoContent(
                        
                        
                          translate(context,"no_files")
                        ),):
                           
                            GridView.count(
                          shrinkWrap: true,
                          crossAxisCount:3,
                          childAspectRatio: 1,
                           children:
                           widget.order!.files ==null?
                            []:
                           widget.order!.files!.map((e) {
                        if (e.toString().contains("png")|| 
                        
                        e.toString().contains("jpeg")|| 
                        e.toString().contains("jpg") ) {
                          return Container(
                           child: 
                           
                           Image.network(
                               "https://goodfoodsa.co$e",
                          width: 300,
                          height: 300,
                        ),
                           
                          ).onTap(()async{
                              await DocumentService().initPlatformState(e);
                          });
                        }else {
                           return Container(
                           child: Image.asset(
                           getFileIocn(e)
                            //  "assets/icons/pdf.png"
                             ,
                          width: 300,
                          height: 300,
                           ),
                           ).onTap(
                             
                             ()async{
                                 await DocumentService().initPlatformState(e);
                             }
                           );
                        }
                        
                        
                            }).toList()
                        
                        
                        //      List.generate(5, (index) {
                        
                        //  return Card(
                        //         clipBehavior: Clip.antiAlias,
                        //         child: Stack(
                        //           children: <Widget>[
                        //            Image.asset(
                        //               'assets/images/logo.png',
                        //               width: 300,
                        //               height: 300,
                        //             ),
                        
                        //             // Positioned(
                        //             //   right: 5,
                        //             //   top: 5,
                        //             //   child: InkWell(
                        //             //     child: const Icon(
                        //             //       Icons.remove_circle,
                        //             //       size: 20,
                        //             //       color: Colors.red,
                        //             //     ),
                        //             //     onTap: () {
                            
                        //             //     },
                        //             //   ),
                        //             // ),
                      
                        //           ],
                        //         ));
                        //     })
                           
                           ),
                          
                                
                                
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


   controller.imageFile ==null
   && controller.fileDoc ==null
   
   ?
  ImagePickerContainer(
    showFiles: true,
    onSelect: (file, isImage){

      if (isImage!) {
         controller.setImage(file!.path);
      }else {
        controller.setFile(file!.path);
      }
 
    },
  ): 
  Center(

    child:
    

    controller.imageFile !=null?
    
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
                 child: Image.file(
                 controller.imageFile!,
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
                      controller.removeImage();
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
                      controller.removeFile();
                    },
                  ),
                ),
              ],
            ))
     
     
     
     
     ,
  ),
  
                      // const Spacer() ,
                                

                                10.height,
                                      
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                                minimumSize: const Size.fromHeight(50)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                               
                              
                               
                             
                  if (controller.imageFile!=null) {
                     controller.addReplyument(context,
                                  
                                   widget.order!.id.toString(), commentController.text ,
                                   getBase64(controller.imagePath!),
                                   getFileExtenstion(controller.imagePath!)
                                   
                                   );
                  }
                   if (controller.fileDoc!=null) {
                     controller.addReplyument(context,
                                  
                                   widget.order!.id.toString(), commentController.text ,
                                   getBase64(controller.filePath!),
                                   getFileExtenstion(controller.filePath!)
                                   
                                   );
                  }
                  
                  
                  
                  
                  
                  
                  
                  
                  else {
                    showToast(currentLang(context)=="ar"?"الرجاء اختيار ملف":"Please upload file", true);
                    
                  }
                                 //submit
                  
                                 
                               
                                //The form has some validation errors.
                                //Do Something...
                              }
                            },
                            child:  
                            
                            controller.addReply!.status==Status.LOADING?
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
                    ),
                  ),
                );
                }
              
              
              
              }
            ),
      
      
      
      ),
      
    );
  }
}