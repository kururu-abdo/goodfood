import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/image_picker_container.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/services/document_service.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

enum  ModelType{
  CAR("Car"),SKIN("Skin") ,BRANCH("Branch")
  ,ASSET("Asset"),OTHERASSET("OtherAsset") ;
  
   const ModelType(this.name);
  final String name;
}

class EditMaintenanceOrder extends StatefulWidget {
  final String ? task;
final String? orderId;
  final List? images;
  final bool? urgent;
  // final String? modelType;
  final String? modelId;
   final String? maintain_type;
    final String? category;
  //     final String? walkway;
  const EditMaintenanceOrder({super.key, this.task, this.images, this.urgent, this.modelId, this.orderId, this.maintain_type, this.category, 
  });

  @override
  State<EditMaintenanceOrder> createState() => _MaintenanceOrderState();
}

class _MaintenanceOrderState extends State<EditMaintenanceOrder> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _cityController = TextEditingController();


  int maintenanceType=0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _streetAddressController.dispose();
    _cityController.dispose();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    detailsProvider.clearEditFiles();

    });
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
late MaintenanceController detailsProvider;
@override
void initState() {
  super.initState();
 detailsProvider= Provider.of<MaintenanceController>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {

  // if (widget.isFromNotificaiton!) {
    getOrderData();

  });
}
List<String> oldFiles=[];
getOrderData(){
context.read<MaintenanceController>().getOrderDetailsForEdit(

      true, widget.orderId!, 
      
      isEdit: true, 
      onData: (data, hasData){
if (hasData) {
  

  _nameController.text = data!.task.toString();
  for (var file in data.file!) {
    oldFiles.add(file.toString());
  }
maintenanceType= data.immedatly!;
  setState(() {
    
  });
}


      }
      );
}


changeType(int type){
  maintenanceType=type;
  setState(() {
    
  });
}
remooveFromFiles(String file){
  oldFiles.remove(file);
  setState(() {
    
  });
}



  @override
  Widget build(BuildContext context) {
    var maintenanceController = Provider.of<MaintenanceController>(context);
    var translation = AppLocalizations.of(context);

    return
    
     Scaffold(




      // floatingActionButton:  FloatingActionButton(
      //   backgroundColor: Colors.transparent,
      //   onPressed: (){},
      //   child: ImagePickerContainer(
      //     isEdit: false,
      //                                showFiles: true, 
      //                                showRounded: true,
      //                                onSelect: (file, isImage){
      //                                     maintenanceController.addEdit(file!);
      //                              },),
      // ),
        appBar:  AppBar(
        elevation: 1,

      
      
        backgroundColor: Colors.white,
        titleSpacing: 0,
        
       
        title:  Text(
          
          currentLang(context)=="ar"?
          "تعديل طلب #${widget.orderId}":
          "Edit Order #${widget.orderId}"),
      ),
       
       
       
        body: SizedBox.expand(
          child: 
          
          
          
          Builder(
            builder: (context) {
          
          
          
          
          
          if (maintenanceController.ordeEditMapper!.status==Status.LOADING) {
             return Center(
                  child: mProgress(context ,fromPage: true),
            );
          }
          else if(maintenanceController.ordeEditMapper!.status==Status.ERROR) {
            return Center(
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(maintenanceController.ordeEditMapper!.message.toString()),

                IconButton(onPressed: (){
                  getOrderData();
                  // context.read<MaintenanceController>().getOrderDetails(false, widget.orderId!);
                }, icon:  Icon(
                  Icons.refresh ,color: Theme.of(context).primaryColor,
                )),
              ],
            ),
          );
          }
          
          
          
          else {
          
            var userOrder = maintenanceController.ordeEditMapper!.data;
          
          return SingleChildScrollView(
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
                 side: WidgetStateBorderSide.resolveWith(
                    (states) => BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                ),
                activeColor: Theme.of(context).primaryColor,
                // fillColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                value: maintenanceType==0 ,
                
                onChanged: (value){
              if (value!) {
               changeType(0);
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
                 side: WidgetStateBorderSide.resolveWith(
                    (states) => BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
                ),
                activeColor: Theme.of(context).primaryColor,
                // fillColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                value:maintenanceType==1 ,
                
                onChanged: (value){
              if (value!) {
                changeType (1);
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
              
              
                      8.height,
          
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
          
             Text(currentLang(context)=="ar"?"ملفات الطلب: ":"Order files:"),
             const SizedBox(height: 5,),
              SizedBox(
               height:                
                    300 * (oldFiles.length/3)
              ,
                child:
                  oldFiles.isEmpty?
                
          
          Center(
           child:   ImagePickerContainer(
                        showFiles: true, 
                       
                        onSelect: (file, isImage){
                         //  if (isImage!) {
                             maintenanceController.addEdit(file!);
                         //  }
                             // maintenanceController.addFile(file!);
                      },) ,
                        )
                :
                
                 GridView.builder(
                 shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
                      itemCount:  
                      oldFiles.length +1
                      ,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                      if (index ==    oldFiles.length) {
                          return Center(
                            child:
                            
                            ImagePickerContainer(
                              showFiles: true, 
                              showRounded: true,
                              onSelect: (file, isImage){
                                   maintenanceController.addEdit(file!);
                            },)
                           //   AddUserButton(
                                    
                           //          onSelect: (file){
                           //          maintenanceController.addFile(file!);
                           //            },
                                    
                           //  ),
                          );
                        }
                     
                        
                              var e =oldFiles[index];
                          
                          
                   return         
                
                    Card(
                 clipBehavior: Clip.antiAlias,
                 
                 child: Stack(
                   children: <Widget>[
                     
                       (e.toString().contains("png")|| 
                  
                  e.toString().contains("jpeg")|| 
                  e.toString().contains("jpg") )?
                     
                     Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CachedNetworkImage(
                       imageUrl: "https://goodfoodsa.co$e",
                       fit: BoxFit.cover,
                      
                         width: 300,
                   height: 300,
                       progressIndicatorBuilder: (context, url, downloadProgress) => 
                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                       errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                    ).onTap((){
              
              
                 DocumentService().initPlatformState(e);
              
                    })
                    :  
                      Container(
                      child: Image.asset(
                      
                       getFileIocn(e)
                        ,
                 width: 300,
                 height: 300,
                      ),
                      ).onTap((){
              
                      // OpenDocumentPage(needLoadfromUrl: false,url: e,);
              //download file 
              DocumentService().initPlatformState(e);
              //open file
              
              
              
                    })
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
                           remooveFromFiles(e);
                           // setState(() {
                           //   images.replaceRange(index, index + 1, ['Add Image']);
                           // });
                         },
                       ),
                     ),
                   ],
                 ));
                      }),
              ),
            ],
          ),
          
          
          
          
          
          
          
          
              // maintenanceController.newFiles.isEmpty
           
              // ?
              
              // Center(
              //   child:   ImagePickerContainer(
              //                showFiles: true, 
                            
              //                onSelect: (file, isImage){
              //                 //  if (isImage!) {
              //                     maintenanceController.addEdit(file!);
              //                 //  }
              //                     // maintenanceController.addFile(file!);
              //              },) ,
              // ):
                      Visibility(
                        visible:    maintenanceController.newFiles.isNotEmpty,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        
                          children: [
                                              Text(currentLang(context)=="ar"?"اضافة ملفات جديدة: ":"Add new files:"),
                        const SizedBox(height: 5,),
                            SizedBox(
                                           height: 
                                        100*  ( maintenanceController.newFiles.length).toDouble(), 
                                          //  MediaQuery.of(context).size.height/2,
                                          child:
                                          
                                           GridView.builder(

                                                 itemCount:  
                                                
                                                 maintenanceController.newFiles.length
                                                 ,
                                                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                                                 itemBuilder: (BuildContext context, int index) {
                                                
                                                
                            //  if (index ==    maintenanceController.newFiles.length) {
                            //    return Center(
                            //      child:
                                 
                            //      ImagePickerContainer(
                            //        showFiles: true, 
                            //        showRounded: true,
                            //        onSelect: (file, isImage){
                            //             maintenanceController.addEdit(file!);
                            //      },)
                            //     //   AddUserButton(
                                         
                            //     //          onSelect: (file){
                            //     //          maintenanceController.addFile(file!);
                            //     //            },
                                         
                            //     //  ),
                            //    );
                            //  }
                                          var e =maintenanceController.newFiles[index];
                                      
                                      
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
                                maintenanceController.removeEditFile(e.path!);
                                // setState(() {
                                //   images.replaceRange(index, index + 1, ['Add Image']);
                                // });
                              },
                            ),
                                                ),
                                              ],
                                            ));
                                                 }),
                                               
                                               
                                               
                                               
                            ),
                          ],
                        ),
                      )
                      
                
                      
                      
                      
                      
                      
                      
                      
                    ],
                  ),
                ),
              );
                
                
                
            }
            }
          ),
        ),
        bottomNavigationBar: 

                
                Container(
                  padding: const EdgeInsets.all(8),
                  child:
                  
                  maintenanceController.updateOrder!.status==Status.LOADING?
                   Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),)
                  // .ApiResponse.loading('loading')
                  :
                   ElevatedButton(
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
                          if (
                            
                            oldFiles.isEmpty &&
                            maintenanceController.newFiles.isEmpty ) {

showToast(currentLang(context)=="ar"? "الرجاء اختيار ملف":"Please select file", true);


                            
                          }else {

// maintenanceController.ed

// maintenanceController.setModelId(widget.modelId!);
//                 maintenanceController.setModelType(widget.modelType!);
//                 maintenanceController.setTask(_nameController.text.trim());
                
                
                
//                            SelectMaintainenaceEmpolyee(
//                             maintain_type: widget.maintain_type,
// category: widget.category,
// walkway: widget.walkway,
//                           ).launch(context);
                       
                       
                       maintenanceController.updateOrder2(context, widget.orderId,
                        _nameController.text, 
                       
                       maintenanceType,
                      
                       
                           oldFiles, 
                            maintenanceController.newFiles,
                    
                       
                   isSuccess: (status){
if(status){
showToast(
  
  currentLang(context)=="ar"?"تم تحديث الطلب":
  'Order updated successfully', false);

Navigator.pop(context);
}else {

showToast(
  
  currentLang(context)=="ar"?"حاول مجددا":
  'Sorry , try again', false);
}


                       });
                          }
                



                        }
                      },
                      child:  Text(
                        
                        
                        currentLang(context)=="ar"?
                        "تحديث":
                        'Update')),
              
              
              
              
              
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