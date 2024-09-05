import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/box_text.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/image_picker_container.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:provider/provider.dart';

class CloseOrderPage extends StatefulWidget {
  final String? orderId;
  const CloseOrderPage({ Key? key, this.orderId }) : super(key: key);

  @override
  _CloseOrderPageState createState() => _CloseOrderPageState();
}

class _CloseOrderPageState extends State<CloseOrderPage> {
  
  var formKey = GlobalKey<FormState>();
var commentInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        var controller = Provider.of<MaintenanceController>(context);

    return Scaffold(
         resizeToAvoidBottomInset: false,
     appBar:   AppBar(
       elevation: 1,
title:    BoxText.subheading(
  currentLang(context)=="ar"?'اغلاق':'Close'"  "'${currentLang(context)=="ar"?"طلب":"Order"} #${widget.orderId}'

          )

     )
       ,


body:  SizedBox.expand(

child: Padding(padding: const EdgeInsets.all(10)
,

child: Form(
  key: formKey,
  child:    Column(
  
    children: [
  
  
  // BoxInputField(
    
  //   isInputAea: true, 

  //   placeholder: currentLang(context)=="ar"?"اكتب تعليق ":"Write a comment",
  //   controller: commentInputController,
    
  //   validator: (str){

  //     if (str!.isEmpty) {
  //       return currentLang(context)=="ar"?"هذا الحقل مطلوب":"this field is required";

  //     }else {
  //       return null;
  //     }
  //   },
    
    
  //   ),
  
  // 5.height,
  
  
   controller.closeOrderFiles.isEmpty
   
   ?
  ImagePickerContainer(
    showFiles: true,
    onSelect: (file, isImage){

      // if (isImage!) {
      //    controller.setImage(file!.path);
      // }else {
      //   controller.setFile(file!.path);
      // }
 controller.addCloseOrderFile(file!.path);
    },
  ): 
  Expanded(

    child:
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  ),
  itemCount: controller.closeOrderFiles.length+1,
  itemBuilder: (BuildContext context, int index) {

if (index==controller.closeOrderFiles.length) {
  return ImagePickerContainer(
    showFiles: true,
    showRounded: true,
    onSelect: (file, isImage){

      // if (isImage!) {
      //    controller.setImage(file!.path);
      // }else {
      //   controller.setFile(file!.path);
      // }
 controller.addCloseOrderFile(file!.path);
    },
  );
}
else {
  var file = controller.closeOrderFiles[index];
    return 


    
file.extension==".png"||  file.extension==".jpg"|| 
file.extension==".jpeg"

||  file.extension==".JPG"|| file.extension==".PNG"
||  file.extension==".JPEG"

?
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
                File(file.path!),
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
                      controller.removeCloseOrderFile(file.path!);
                    },
                  ),
                ),
              ],
            )):



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
                getFileIocn(file.path!),
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
                      controller.removeCloseOrderFile(file.path!);
                    },
                  ),
                ),
              ],
            ));

}
  },
),


//     GridView.count(crossAxisCount: 3  ,  
    
    
//     children: 
//       controller.closeOrderFiles.map((e) {

// return 


// e.extension=="png"||  e.extension=="jpg"|| 
// e.extension=="jpeg"

// ||  e.extension=="JPG"|| e.extension=="PNG"
// ||  e.extension=="JPEG"
// ||  e.extension=="gpg"
// ?
//       Container(
//          width: 220,
//                   height: 220,
//       padding: EdgeInsets.zero,
//             // clipBehavior: Clip.antiAlias,
//             child: Stack(
//               children: <Widget>[
//                SizedBox(
//                   width: 200,
//                     height: 200,
//                  child: Image.file(
//                 File(e.path!),
//                     width: 200,
//                     height: 200,
                    
//                   ),
//                ),
//                 Positioned(
//                   right: 10,
//                   top: 0,
//                   child: InkWell(
//                     child: const Icon(
//                       Icons.remove_circle,
//                       size: 20,
//                       color: Colors.red,
//                     ),
//                     onTap: () {
//                       controller.removeCloseOrderFile(e.hasId!);
//                     },
//                   ),
//                 ),
//               ],
//             )):



//    Container(
//          width: 220,
//                   height: 220,
//       padding: EdgeInsets.zero,
//             // clipBehavior: Clip.antiAlias,
//             child: Stack(
//               children: <Widget>[
//                SizedBox(
//                   width: 200,
//                     height: 200,
//                  child: Image.asset(
//                 getFileIocn(e.path!),
//                     width: 200,
//                     height: 200,
                    
//                   ),
//                ),
//                 Positioned(
//                   right: 10,
//                   top: 0,
//                   child: InkWell(
//                     child: const Icon(
//                       Icons.remove_circle,
//                       size: 20,
//                       color: Colors.red,
//                     ),
//                     onTap: () {
//                       controller.removeCloseOrderFile(e.hasId!);
//                     },
//                   ),
//                 ),
//               ],
//             ));
  

//       }).toList()
//     )





    // controller.closeOrderFiles.isNotEmpty?
    
    //   Container(
    //      width: 220,
    //               height: 220,
    //   padding: EdgeInsets.zero,
    //         // clipBehavior: Clip.antiAlias,
    //         child: Stack(
    //           children: <Widget>[
    //            SizedBox(
    //               width: 200,
    //                 height: 200,
    //              child: Image.file(
    //              controller.imageFile!,
    //                 width: 200,
    //                 height: 200,
                    
    //               ),
    //            ),
    //             Positioned(
    //               right: 10,
    //               top: 0,
    //               child: InkWell(
    //                 child: const Icon(
    //                   Icons.remove_circle,
    //                   size: 20,
    //                   color: Colors.red,
    //                 ),
    //                 onTap: () {
    //                   controller.removeImage();
    //                 },
    //               ),
    //             ),
    //           ],
    //         ))
     
     
     
     
    //  :

    //   Container(
    //      width: 220,
    //               height: 220,
    //   padding: EdgeInsets.zero,
    //         // clipBehavior: Clip.antiAlias,
    //         child: Stack(
    //           children: <Widget>[
    //            SizedBox(
    //               width: 200,
    //                 height: 200,
    //              child: Image.asset(
    //             getFileIocn(controller.filePath!),
    //                 width: 200,
    //                 height: 200,
                    
    //               ),
    //            ),
    //             Positioned(
    //               right: 10,
    //               top: 0,
    //               child: InkWell(
    //                 child: const Icon(
    //                   Icons.remove_circle,
    //                   size: 20,
    //                   color: Colors.red,
    //                 ),
    //                 onTap: () {
    //                   controller.clearFile();
    //                 },
    //               ),
    //             ),
    //           ],
    //         ))
     
     
     
     
     
  ),
  
  
  const Spacer(),
  
  
   BoxButton(
     onTap: (){


       if (formKey.currentState!.validate()) {
        //  controller.closingOrderResponseStatus(context, widget.orderId!, commentInputController.text.trim(), 2.toString())
         
        //  .then((value) {

        //    Navigator.pop(context);
        //  })
        //  ;
         
        

         controller.changeOrderStatus(context, widget.orderId.toString(),
          1.toString(),
        controller.closeOrderFiles
          
          
          
          
          ).then((value) {
                context.read<MaintenanceController>().getStatusData(context);

Navigator.pop(context);

         });
                }
     },
     
     busy: controller.changeStatusState!.status==Status.LOADING,
     
     title: 
  
  currentLang(context)=="ar"?"تأكيد":
  'Confirm')
  
  
  
  

  
  
    ],
  ),
),
),

),

    );
  }
}