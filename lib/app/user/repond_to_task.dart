import 'package:flutter/material.dart';
import 'package:goodfoods/app/report/controllers/report_controller.dart';
import 'package:goodfoods/app/report/models/report_details_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/box_dropdown_field.dart';
import 'package:goodfoods/core/presentation/widgets/image_picker_container.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class RespondToTask extends StatefulWidget {
  Tasks? tasks;
  final String? regionId;
  final String? branchId;
  final Brand?  brand;
   RespondToTask({ Key? key , this.tasks, this.branchId, this.regionId, this.brand }) : super(key: key);

  @override
  _RespondToTaskState createState() => _RespondToTaskState();
}

class _RespondToTaskState extends State<RespondToTask> {
   bool value = false;
   var  employee =[
  "السماني"  ,"حسام"
];

var  images =[
  "السماني"  ,"حسام"
];
  @override
  Widget build(BuildContext context) {
     var controller = Provider.of<ReportController>(context);
     var locale = AppLocalizations.of(context);
    return Scaffold(
            
        appBar: AppBar(
        elevation: 1,
        
        
        backgroundColor: Colors.white,
        titleSpacing: 0,
       
        title:  Text(
             locale!.locale.languageCode=="ar"?
          "مهمة #${widget.tasks!.id}":
  "Task #${widget.tasks!.id}"
        )
      ),
body: Padding(padding: 

const EdgeInsets.symmetric(horizontal: 15 ,vertical: 10) ,

child: Form(
  key: controller.formKey,
  child:   SingleChildScrollView(
  
    child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  
  // Container(
  //   padding: const EdgeInsets.all(15),
  //    decoration:    BoxDecoration(
  //     color: Colors.white,
  //     boxShadow: [
  //       BoxShadow(
  //         color: Colors.grey.withOpacity(.16),
  //         blurRadius: 5.0, // soften the shadow
  //         spreadRadius: 3.0, //extend the shadow
  //         offset: const Offset(
  //           3.0, // Move to right 5  horizontally
  //           3.0, // Move to bottom 5 Vertically
  //         ),
  //       )
  //     ],
  // ) ,
    
    
  //   child:  Row(
  //                       children: <Widget>[
  //                          Checkbox(
  //                            activeColor: Theme.of(context).primaryColor ,
  //                           value: value,
  //                           onChanged: ( value) {
  //                             setState(() {
  //                               this.value = value!;
  //                             });
  //                           },
  //                                                ), //Checkbox
  //                         const SizedBox(
  //                           width: 10,
  //                         ), //SizedBox
  //                         const Text(
  //                           'Task is Done ',
  //                           style: TextStyle(fontSize: 17.0),
  //                         ), //Text
  //                         const SizedBox(width: 10), //SizedBox
  //                         /** Checkbox Widget **/
                         
  //                       ], //<Widget>[]
  //                     ), )
  // ,
  BoxDropDownField<Branchs>(
    placeholder:
     locale.locale.languageCode=="ar"?
     "اختار الفرع":"select branch"
    
     ,
  items: widget.brand!.branchs!.map((e) => 
  DropdownMenuItem<Branchs>(value: e,child: Text(
  
   locale.locale.languageCode=="ar"?
   e.nameAr!:e.nameEn! ,
  
   style: const TextStyle(
     color: Colors.black
   ),
  
  ),
  
   )
  
  ).toList(),
  onChange: (branch){
  log(branch!.id.toString());
  controller.setBranch(branch);
 
  },
  ),
  10.height,
 
  BoxInputField(
  controller: controller.nameController,
  isInputAea: true,
  placeholder:
  
     locale.locale.languageCode=="ar"?
     "اكتب تعليق":
  
   'write a comment',

   validator: (str){
     if (str!.isEmpty) {
      return   locale.locale.languageCode=="ar"? 
      "الرجاء اضافة تعليق":"Please add comment";
     }else {
       return null;
     }
   },
  )
  
  ,10.height,
   controller.imageFile ==null?
  ImagePickerContainer(
    showFiles: true,
    onSelect: (file , isImage){
      // if (isImage!) {
          controller.setImage(file!.path);
      // }else {
      //   controller.setImage(data)
      // }

    },
  ): 
  Center(

    child:
    
    
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
                 isImage(controller.imageFile!.path)?
               
                 
                  Image.file(
                 controller.imageFile!,
                    width: 200,
                    height: 200,
                    
                  ): 
                  Image.asset(
                  getFileIocn(controller.imageFile!.path),
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
                      controller.removeImage();
                    },
                  ),
                ),
              ],
            ))
     ,
  )
  
  // ,
  // 10.height,
  
  
   
  //   Visibility(
  //     child: 

  //     Card(
  //           clipBehavior: Clip.antiAlias,
  //           child: Stack(
  //             children: <Widget>[
  //              Image.asset(
  //                 'assets/images/logo.png',
  //                 width: 200,
  //                 height: 200,
  //               ),
  //               Positioned(
  //                 right: 5,
  //                 top: 5,
  //                 child: InkWell(
  //                   child: const Icon(
  //                     Icons.remove_circle,
  //                     size: 20,
  //                     color: Colors.red,
  //                   ),
  //                   onTap: () {
                      
  //                   },
  //                 ),
  //               ),
  //             ],
  //           )),
    
    
    
  //   )
  
  
  // ,
  ,
  25.height,
  // const Spacer(),
  
                  
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                         
                         if (controller.branch==null) {
                           showToast(
                           locale.locale.languageCode=="ar"?
                           "الرجاء اختيار فرع"   :"Please select branch" 
                             , true);
                         }
                         if (controller.imageFile==null) {
                           showToast(
                           locale.locale.languageCode=="ar"?
                           "الرجاء اختيار صورة"   :"Please add image" 
                             , true);
                         }
                         
                         else {

                           //submit

                            controller.respondToTasks(context,
                             controller.base64Image, 
                             controller.nameController.text.trim(),
                              widget.tasks , 
                              
                           controller. branch!.id.toString() ,
                              controller.branch!.cityId.toString() ,
                              getFileExtenstion(controller.imageFile!.path)
                              
                              );
                         }
                          //The form has some validation errors.
                          //Do Something...
                        }
                      },
                      child:  
                      
                      controller.respondToTask!.status==Status.LOADING?
                      const Center(child: CircularProgressIndicator(
                        
                      ),)
                      :
                      Text(
                          locale.locale.languageCode=="ar"?
                          "ارسال":
                        
                        'SEND'))
              
  ],
  
  
    ),
  ),
),
),

    );
  }
}