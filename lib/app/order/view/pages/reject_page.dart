import 'package:flutter/material.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/box_text.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:provider/provider.dart';

class RejectPage extends StatefulWidget {
  final String? orderId;
  const RejectPage({ Key? key, this.orderId }) : super(key: key);

  @override
  _RejectPageState createState() => _RejectPageState();
}

class _RejectPageState extends State<RejectPage> {

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
  currentLang(context)=="ar"?'رفض':'Reject'"  "'${currentLang(context)=="ar"?"طلب":"Order"} #${widget.orderId}'

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
  
  
  BoxInputField(
    
    isInputAea: true, 

    placeholder: currentLang(context)=="ar"?"اكتب سبب الرفض":"Write a reason",
    controller: commentInputController,
    
    validator: (str){

      if (str!.isEmpty) {
        return currentLang(context)=="ar"?"هذا الحقل مطلوب":"this field is required";

      }else {
        return null;
      }
    },
    
    
    ),
  
  
  const Spacer(),
  
  
   BoxButton(
     onTap: (){


       if (formKey.currentState!.validate()) {
         controller.updateOrderStatus(context, widget.orderId!,
          commentInputController.text.trim(), 2.toString())
         
         .then((value) {
    context.read<MaintenanceController>().getStatusData(context, null);

           Navigator.pop(context);
         })
         ;
         
         
         
                }
     },
     
     busy: controller.updateOrder!.status==Status.LOADING,
     
     title: 
  
  currentLang(context)=="ar"?"ارسال":
  'Submit')
  
  
  
  

  
  
    ],
  ),
),
),

),

    );
  }
}