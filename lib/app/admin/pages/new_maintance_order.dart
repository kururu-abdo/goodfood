import 'package:flutter/material.dart';

import 'package:goodfoods/app/maintenance/widgets/pages/select_maintainance_emp.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/presentation/widgets/image_picker_container.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
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
  const MaintenanceOrder({super.key, this.modelType, this.modelId});

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
        
       
        title: const Text("New Order"),
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
        
        placeholder: 'Task',
        )
        
        ,8.height,
        
        // ImagePickerContainer(
        //   onSelect: (file){
        // maintenanceController.addFile(file!);
        //   },
        // ),
        // maintenanceController.addFile(file!);
        8.height,
        
        SizedBox(
           height: MediaQuery.of(context).size.height/2,
          child: GridView.builder(
                 itemCount:  
                 
                 maintenanceController.newOrderFiles.length+1
                 ,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                 itemBuilder: (BuildContext context, int index) {
                
                
                   if (index ==  0) {
                     return Center(
                       child: AddUserButton(
                               
                               onSelect: (file){
                               maintenanceController.addFile(file!);
                                 },
                               
                       ),
                     );
                   }
          var e =maintenanceController.newOrderFiles[index-1];
              return          Card(
            clipBehavior: Clip.antiAlias,
            
            child: Stack(
              children: <Widget>[
               Image.asset(
                 e.icon!,
                  // 'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
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
                maintenanceController.setModelId(widget.modelId!);
                maintenanceController.setModelType(widget.modelType!);
                maintenanceController.setTask(_nameController.text.trim());
                
                
                
                          const SelectMaintainenaceEmpolyee().launch(context);
                        // }
                      },
                      child: const Text('Next')),
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