import 'package:flutter/material.dart';
import 'package:goodfoods/app/help/controller/help_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/image_picker_container.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({ Key? key }) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  TextEditingController commentController = 
TextEditingController();
var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

        var controller = Provider.of<HelpController>(context);

    return  Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
       appBar: 
        
        AppBar(
          elevation: 1,
 backgroundColor: Colors.white,
          titleSpacing: 0,
          
          leading: 
    
    
          IconButton(onPressed: (){
    Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back , color: Colors.black,)),
          title:
           Text(

             currentLang(context)=="ar"?
            'طلب مساعدة':"Help request"
          )
          
        )
      ,

      body: SizedBox.expand(



        child: 

Form(
  key: formKey,
  
  child: 

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
Text(currentLang(context)=="ar"?"نوع المشكلة: ":"Issue Type: ",  

style: const TextStyle(fontWeight: FontWeight.bold),
),
5.height,

PopupMenuButton(
          onSelected: (value) {
            // your logic
            controller.setSelectedIssue(value);
          },
          itemBuilder: (BuildContext bc) {
            return 
            controller.issueTypes.map((e) =>   PopupMenuItem(
                value: e['value'],
                child:Text(currentLang(context)=="ar"?e['ar']:e['en']),
              )).toList();
          },
  child:   Container(
     height: 30,
     padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: Colors.grey ,width: .5
      )
  
    ),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        Text(
          controller.getSelectedIssueObject()!=null?
          currentLang(context)=="ar"?controller.getSelectedIssueObject()!['ar']: 
          controller.getSelectedIssueObject()!['en']
          // maintenanceController.selectedModel!
          :
           currentLang(context)=="ar"?'اختار':'select'
          
          ,
          
          // 'Status'
          
          ),
        const Icon(Icons.keyboard_arrow_down_outlined )
      ],
    ),
  
  )
)

                                    ],
                                  ),
                    
                    10.height,
                    
                    
                    
                        BoxInputField(
  
                          validator: (str){
                            if (str!.isEmpty) {
                              return 
                                currentLang(context)=="ar"?
                                 "الرجاء وصف المشكلة"   :"Please describe the issue"; 
                            }
                            return null;
                          },
                          isInputAea: true, 
                          
                          controller: 
                        commentController
                         , 
                    
                         placeholder: 
                         
                         
                          currentLang(context)=="ar"?
                                 " وصف المشكلة"   :" describe the issue"
                         
                         
                         
                         ,
                        ),
                                  
                                  10.height,
  
  
     controller.imageFile ==null
  
     
     ?
    ImagePickerContainer(
      showFiles: false,
      onSelect: (file, isImage){
  
      
           controller.setImage(file!.path);
       
   
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
                  getFileIocn(controller.imagePath!),
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
       
       
       
       
       ,
    ),
    
                        const Spacer() ,
                                  
  
                                  // 10.height,
       
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                  minimumSize: const Size.fromHeight(50)),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                 
                                
                                 
                               
                    if (controller.imageFile!=null) {
                     controller.sendHelpRequest(context).then((value){ 

Navigator.pop(context);

                     },
                     
                      onError: (e) {

                      }
                     
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
                              
                              controller.helpRequest.status==Status.LOADING?
                              const Center(child: CircularProgressIndicator(
                                color: Colors.white,
                              ),)
                              :
                              Text(
                                  currentLang(context)=="ar"?
                                  "ارسال":
                                
                                'SEND' , 

                                style: const TextStyle(                                color: Colors.white,
),
                          ))
                       
                                  ],
                                  
  ),
)

)

      )
    );
  }
}