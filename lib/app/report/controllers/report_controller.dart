import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/report/models/report_details_model.dart';
import 'package:goodfoods/app/report/models/report_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/report_apis.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class ReportController extends ChangeNotifier {
  
ApiResponse<List<ReportModel>>?  repors = ApiResponse.completed([]);


ApiResponse<ReportDetailsModel>?  reportDetails = ApiResponse.completed(null);


ApiResponse<void>?  respondToTask = ApiResponse.completed({});
   Branchs? branch;

String? base64Image;
 final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
File? imageFile;
String? imagePath;
setBranch(Branchs b){
  branch= b;
  notifyListeners();
}

setImage(String data){
  imageFile= File(data);
  base64Image= getBase64(data);
  imagePath =data;
  notifyListeners();
}
removeImage(){
  imageFile= null;
  base64Image= null;
  notifyListeners();
}

clear(){
   branch=null;
   nameController.clear();
  removeImage();
 

}


Future<void> getReports(BuildContext context)async{
   repors = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await ReportApis().getReports();



    repors=ApiResponse.completed(response);
  } catch (e) {
       repors = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}

Future<void> getReportDetails(BuildContext context ,

String? id
)async{
   reportDetails = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await ReportApis().getReportDetails(
      id
    );



    reportDetails=ApiResponse.completed(response);
  } catch (e) {
       reportDetails = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}



Future<void> respondToTasks(BuildContext context ,

String? image ,
String? comment ,
Tasks? tasks ,
String branchId,
String region ,
String? extenstion
)async{
   respondToTask = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await ReportApis().addReportTask(tasks!.reportId!.toString(), 
    region, branchId, 
    tasks.id.toString(),
     tasks.taskAr!, tasks.taskEn!, tasks.senderDesAr!, tasks.senderDesEn!, comment!, image!);




    respondToTask=ApiResponse.completed(response);

   clear();

   showToast(
     currentLang(context)=="ar"?"تم الرد":
     
     'Response added', false);

  } catch (e) {
    log(e.toString());
       respondToTask = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}






}