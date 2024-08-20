import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/select_maintainance_emp.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/presentation/widgets/image_picker_container.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

enum  ModelType{
  CAR("Car"),SKIN("Skin") ,BRANCH("Branch")
  ,ASSET("Asset"),OTHERASSET("OtherAsset") ;
  
   const ModelType(this.name);
  final String name;
}

class MaintenanceOrder extends StatefulWidget {
  final String? modelType;
  final String? modelId;
   final String? maintain_type;
    final String? category;
      final String? walkway;
  const MaintenanceOrder({super.key, this.modelType, this.modelId, this.maintain_type, this.category, this.walkway});

  @override
  State<MaintenanceOrder> createState() => _MaintenanceOrderState();
}

class _MaintenanceOrderState extends State<MaintenanceOrder> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _cityController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _streetAddressController.dispose();
    _cityController.dispose();
    super.dispose();
  }
var branches =[
  "القصيم"  ,"الرياض"
];

var  employee =[
  "السماني"  ,"حسام"
];

var  images =[
  "السماني"  ,"حسام"
];
  @override
  Widget build(BuildContext context) {
    var maintenanceController = Provider.of<MaintenanceController>(context);

    return
    
     Scaffold(
        appBar:  AppBar(
        elevation: 1,

      
      
        backgroundColor: Colors.white,
        titleSpacing: 0,
        
       
        title:  Text(
          
          currentLang(context)=="ar"?
          "طلب صيانة جديد":
          "New Order"),
      ),
       
       
       
        body: SizedBox.expand(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
        
        
        // BoxDropDownField(
        //   placeholder: 'Branch',
        
        //   items: branches.map((e) => 
          
        //   DropdownMenuItem(value: e,child: Text(e) ,)
        //   ).toList(),
        
        // ),
        // 8.height,
        // BoxDropDownField(
        //   placeholder: 'employee',
        
        //   items: employee.map((e) => 
          
        //   DropdownMenuItem(value: e,child: Text(e) ,)
        //   ).toList(),
        
        // ),
        // 8.height,
        BoxInputField(
        controller: _nameController,
        isInputAea: true,
        
        placeholder:currentLang(context) =="ar"?"المهمة":'Task',
        validator: (str){
          if (str!.isEmpty) {
            return currentLang(context) =="ar"?"هذا الحقل مطلوب":"This field is required";
          }
          return null;
        },
        )
        
        ,15.height,
        
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text(currentLang(context)=="ar"?"اختار حالة الصيانة: ":"Select Order Status: ")
,
6.height ,

Column(
  
  children: [
//urgedn
  
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
Checkbox( 
   side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
  ),
  activeColor: Theme.of(context).primaryColor,
  // fillColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
  value:maintenanceController.selectedMaintenanceType==0 ,
  
  onChanged: (value){
if (value!) {
  maintenanceController.setSelectedMaintenanceType(0);
}
},),
const SizedBox(width: 8,),

Text(currentLang(context)=="ar"?
               "صيانة عادية":
                "Normal"
               
               
               ),

  ],
),









Row(
  mainAxisSize: MainAxisSize.min,
  children: [
Checkbox( 
   side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
  ),
  activeColor: Theme.of(context).primaryColor,
  // fillColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
  value:maintenanceController.selectedMaintenanceType==1 ,
  
  onChanged: (value){
if (value!) {
  maintenanceController.setSelectedMaintenanceType(1);
}
},),
const SizedBox(width: 8,),

Text(currentLang(context)=="ar"?
               "صيانة فورية":
                "Urgent"
               
               
               ),

  ],
),







],)


  ],
),


        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[

        //      Text(
        //       currentLang(context)=="ar"?
              
        //       ' : صيانة فورية':"Urgent Maintenance: ", style: const TextStyle(
        //       color: Colors.black,
        //       fontSize: 20.0
        //     ),),
        //      const SizedBox(width: 8.0,),
        //     CustomSwitch(
        //       // activeColor: Colors.pinkAccent,
        //       value: maintenanceController.isEmediate,
        //       onChanged: (value) {
        //        maintenanceController.setEmdeiate(value);
        //       },
        //     ),
        //     const SizedBox(width: 8.0,),
            
        //   ],
        // ),
       
       
        // ImagePickerContainer(
        //   onSelect: (file){
        // maintenanceController.addFile(file!);
        //   },
        // ),
        // maintenanceController.addFile(file!);
        8.height,
          maintenanceController.newOrderFiles.isEmpty?

          Center(
            child:   ImagePickerContainer(
                         showFiles: true, 
                        
                         onSelect: (file, isImage){
                          //  if (isImage!) {
                              maintenanceController.addFile(file!);
                          //  }
                              // maintenanceController.addFile(file!);
                       },) ,
          ):
        SizedBox(
           height: MediaQuery.of(context).size.height/2,
          child: GridView.builder(
                 itemCount:  
                 
                 maintenanceController.newOrderFiles.length+1
                 ,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                 itemBuilder: (BuildContext context, int index) {
                
                
                   if (index ==    maintenanceController.newOrderFiles.length) {
                     return Center(
                       child:
                       
                       ImagePickerContainer(
                         showFiles: true, 
                         showRounded: true,
                         onSelect: (file, isImage){
                              maintenanceController.addFile(file!);
                       },)
                      //   AddUserButton(
                               
                      //          onSelect: (file){
                      //          maintenanceController.addFile(file!);
                      //            },
                               
                      //  ),
                     );
                   }
          var e =maintenanceController.newOrderFiles[index];
              return          Card(
            clipBehavior: Clip.antiAlias,
            
            child: Stack(
              children: <Widget>[
                (
                  
                  getFileExtenstion(e.path!)==".png"
                
||                  getFileExtenstion(e.path!)==".jpg"||
                                  getFileExtenstion(e.path!)==".jpeg"
                                  ||
  getFileExtenstion(e.path!)==".PNG"
  ||
  getFileExtenstion(e.path!)==".JPEG"
  ||
  getFileExtenstion(e.path!)==".JPG"
                )?
               Image.file(
                 File(e.path!),
                  // 'assets/images/logo.png',
                  width: 100,
                  height: 100,
                )
                :
                  Image.asset(
                getFileIocn(e.path!),
                  // 'assets/images/logo.png',
                  width: 100,
                  height: 100,
                )
                
                ,
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: const Icon(
                      Icons.remove_circle,
                      size: 30,
                      color: Colors.red,
                    ),
                    onTap: () {
                      // if (maintenanceController.newOrderFiles.isEmpty) {
                      //   showToast(currentLang(context)=="ar"?"الرجاء ارف", isError)
                      // }
                      maintenanceController.removeFile(e.path!);
                      // setState(() {
                      //   images.replaceRange(index, index + 1, ['Add Image']);
                      // });
                    },
                  ),
                ),
              ],
            ));
                 }),
        )
        
        
        // Visibility(
        //   visible: maintenanceController.newOrderFiles.isNotEmpty,
        //   child:  
          
        //    SizedBox(
        //     height: MediaQuery.of(context).size.height/3,
        //     child: GridView.count(
        //   shrinkWrap: true,
        //   crossAxisCount: 3,
        //   childAspectRatio: 1,
        //     children:
        //     maintenanceController.newOrderFiles.map((e) 
        //     =>
        
        //   Card(
        //         clipBehavior: Clip.antiAlias,
          
        //         child: Stack(
        //           children: <Widget>[
        //            Image.asset(
        //              e.icon!,
        //               // 'assets/images/logo.png',
        //               width: 100,
        //               height: 100,
        //             ),
        //             Positioned(
        //               right: 5,
        //               top: 5,
        //               child: InkWell(
        //                 child: const Icon(
        //                   Icons.remove_circle,
        //                   size: 30,
        //                   color: Colors.red,
        //                 ),
        //                 onTap: () {
        //                   maintenanceController.removeFile(e.path!);
        //                   // setState(() {
        //                   //   images.replaceRange(index, index + 1, ['Add Image']);
        //                   // });
        //                 },
        //               ),
        //             ),
        //           ],
        //         ))
        
        //     ).toList()
            
            
             
            
        //     )
          
          
        //     ),
          
          
          
        //   ),
        
        
        
        
        
        
        
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: 

                
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                         
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   //     content: Text(
                        //   //         'Hello ${_nameController.text}\nYour details have been submitted and an email sent to ${_emailController.text}.')));
                        // } else {
                          //The form has some validation errors.
                          //Do Something...
if (_formKey.currentState!.validate()) {
                          if (maintenanceController.newOrderFiles.isEmpty ) {

showToast(currentLang(context)=="ar"? "الرجاء اختيار ملف":"Please select file", true);


                            
                          }else {



maintenanceController.setModelId(widget.modelId!);
                maintenanceController.setModelType(widget.modelType!);
                maintenanceController.setTask(_nameController.text.trim());
                
                
                
                           SelectMaintainenaceEmpolyee(
                            maintain_type: widget.maintain_type,
category: widget.category,
walkway: widget.walkway,
                          ).launch(context);
                          }
                



                        }
                      },
                      child:  Text(
                        
                        
                        currentLang(context)=="ar"?
                        "التالي":
                        'Next')),
                )
            
            ,
        
        );
  }

  InputDecoration inputDecoration({
    InputBorder? enabledBorder,
    InputBorder? border,
    Color? fillColor,
    bool? filled,
    Widget? prefixIcon,
    String? hintText,
    String? labelText,
  }) =>
      InputDecoration(
          enabledBorder: enabledBorder ??
              const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)),
          border: border ?? const OutlineInputBorder(borderSide: BorderSide()),
          fillColor: fillColor ?? Colors.white,
          filled: filled ?? true,
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText);
}