import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/model/details_mapper.dart';
import 'package:goodfoods/app/order/model/admin_order_details.dart';
import 'package:goodfoods/app/order/model/maintain_order_details.dart';
import 'package:goodfoods/app/order/model/order_data.dart';
import 'package:goodfoods/app/success/view/pages/success.dart';
import 'package:goodfoods/core/controllers/app_state.dart';
import 'package:goodfoods/core/data/models/branch_asset.dart';
import 'package:goodfoods/core/data/models/car_model.dart';
import 'package:goodfoods/core/data/models/department.dart';
import 'package:goodfoods/core/data/models/file_model.dart';
import 'package:goodfoods/core/data/models/mainenance_order_model.dart';
import 'package:goodfoods/core/data/models/maintain_model.dart';
import 'package:goodfoods/core/data/models/other_asset_model.dart';
import 'package:goodfoods/core/data/models/record_model.dart';
import 'package:goodfoods/core/data/models/skin_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/maintenance_apis.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class MaintenanceController
extends AppState



 {


ApiResponse<List<CarModel>>?  cars = ApiResponse.completed([]);

ApiResponse<List<Department>>?  departments = ApiResponse.completed([]);
ApiResponse<List<SkinModel>>?  skins = ApiResponse.completed([]);

ApiResponse<List<BranchAsset>>?  branchAssets = ApiResponse.completed([]);

ApiResponse<List<MaintainModel>>?  maintenanceEmployees = ApiResponse.completed([]);
ApiResponse<void>?  newOrder = ApiResponse.completed({});

ApiResponse<List<RecordModel>>?  orderRecorders = 
ApiResponse.completed([]);



ApiResponse<List<MaintainenanceOrderModel>>?  maintainOrders = ApiResponse.completed([]);


ApiResponse<OrderData>?  userOrders = 
ApiResponse.completed(null);
ApiResponse<OrderDetailMapper>?  orderDetailsMapper = 
ApiResponse.completed(null);





ApiResponse<List<OtherAsset>>?  otherAssets = ApiResponse.completed([]);

List<FileModel>  newOrderFiles = [];
String? modelId;
String? modelType;
MaintainModel? maintainModel;
String? task;


setModelId(String id){
  modelId=id;
  notifyListeners();
}
setTask(String t){
  task=t;
  notifyListeners();
}

setModelType(String type){
  modelType=type;
  notifyListeners();
}


setEmployee(MaintainModel model){
  maintainModel=model;
  notifyListeners();
}


removeFile(String path){
 newOrderFiles.removeWhere((file)=>file.path==path);
  notifyListeners();
}




Future<void> getCars(BuildContext context)async{
   cars = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await MaintenanceApis().getCars();



    cars=ApiResponse.completed(response);
  } catch (e) {
       cars = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}



Future<void> getDepartments(BuildContext context)async{
   departments = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await MaintenanceApis().getDepartments();



    departments=ApiResponse.completed(response);
  } catch (e) {
       departments = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}

Future<void> getSkins(BuildContext context ,

String branchId
)async{
   skins = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await MaintenanceApis().getSkins(branchId);



    skins=ApiResponse.completed(response);
  } catch (e) {
       skins = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}


addFile(File file){
var base64 = getBase64(file.path);
var fileName = getFileName(file.path);
var extenstion= getFileExtenstion(file.path);
var fileModel = FileModel(fileName: fileName, path: file.path,   )
..setExtension(extenstion)
..setBase64(base64);
newOrderFiles.add(fileModel);
notifyListeners();
}

List<Map> getFiles(List<FileModel> files
){

  var  files0 = <Map>[];

  files0 = files.map((e) => {
    "file":e.base64 , "extention" : e.extension
  }).toList();

  return files0;
}
addOrder(BuildContext context)async{
  newOrder = ApiResponse.loading('sdfds');
  notifyListeners();
  try {
    log(getFiles(
  newOrderFiles
).toString());
     log(task.toString());
var response = await MaintenanceApis().addOrder(
  maintainModel!.id.toString(), modelType, modelId, task, getFiles(
  newOrderFiles
));
  newOrder =ApiResponse.completed({});
  notifyListeners();
    const Success().launch(context , isNewTask: true);
  } catch (e) {
    log("add order $e");
    newOrder =ApiResponse.error(e.toString());
  }finally{
    notifyListeners();
  }
}


Future<void> getBranchAssets(BuildContext context ,

String branchId
)async{
   branchAssets = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await MaintenanceApis().getBranchAssets(branchId);



    branchAssets=ApiResponse.completed(response);
  } catch (e) {
       branchAssets = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}


Future<void> getMaintanenanceEmployee(BuildContext context ,


)async{
   maintenanceEmployees = ApiResponse.loading('loading');

isBusy= true;
notifyListeners();
  try {
    var  response = await MaintenanceApis().getMaintenanceEmployee();



    maintenanceEmployees=ApiResponse.completed(response);

  } catch (e) {
       maintenanceEmployees = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 

      notifyListeners();
  }
}




Future<void> getOtherAssets(BuildContext context ,


)async{
   otherAssets = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await MaintenanceApis().getOtherAssets();



    otherAssets=ApiResponse.completed(response);
  } catch (e) {
       otherAssets = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}




Future<void> getMaintainOrders(BuildContext context ,


)async{
   maintainOrders = ApiResponse.loading('loading');

notifyListeners();
  try {
    var  response = await MaintenanceApis().getMaintainOrder();



    maintainOrders=ApiResponse.completed(response);
    // notifyListeners();
  } catch (e) {
       maintainOrders = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 

      notifyListeners();
  }
}







Future<void> getUserOrders(BuildContext context ,
[
  String? nexUrl
]

)async{
   userOrders = ApiResponse.loading('loading');

notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().getUserOrders();



    userOrders=ApiResponse.completed(response);
    // notifyListeners();
  } catch (e) {
       userOrders = ApiResponse.error('$e');
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}

Future<void> getOrderRecord(
  BuildContext context ,

String orderId
)async{
   orderRecorders = ApiResponse.loading('loading');

notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().getOrderRecords(
      orderId
    );



    orderRecorders=ApiResponse.completed(response);
    // notifyListeners();
  } catch (e) {
       orderRecorders = ApiResponse.error('$e');
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}


Future<void> addRecord(
  BuildContext context ,

String orderId ,
String desc
)async{

notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().addRecord(sharedPrefs.user_id,
     orderId, desc);



    // notifyListeners();
  } catch (e) {
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}






Future<void> confirmOrder(
  BuildContext context ,

String orderId ,
)async{

notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().confrimOrder(orderId);

showToast('Order Confimed Successfully', false);

    // notifyListeners();
  } catch (e) {
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}









Future<void> changeOrderStatus(
  BuildContext context ,


String orderId ,
String status
)async{

notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().changeOrderStatus(orderId, status);

showToast('Status changed successfully', false);

    // notifyListeners();
  } catch (e) {
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}






//load order data by 

Future<void> getOrderDetails(
  bool isAdmin , String modelId
)async{
  orderDetailsMapper = ApiResponse.loading('loading');

try {
  
if (isAdmin) {
  var response = await MaintenanceApis().getOrderDetails("maintain/get_admin_order/$modelId");
log(response['data'].toString());
 var adminOrder= AdminOrderDetails.fromJson(response);

 orderDetailsMapper = ApiResponse.completed(
   OrderDetailMapper(orderId: adminOrder.data!.maintainId.toString(),
    confirmed: adminOrder.data!.confirmed,
    task: adminOrder.data!.maintainOrder!.task, from: adminOrder.data!.admin!.name ,
    status: adminOrder.data!.maintainOrder!.status.toString(),
     to: sharedPrefs.user_name,
     date: adminOrder.data!.createdAt, file: 
     adminOrder.data!.maintainOrder!.files)
 );

}else {
  var response = await MaintenanceApis().getOrderDetails("maintain/show_submitted_order/$modelId");
log(response['data'].runtimeType.toString());
log("NO PROBLEM");
  var userOrder =
   MaintainOrderDetails.fromJson(response);

 orderDetailsMapper = ApiResponse.completed(
   OrderDetailMapper(orderId: userOrder.data!.id.toString(),
    confirmed: userOrder.data!.forwardTo!.confirmed,
    task: userOrder.data!.task, from: userOrder.data!.forwardTo!.admin!.name ,
      status: userOrder.data!.status.toString(),
     to: sharedPrefs.user_name,
     date: userOrder.data!.createdAt, file: 
     userOrder.data!.files)
 );
}
notifyListeners();







} catch (e) {
  orderDetailsMapper = ApiResponse.error(e.toString());
}finally{

  notifyListeners();
}







}

}