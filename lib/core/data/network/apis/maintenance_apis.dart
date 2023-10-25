
import 'dart:convert';

import 'package:goodfoods/app/order/model/order_data.dart';
import 'package:goodfoods/core/data/models/branch_asset.dart';
import 'package:goodfoods/core/data/models/car_model.dart';
import 'package:goodfoods/core/data/models/department.dart';
import 'package:goodfoods/core/data/models/mainenance_order_model.dart';
import 'package:goodfoods/core/data/models/maintain_model.dart';
import 'package:goodfoods/core/data/models/other_asset_model.dart';
import 'package:goodfoods/core/data/models/record_model.dart';
import 'package:goodfoods/core/data/models/skin_model.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';
import 'package:nb_utils/nb_utils.dart';

class MaintenanceApis {
  

    final ApiBaseHelper _helper = ApiBaseHelper();




  Future<List<CarModel>> getCars(
     
   ) async {
     //
    final response = await _helper.get("car/get_cars" ,
   
    
    );
    List<CarModel> cars=[];
    Iterable I = response['data'];

cars = I.map((e) => CarModel.fromJson(e)).toList();
    return cars;
  }

  Future<List<Department>> getDepartments(
     
   ) async {
     //
    final response = await _helper.get("department/get_departments" ,
   
    
    );
    List<Department> depts=[];
    Iterable I = response['data'];

depts = I.map((e) => Department.fromJson(e)).toList();
    return depts;
  }


  Future<List<SkinModel>> getSkins(
     String? dept
   ) async {
     //
    final response = await _helper.get("branch/get_branch_skins/$dept" ,
   
    
    );
    List<SkinModel> skins=[];
    Iterable I = response['data'];

skins = I.map((e) => SkinModel.fromJson(e)).toList();
    return skins;
  }


  Future<List<MaintainModel>> getMaintenanceEmployee(
   ) async {
     //
    final response = await _helper.get("maintain/get_maintain_emp" ,
   
    
    );
    List<MaintainModel> emps=[];
    Iterable I = response['data'];

emps = I.map((e) => MaintainModel.fromJson(e)).toList();
    return emps;
  }



  Future<List<BranchAsset>> getBranchAssets(
     String? dept
   ) async {
     //
    final response = await _helper.get("branch/get_branch_assets/$dept" ,
   
    
    );
    List<BranchAsset> assets=[];
    Iterable I = response['data'];

assets = I.map((e) => BranchAsset.fromJson(e)).toList();
    return assets;
  }


Future<List<OtherAsset>> getOtherAssets(

   ) async {
     //
    final response = await _helper.get("other_assets/get_other_assets" ,
   
    
    );
    List<OtherAsset> assets=[];
    Iterable I = response['data'];

assets = I.map((e) => OtherAsset.fromJson(e)).toList();
    return assets;
  }




Future<void> addOrder(
empId ,modelType,modelId, task, files
   ) async {
     //
 
    final response = await _helper.post("maintain/add_order" ,
   jsonEncode({ 
	"forward_to":empId,
	
	"model_type" : modelType,
 "model_id"   : modelId,
  "task"      : task.toString()
,
"files" : files
})
    
    );
    log("NO PROPLEM2");
    return  response;
  }








  Future<List<MaintainenanceOrderModel>> getMaintainOrder(
  
   ) async {
     //
    final response = await _helper.get("maintain/get_submitted_orders" ,
   
    
    );
    List<MaintainenanceOrderModel> orders=[];
    Iterable I = response['data'];

orders = I.map((e) => MaintainenanceOrderModel.fromJson(e)).toList();
    return orders;
  }




Future<OrderData> getUserOrders(
  [
    String? nextUrl
  ]
   ) async {
     //
    final response = await _helper.get(
      
      "maintain/get_order" ,
   
    
    );
   
    var orderData=
OrderData.fromJson(response['data']);
    return orderData;
  }




Future<List<RecordModel>> getOrderRecords(
  
    String? order
  
   ) async {
     //
    final response = await _helper.get(
      
      "maintain/get_records/$order" ,
   
    
    );
   
   List<RecordModel> records=[];
    Iterable I = response['data'];

records = I.map((e) => RecordModel.fromJson(e)).toList();
   
    return records;
  }






Future<dynamic> addRecord(
  String? uid,
    String? order , String desc
  
   ) async {
     //
    final response = await _helper.post(
      
      "maintain/add_order_record/$order" ,
     jsonEncode({
      	"maintain_id":order ,
"des" :desc
     })
   
    
    );
   

   
    return response;
  }








Future<dynamic> confrimOrder(
    String? order 
  
   ) async {
     //
    final response = await _helper.post(
      
      "maintain/confirm_order/$order" ,
     jsonEncode({
    
     })
   
    
    );
   

   
    return response;
  }






Future<dynamic> getOrderDetails(
    String? url 
  
   ) async {
     //
    final response = await _helper.get(
      
      url!,
    
   
    
    );
   

   
    return response;
  }






Future<dynamic> changeOrderStatus(
    String? order  ,
    String status
  
   ) async {
     //
    final response = await _helper.post(
      
      "maintain/change_order_status/$order" ,
     jsonEncode({
    
	"status":status

     })
   
    
    );
   

   
    return response;
  }

}