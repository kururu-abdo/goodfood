
import 'dart:convert';

import 'package:goodfoods/app/order/model/order_data.dart';
import 'package:goodfoods/core/data/models/branch_asset.dart';
import 'package:goodfoods/core/data/models/car_model.dart';
import 'package:goodfoods/core/data/models/department.dart';
import 'package:goodfoods/core/data/models/department_asset.dart';
import 'package:goodfoods/core/data/models/deprtment_model.dart';
import 'package:goodfoods/core/data/models/mainenance_order_model.dart';
import 'package:goodfoods/core/data/models/maintain_model.dart';
import 'package:goodfoods/core/data/models/other_asset_model.dart';
import 'package:goodfoods/core/data/models/record_model.dart';
import 'package:goodfoods/core/data/models/skin_model.dart';
import 'package:goodfoods/core/data/models/upload_file_model.dart';
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








  Future<List<DepartmentModel>> getDepartments2(
   ) async {
     //
    final response = await _helper.get("department/get_departments" ,
   
    
    );
    List<DepartmentModel> skins=[];
    Iterable I = response['data'];

skins = I.map((e) => DepartmentModel.fromJson(e)).toList();
    return skins;
  }
Future<List<DepartmentAsset>> getDepartmentAssets(
  String? dept
   ) async {
     //
    final response = await _helper.get("department/get_asset/$dept" ,
   
    
    );
    List<DepartmentAsset> skins=[];
    Iterable I = response['data'];

skins = I.map((e) => DepartmentAsset.fromJson(e)).toList();
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
empId ,modelType,modelId, task, files ,  immedatly ,

maintainType , option , walkway
   ) async {
     //
     dynamic carBody;
if (modelType.toString().toLowerCase()=="car") {
 if (maintainType.toString()=="1") {
  carBody=   jsonEncode({ 
	"forward_to":empId,
	
	"model_type" : modelType,
 "model_id"   : modelId,
  "task"      : task.toString() 
,
"maintain_type":maintainType,
"files" : files ,
'immedatly':immedatly ,

});
 }else {

if (walkway!= null) {
  
carBody=   jsonEncode({ 
	"forward_to":empId,
	
	"model_type" : modelType,
 "model_id"   : modelId,
  "task"      : task.toString() 
,
"files" : files ,
'immedatly':immedatly ,
"walkway":walkway,
"maintain_type":maintainType,
"maintain_cat":option
});

}else {

carBody=   jsonEncode({ 
	"forward_to":empId,
	
	"model_type" : modelType,
 "model_id"   : modelId,
  "task"      : task.toString() 
,
"files" : files ,
'immedatly':immedatly ,
// "walkway":walkway,
"maintain_type":maintainType,
"maintain_cat":option
});

}

 }
}

log("CAR BODY    $carBody");
    final response = await _helper.post("maintain/add_order" ,




modelType.toString().toLowerCase()=="car"? carBody:


   jsonEncode({ 
	"forward_to":empId,
	
	"model_type" : modelType,
 "model_id"   : modelId,
  "task"      : task.toString() 
,
"files" : files ,
'immedatly':immedatly
})
    
    );
    log("NO PROPLEM2");
    return  response;
  }




Future<void> updateOrder(maintainId,
task ,immedatly,
 files  , newFiles 
   ) async {
/*

$maintain->update([
           'task'           => $request['task'],
           'immedatly'      => $request['immedatly'],
           'maintain_type'  => $request['maintain_type'],
           'maintain_cat'   => $request['maintain_cat'],
           'files'          => json_encode($request['files'])
'new_files'


*/





     //
Map<String,dynamic> body ={
  'task':task ,
  'immedatly':immedatly.toString()
};
 dynamic body2=   jsonEncode({ 
'task':task ,
  'immedatly':immedatly.toString()

});

// body["task"] = task.toString();

// body['immedatly'] = immedatly.toString();
     if(
      files!.isNotEmpty && newFiles!.isEmpty){
// body['files'] = json.encode(files);
body['files'] = files.toString();
body.addAll({"files":files});
body2=
jsonEncode({ 
'task':task ,
  'immedatly':immedatly.toString(), 
  'files':files

});
     }
else   if(
    newFiles!.isNotEmpty && files.isEmpty){
// body['new_files'] =  json.encode(newFiles);
body.addAll({"new_files":newFiles});

body['new_files'] =  newFiles.toString();
body2=jsonEncode({ 
'task':task ,
  'immedatly':immedatly.toString(),
'new_files': newFiles
});
     }
else if( newFiles.isNotEmpty && files.isNotEmpty){
  body.addAll({
    'new_files': newFiles, 
"files":files
  });
  body2=jsonEncode({ 
'task':task ,
  'immedatly':immedatly.toString(),
'new_files': newFiles, 
"files":files
});
}





log(body.keys.toString());

    final response = await _helper.patch("maintain/update/$maintainId" ,



// body
body2
  //  jsonEncode(body)
    
    );
    log("NO PROPLEM2");
    return  response;
  }






  Future<MaintainenanceOrderModel> getMaintainOrder(
   [
    String? nextUrl,
    bool? isPaginate=false
  ]
   ) async {
     log('////////////////$nextUrl $isPaginate');
     //
    final response = await _helper.get("maintain/get_submitted_orders" ,
      pageUrl: nextUrl,
   isPaginate:  isPaginate
    
    );
    // List<MaintainenanceOrderModel> orders=[];
    // Iterable I = response['data'];


    return  MaintainenanceOrderModel.fromJson(response) ;
  }




  Future<MaintainenanceOrderModel> filterMaintainOrder(
  filterParmas
   ) async {
  
     //
    final response = await _helper.get("maintain/get_submitted_orders?$filterParmas" ,
    
    
    );
    // List<MaintainenanceOrderModel> orders=[];
    // Iterable I = response['data'];


    return  MaintainenanceOrderModel.fromJson(response) ;
  }



Future<OrderData> getUserOrders(

  [
    String? nextUrl,
    bool? isPaginate=false ,
    String? status
  ]
   
   ) async {
     //
    final response = await _helper.get(
     status !=null?
      "maintain/get_order":"maintain/get_order"   ,
   pageUrl: 
   
   status != null?
   "${nextUrl!}&status=$status":nextUrl,
   isPaginate:  isPaginate
    
    );
   
    var orderData=
OrderData.fromJson(response['data']);
    return orderData;
  }


Future<OrderData> filterUserOrders(

  filterParams
   
   ) async {
     //
    final response = await _helper.get(
   
      "maintain/get_order?$filterParams"   ,
  
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
    String? order , String desc ,
    file,extension
  
   ) async {
     //
     log(extension.toString());

    final response = await _helper.post(
      
      "maintain/add_order_record/$order" ,
      file!=null?
       jsonEncode({
      	"maintain_id":order ,
"des" :desc ,
"file":file,
"extention":extension

     }):
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




Future<dynamic> updateOrderStatus(
    String? order ,
    String? reason,
    String? status
  
   ) async {
     //
    final response = await _helper.post(
      
      "maintain/confirm_order/$order" ,
reason != null?
     jsonEncode({
    'reject_resion':reason ,

    'status':status
     })
   :
    jsonEncode({
    

    'status':status
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
    String status , 
    List<UploadFile> files
   ) async {
     //
    final response = await _helper.post(
      
      "maintain/change_order_status/$order" ,
      files.isNotEmpty?
         jsonEncode({
    
	"status":status,
"files":
files.map((e) =>  { "file":e.fileBase64,
"extention":e.extension}).toList()


     }):
     jsonEncode({
    
	"status":status , 
  "files":[]

     })
   
    
    );
   
log(response.toString());
   
    return response;
  }

}