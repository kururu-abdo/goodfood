import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/managment_orders/models/management_order.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/requests_apis.dart';
import 'package:goodfoods/core/utils/utils.dart';

class RequestController extends ChangeNotifier {

ApiResponse<List<ManagementOrderModel>>?  orders = ApiResponse.completed([]);

ApiResponse<dynamic>?  addReply = ApiResponse.completed({});
ApiResponse<ManagementOrderModel>?  order = ApiResponse.completed(null);
String? base64Image;
 final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
File? imageFile;
String? imagePath;
File? fileDoc;
String? fileBase64;
String? filePath;

setImage(String data){
  imageFile= File(data);
  base64Image= getBase64(data);
  imagePath =data;
  notifyListeners();

  removeFile();
}

setFile(String data){
fileDoc= File(data);
fileBase64=getBase64(data);
filePath=data;
notifyListeners();
removeImage();
}




removeImage(){
  imageFile= null;
  base64Image= null;
  notifyListeners();
}
removeFile(){
  fileDoc= null;
  fileBase64= null;

  notifyListeners();
}

clear(){
  //  branch=null;
   nameController.clear();
  removeImage();
 removeFile();

}



Future<void> getMyRquests(BuildContext context)async{
   orders = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await RequestApis().getRequests();



    orders=ApiResponse.completed(response);
  } catch (e) {
       orders = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}



Future<void> getRequest(BuildContext context ,String? id)async{
   order = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await RequestApis().fetchRequest(id);



    order=ApiResponse.completed(response);
  } catch (e) {
       order = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}



Future<void> addReplyument(BuildContext context ,

String? id ,
String? replay ,
String? image,
String extension
)async{
   addReply = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await RequestApis().addReuestReply(id , replay!, image, extension);
    
addReply =  ApiResponse.completed(response);

notifyListeners();
Navigator.pop(context);
 showToast(translate(context, 'successfull'), false);

  } catch (e) {
    log(e.toString());
       addReply = ApiResponse.error('$e');
     showToast('$e', true);  
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}

  
}