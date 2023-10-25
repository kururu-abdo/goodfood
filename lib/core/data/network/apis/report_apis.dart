import 'dart:convert';

import 'package:goodfoods/app/report/models/report_details_model.dart';
import 'package:goodfoods/app/report/models/report_model.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';

class ReportApis {
    final ApiBaseHelper _helper = ApiBaseHelper();




   Future<List<ReportModel>> getReports(
   ) async {

     List<ReportModel> reports=[];
    final response = await _helper.get("report/get_reports" ,
    
    
    );
Iterable I =response['data'];
reports = I.map((e) => ReportModel.fromJson(e)).toList();





    return reports;
  }






   Future<ReportDetailsModel> getReportDetails(
     String? id
   ) async {

     List<ReportModel> reports=[];
    final response = await _helper.get("report/show_report/$id" ,
    
    
    );

var details=
ReportDetailsModel.fromJson(response['data']);






    return details;
  }










   Future<dynamic> addReportTask(
     String? id ,
     String regionId ,
     String branchId ,
 String? taskId  ,

 String taskAr ,
 String taskEn ,
 String senderDescAr ,
 String senderDescEn ,

 String receiverDesc ,
 String image
   ) async {

  
  
    final response = await _helper.post(
      "report/add_task/$id" ,
    
    jsonEncode({
      

        "region_id": regionId,
    "branch_id": branchId,
    "tasks": [
        {
            "id": taskId,
            "report_id": id,
            "task_ar": taskAr,
            "sender_des_ar": senderDescAr,
            "task_en":taskEn,
            "sender_des_en": senderDescEn,


            "reciver_des" :receiverDesc,
            "img" : image
        }
    ]
}
    )
  
  
  
   );








    return response;
  }














}