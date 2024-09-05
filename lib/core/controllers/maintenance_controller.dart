import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/model/asset_info.dart';
import 'package:goodfoods/app/maintenance/model/details_mapper.dart';
import 'package:goodfoods/app/order/model/admin_order_details.dart';
import 'package:goodfoods/app/order/model/maintain_order_details.dart';
import 'package:goodfoods/app/order/model/order_data.dart';
import 'package:goodfoods/app/order/model/order_mapper.dart';
import 'package:goodfoods/app/success/view/pages/success.dart';
import 'package:goodfoods/core/controllers/app_state.dart';
import 'package:goodfoods/core/data/models/branch_asset.dart';
import 'package:goodfoods/core/data/models/branch_model.dart';
import 'package:goodfoods/core/data/models/car_model.dart';
import 'package:goodfoods/core/data/models/city_model.dart';
import 'package:goodfoods/core/data/models/department.dart';
import 'package:goodfoods/core/data/models/department_asset.dart';
import 'package:goodfoods/core/data/models/deprtment_model.dart';
import 'package:goodfoods/core/data/models/file_model.dart';
import 'package:goodfoods/core/data/models/mainenance_order_model.dart';
import 'package:goodfoods/core/data/models/maintain_model.dart';
import 'package:goodfoods/core/data/models/order_status.dart';
import 'package:goodfoods/core/data/models/other_asset_model.dart';
import 'package:goodfoods/core/data/models/record_model.dart';
import 'package:goodfoods/core/data/models/region_model.dart';
import 'package:goodfoods/core/data/models/skin_model.dart';
import 'package:goodfoods/core/data/models/upload_file_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/common_apis.dart';
import 'package:goodfoods/core/data/network/apis/maintenance_apis.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class MaintenanceController
extends AppState



 {
String? startDate;
String? endDate;


String? status;
String? statusText='';

String? modelTypeId;
String? modelTextId;

String filterLink='';

  bool isEmediate=false;
ApiResponse<List<RegionModel>>?  regions = ApiResponse.completed([]);
ApiResponse<List<DepartmentModel>>?  departments2 = ApiResponse.completed([]);
ApiResponse<List<DepartmentAsset>>?  departmeentAssets = ApiResponse.completed([]);
ApiResponse<OrderStatus>?  orderStatusData =ApiResponse.loading("loading");


ApiResponse<List<CarModel>>?  cars = ApiResponse.completed([]);

ApiResponse<List<Department>>?  departments = ApiResponse.completed([]);
ApiResponse<List<SkinModel>>?  skins = ApiResponse.completed([]);
ApiResponse<void>?  changeStatusState = ApiResponse.completed([]);

ApiResponse<List<BranchAsset>>?  branchAssets = ApiResponse.completed([]);

ApiResponse<List<MaintainModel>>?  maintenanceEmployees = ApiResponse.completed([]);
ApiResponse<void>?  newOrder = ApiResponse.completed({});

ApiResponse<void>?  updateOrder = ApiResponse.completed({});
String? orderIdToAccept;
ApiResponse<void>?  closingOrderResponse = ApiResponse.completed({});

ApiResponse<List<RecordModel>>?  orderRecorders = 
ApiResponse.completed([]);

ApiResponse<List<BranchModel>>?  branches = ApiResponse.completed([]);

ApiResponse<List<CityModel>>?  cities = ApiResponse.completed([]);


ApiResponse<MaintainenanceOrderModel>?  maintainOrders = ApiResponse.completed(null);
List<OrderMapper> adminOrders=[];


ApiResponse<MaintainenanceOrderModel>?  maintainOrdersPaginate = 
ApiResponse.completed(null);

ApiResponse<void>?  addRecordStatus = 
ApiResponse.completed(null);

ApiResponse<OrderData>?  userOrders = 
ApiResponse.completed(null);


List<FileModel> newFiles=[];

ApiResponse<OrderData>?  userOrderPaginate = 
ApiResponse.completed(null);
List<OrderMapper> userOrdersData = [];
// List<Space> spaces = [];
String? selectedStatus;
String? selectedModel;


List<UploadFile> closeOrderFiles = [];


UploadFile? recordFile;
File? imageFile;
String? imagePath;
File? fileDoc;
String? fileBase64;
String? filePath;
String? base64Image;
setImage(String data){
  imageFile= File(data);
  base64Image= getBase64(data);
  imagePath =data;
  notifyListeners();

  clearFile();
}
setRecordFile(String? data ){
  var  file= File(data!);
  var filetobase64= getBase64(data);
  log("PATH    ${file.path}");
  // imagePath =data;
 recordFile=
    UploadFile( 
      
      path: file.path,
      extension: getFileExtenstion(file.path) , fileBase64: filetobase64);

  notifyListeners();
}
removeRecordFile(){
  recordFile=
    null;

  notifyListeners();
}



addCloseOrderFile(String data){
 var  file= File(data);
  var filetobase64= getBase64(data);
  log("PATH    ${file.path}");
  // imagePath =data;
  closeOrderFiles.add( 
    UploadFile( 
      
      path: file.path,
      extension: getFileExtenstion(file.path) , fileBase64: filetobase64)
  );

  notifyListeners();
}
removeCloseOrderFile(String hasCode){
  closeOrderFiles.removeWhere( 
    (file)=> file.path==hasCode
  );
  
  notifyListeners();
}


// addEditOrderFile(String data){
//  var  file= File(data);
//   var filetobase64= getBase64(data);
//   log("PATH    ${file.path}");
//   // imagePath =data;
//   newFiles.add( 
//     UploadFile( 
      
//       path: file.path,
//       extension: getFileExtenstion(file.path) , fileBase64: filetobase64)
//   );

//   notifyListeners();
// }
removeEditOrderFile(String hasCode){
 log(hashCode);
  newFiles.removeWhere( 
    (file)=> file.path==hasCode
  );
  
  notifyListeners();
}


setFile(String data){
fileDoc= File(data);
fileBase64=getBase64(data);
filePath=data;
notifyListeners();
removeImage();
}
setOrderAccept(String id){
  orderIdToAccept= id;
  notifyListeners();
}
removeImage(){
  imageFile= null;
  base64Image= null;
  notifyListeners();
}
clearFile(){
  fileDoc= null;
  fileBase64= null;

  notifyListeners();
}
ApiResponse<OrderDetailMapper>?  orderDetailsMapper = 
ApiResponse.loading(null);

ApiResponse<OrderDetailMapper>?  ordeEditMapper = 
ApiResponse.loading(null);

List<Map>  modelTypes =[
  {
"en":"Machiens",
"ar":"الماكينات" ,
"value":'Asset'
  },

 {
"en":"Cars",
"ar":"السيارات" ,
"value":'Car'
  },

 {
"en":"Branches",
"ar":"الفروع" ,
"value":'Branch'
  },
 {
"en":"Departments",
"ar":"الاقسام" ,
"value":'Department'
  },

   {
"en":"Houses",
"ar":"السكنات" ,
"value":'Skin'
  },
   {
"en":" Other Assets",
"ar":"الاصول الاخرى" ,
"value":'OtherAsset'
  },


];



List<Map>  statusList =[
  {
"en":"Created",
"ar":"قيد الانشاء" ,
"value":'0'
  },

 {
"en":"Closing",
"ar":"قيد الاغلاق" ,
"value":'1'
  },

 {
"en":"Closed",
"ar":"تم الاغلاق" ,
"value":'2'
  },
 


];




List<Map>  perioicList =[


  {
"en":"change oil",
"ar":"تغيير زيت" ,
"id":0
  },
 {
"en":"Flatters",
"ar":"الفلاتر" ,
"id":1
  },
 {
"en":"Check",
"ar":"الفحص" ,
"id":2
  },
   {
"en":"Tuers",
"ar":"اطارات" ,
"id":3
  },



];


int? selectedOption =0;
int? selectedMaintenanceType =0;



Map? getSelectedModelObject(){
  if (selectedModel==null) {
    return null;
  }else {
   Map? value= modelTypes.firstWhere((e)=>  e['value']==selectedModel);
    

    return value;

  }
}



Map? getSelectedStatusObject(){
  if (selectedStatus==null) {
    return null;
  }else {
   Map? value= statusList.firstWhere((e)=>  e['value']==selectedStatus);
    

    return value;

  }
}

setselectedStatus(status){
  selectedStatus=status;
  notifyListeners();
}


clearFilter(){
  filterLink='';
  startDate=null;
  endDate=null;
  selectedModel=null;
  selectedStatus=null;
  notifyListeners();
}


setFilterLink(
  
  BuildContext context,
  String type , String status){
 
  // filterLink = 'status=$selectedStatus&start_date=$startDate&end_date=$endDate&model_type=$selectedModel';
filterLink='';


if (selectedStatus!=null) {
  filterLink='${filterLink}status=$selectedStatus&';
}
// if (status!=null) {
  filterLink='${filterLink}status=$status&';
// }


if (startDate!=null) {
    filterLink='${filterLink}start_date=${     getUsaualDate(startDate!.toString())}&';

}

if (endDate!=null) {
    filterLink='${filterLink}end_date=${     getUsaualDate(endDate!.toString())}&';

}
if (selectedModel!=null) {
    filterLink='${filterLink}model_type=$selectedModel';

}




updateMaintainOrder(){
  ///api/maintain/update/{maintain_id}   api
  ///
  ////
  ///
  ///
  /*

$maintain->update([
           'task'           => $request['task'],
           'immedatly'      => $request['immedatly'],
           'maintain_type'  => $request['maintain_type'],
           'maintain_cat'   => $request['maintain_cat'],
           'files'          => json_encode($request['files'])
        ]);

  */
}



  log(filterLink);
  if (type=="maintain") {
  getFiliterUserOrders(context);
  }else {
    geFiltertMaintainOrders(context);

  }
  notifyListeners();
}

// setModelType(String modelType){

// }
setStatus(String status){
selectedStatus = status;
}


ApiResponse<List<OtherAsset>>?  otherAssets = ApiResponse.completed([]);

List<FileModel>  newOrderFiles = [];
String? modelId;
String? modelType;
MaintainModel? maintainModel;
String? task;


setSelectedOption(int? value){
  selectedOption =value;
  notifyListeners();
}
setSelectedMaintenanceType(int? value){
  selectedMaintenanceType =value;
  notifyListeners();
}

setEmdeiate(bool value){
  isEmediate=value;
  notifyListeners();
}
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
setFilterModelType( type){
  selectedModel=type;
  notifyListeners();
}
setStartDate(String? value){
  startDate=value;
  notifyListeners();
}

setEndDate(String? value){
  endDate=value;
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
clearEditFiles(){
  newFiles.clear();
  notifyListeners();
}
removeEditFile(String path){
 newFiles.removeWhere((file)=>file.path==path);
  notifyListeners();
}
filterUserRoders(int status){
  //  spaceSearch = [];
  //   if(startingPrice > 0 && endingPrice > startingPrice) {
  //     spaceSearch.addAll( spaces.where((product) =>
  //    double.parse( product.price!.toString()) > startingPrice && double.parse( product.price!.toString()) < endingPrice).toList());
  //   }else {
  //     spaceSearch.addAll(spaces);
  //   }
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




Future<void> getRegions(BuildContext context)async{
   regions = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await CommmomApis().getRegions();



    regions=ApiResponse.completed(response);
  } catch (e) {
       regions = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}
Future<void> getStatusData(BuildContext context)async{
   orderStatusData = ApiResponse.loading('loading');

isBusy= true;
notifyListeners();
  try {
    var  response = await MaintenanceApis().getOrderStatusData();



    orderStatusData=ApiResponse.completed(response);
  } catch (e) {
       orderStatusData = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}




Future<void> getRegionCities(BuildContext context , regionId)async{
   cities = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await CommmomApis().getCitiesByRegion(regionId);



    cities=ApiResponse.completed(response);
  } catch (e) {
       cities = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}



Future<void> getCityBranches(BuildContext context , city)async{
   branches = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await CommmomApis().getBranchesByCity(city);



    branches=ApiResponse.completed(response);
  } catch (e) {
       branches = ApiResponse.error('$e');
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









Future<void> getDepartements(BuildContext context ,

)async{
   departments2 = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await MaintenanceApis().getDepartments2();



    departments2=ApiResponse.completed(response);
  } catch (e) {
       departments2 = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 
  }
}




Future<void> getDepartementAssets(BuildContext context ,
String dept
)async{
   departmeentAssets = ApiResponse.loading('loading');

isBusy= true;

  try {
    var  response = await MaintenanceApis().getDepartmentAssets(dept);



    departmeentAssets=ApiResponse.completed(response);
  } catch (e) {
   
       departmeentAssets = ApiResponse.error('$e');
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
addEdit(File file){
var base64 = getBase64(file.path);
var fileName = getFileName(file.path);
var extenstion= getFileExtenstion(file.path);
var fileModel = FileModel(fileName: fileName, path: file.path,   )
..setExtension(extenstion)
..setBase64(base64);
newFiles.add(fileModel);
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


addOrder(BuildContext context ,  maintainType , option , walkway)async{
  newOrder = ApiResponse.loading('sdfds');
  notifyListeners();
  try {
    log(getFiles(
  newOrderFiles
).toString());
     log(task.toString());
var response = await MaintenanceApis().addOrder(
  maintainModel!.id.toString(), modelType, modelId, task,
   getFiles(
  newOrderFiles , 
) ,  selectedMaintenanceType , maintainType ,option, walkway);
  newOrder =ApiResponse.completed({});
  notifyListeners();
    const Success().launch(context , isNewTask: true);
   newOrderFiles=[];
  //  if (response) {
     
  //  }
    
  } catch (e) {
    log("add order $e");
    newOrder =ApiResponse.error(e.toString());
  }finally{

    notifyListeners();
  }
}



updateOrder2(BuildContext context , order,
task , immeditaley, List oldFiles ,
 List<FileModel> newFiles,
 {
  Function(bool)? isSuccess
 }
)async{
  updateOrder = ApiResponse.loading('loading');
  notifyListeners();
  try {
    log(getFiles(
  newOrderFiles
).toString());
     log(task.toString());
var response = await MaintenanceApis().updateOrder(
 order,task ,immeditaley ,
  oldFiles ,

   getFiles(
  newFiles , 
) );
  updateOrder =ApiResponse.completed({});
  notifyListeners();
    // const Success().launch(context , isNewTask: true);
   newOrderFiles=[];
  //  if (response) {
     
  //  }
    isSuccess!(true);
  } catch (e) {
    log("update my order $e");
        isSuccess!(false);

    updateOrder =ApiResponse.error(e.toString());
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
String? regeionId

)async{
   maintenanceEmployees = ApiResponse.loading('loading');

isBusy= true;
notifyListeners();
  try {
    var  response = await MaintenanceApis().getMaintenanceEmployee(regeionId);



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


Future<void> geFiltertMaintainOrders(BuildContext context ,


)async{
   maintainOrders = ApiResponse.loading('loading');
adminOrders=[];

notifyListeners();
  try {
    var  response = await MaintenanceApis().filterMaintainOrder(
      filterLink
    );



    maintainOrders=ApiResponse.completed(response);
   List<OrderMapper> data=[]; 
for (var item in maintainOrders!.data!.data!.data!) {
  data.add(
    OrderMapper(
        orderCreaterId: item.adminId!.toString() ,
        fromMe: sharedPrefs.user_id== item.adminId.toString(),
          confirmd:item.forwardTo!.confirmed,
      
  orderId:item.id,
 maintainOrderId:item.forwardTo!.maintainId , 
model_name_ar: item.model_name_ar,
model_name_en: item.model_name_en,

  createrName:   '',

   forwardToId:item.adminId.toString(),
  forwardToName:item.forwardTo!.admin!.name,
  status:item.status,
 
   immediately:item.immedatly,
  files:  item.files,
  modelType:item.modelType,
  modelId: item.modelId.toString(),
 task:item.task,
 orderDate:item.forwardTo!.createdAt,
   records: [],
    )
  );
}





    adminOrders.addAll(data);
    log('DOTAT');
    notifyListeners();
  } catch (e) {
       maintainOrders = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 

      notifyListeners();
  }
}



Future<void> getMaintainOrders(BuildContext context ,

String? status
)async{
   maintainOrders = ApiResponse.loading('loading');
adminOrders=[];
notifyListeners();
  try {
    log("GET_ORDER3{MAINN}");

    var  response = await MaintenanceApis().getMaintainOrder(status);



    maintainOrders=ApiResponse.completed(response);
    log("GET_ORDER4{MAINN}");


List<OrderMapper> data=[];    


for (var item in maintainOrders!.data!.data!.data!) {
  data.add(
    OrderMapper(
        orderCreaterId: item.adminId!.toString() ,
        fromMe: sharedPrefs.user_id== item.adminId.toString(),
          confirmd:item.forwardTo!.confirmed,
      
  orderId:item.id,
 maintainOrderId:item.forwardTo!.maintainId , 
model_name_ar: item.model_name_ar,
model_name_en: item.model_name_en,
  createrName:   '',

   forwardToId:item.adminId.toString(),
  forwardToName:item.forwardTo!.admin!.name,
  status:item.status,
 
   immediately:item.immedatly,
  files:  item.files,
  modelType:item.modelType,
  modelId: item.modelId.toString(),
 task:item.task,
 orderDate:item.forwardTo!.createdAt,
   records: [],
    )
  );
}





    adminOrders.addAll(data);
    log('DOTAT');
    notifyListeners();
  } catch (e) {
       maintainOrders = ApiResponse.error('$e');
notifyListeners();

  }finally{
      isBusy= false; 

      notifyListeners();
  }
}



Future<void> getMaintainOrdersPaginate(BuildContext context ,
String nextUrl

)async{
   maintainOrdersPaginate = ApiResponse.loading('loading');

notifyListeners();
  try {
    var  response = await MaintenanceApis().getMaintainOrder(
      status,
      nextUrl, true
    );


    maintainOrdersPaginate=ApiResponse.completed(response);
    maintainOrders=maintainOrdersPaginate;
  List<OrderMapper> data=[]; 
for (var item in maintainOrders!.data!.data!.data!) {
  data.add(
    OrderMapper(
        orderCreaterId: item.adminId!.toString() ,
        fromMe: sharedPrefs.user_id== item.adminId.toString(),
          confirmd:item.forwardTo!.confirmed,
      
  orderId:item.id,
 maintainOrderId:item.forwardTo!.maintainId , 
model_name_ar:  item.model_name_ar 
,
model_name_en: item.model_name_en,
  createrName:   '',

   forwardToId:item.adminId.toString(),
  forwardToName:item.forwardTo!.admin!.name,
  status:item.status,
 
   immediately:item.immedatly,
  files:  item.files,
  modelType:item.modelType,
  modelId: item.modelId.toString(),
 task:item.task,
 orderDate:item.forwardTo!.createdAt,
   records: [],
    )
  );
}





    adminOrders.addAll(data);
    notifyListeners();
  } catch (e) {
       maintainOrdersPaginate = ApiResponse.error('$e');
notifyListeners();
log("/////////////////////////   $e");
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}














Future<void> getUserOrders(BuildContext context ,

   {
String?  status=''
  }
)async{
   userOrders = ApiResponse.loading('loading');
userOrdersData=[];
notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().getUserOrders(
      '',false , status
      
      );


    userOrders=ApiResponse.completed(response , );
List<OrderMapper> data=[]; 
for (var item in userOrders!.data!.data!) {
  data.add(

    OrderMapper(
        orderCreaterId: item.maintainOrder!.admin!.name ,
        fromMe: sharedPrefs.user_id== item.maintainOrder!.adminId.toString(),
          confirmd:item.confirmed,
      model_name_ar: item.maintainOrder!.model_name_ar,
      model_name_en: item.maintainOrder!.model_name_en,
  orderId:item.id,
 maintainOrderId:item.maintainOrder!.id , 

  createrName:   item.maintainOrder!.admin!.name,

   forwardToId:item.adminId.toString(),
  forwardToName:'',
  status:item.maintainOrder!.status,
 
   immediately:item.maintainOrder!.immedatly,
  files:  item.maintainOrder!.files,
  modelType:item.maintainOrder!.modelType.toString(),
  modelId: item.maintainOrder!.modelId.toString(),
 task:item.maintainOrder!.task.toString(),
 orderDate:item.createdAt,
   records: [],
    )
  
  );
}

    userOrdersData.addAll(data);
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


Future<void> refreshUserOrders(BuildContext context ,

   {
String?  status=''
  }
)async{
  //  userOrders = ApiResponse.loading('loading');
userOrdersData=[];
notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().getUserOrders(
      '',false , status
      
      );


    userOrders=ApiResponse.completed(response , );
List<OrderMapper> data=[]; 
for (var item in userOrders!.data!.data!) {
  data.add(

    OrderMapper(
        orderCreaterId: item.maintainOrder!.admin!.name ,
        fromMe: sharedPrefs.user_id== item.maintainOrder!.adminId.toString(),
          confirmd:item.confirmed,
      
  orderId:item.id,
 maintainOrderId:item.maintainOrder!.id , 
model_name_ar: item.maintainOrder!.model_name_ar,
      model_name_en: item.maintainOrder!.model_name_en,
  createrName:   item.maintainOrder!.admin!.name,

   forwardToId:item.adminId.toString(),
  forwardToName:'',
  status:item.maintainOrder!.status,
 
   immediately:item.maintainOrder!.immedatly,
  files:  item.maintainOrder!.files,
  modelType:item.maintainOrder!.modelType.toString(),
  modelId: item.maintainOrder!.modelId.toString(),
 task:item.maintainOrder!.task.toString(),
 orderDate:item.createdAt,
   records: [],
    )
  
  );
}

    userOrdersData.addAll(data);
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




Future<void> getFiliterUserOrders(BuildContext context ,

)async{
   userOrders = ApiResponse.loading('loading');
userOrdersData=[];
notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().filterUserOrders(
     filterLink
      
      );



    userOrders=ApiResponse.completed(response , );
    List<OrderMapper> data=[]; 
for (var item in userOrders!.data!.data!) {
  log('USER FILER NO PROBLEM 1');
  data.add(
    OrderMapper(
        orderCreaterId: item.maintainOrder!.admin!.name ,
        fromMe: sharedPrefs.user_id== item.adminId.toString(),
          confirmd:item.confirmed,
      
  orderId:item.id,
 maintainOrderId:item.maintainOrder!.id , 
model_name_ar: item.maintainOrder!.model_name_ar,
      model_name_en: item.maintainOrder!.model_name_en,
  createrName:   item.maintainOrder!.admin!.name,

   forwardToId:item.adminId.toString(),
  forwardToName:'',
  status:item.maintainOrder!.status,
 
   immediately:item.maintainOrder!.immedatly,
  files:  item.maintainOrder!.files!,
  modelType:item.maintainOrder!.modelType,
  modelId: item.maintainOrder!.modelId.toString(),
 task:item.maintainOrder!.task,
 orderDate:item.createdAt,
   records: [],
    )
  );
}

   log('USER FILER NO PROBLEM');


    userOrdersData.addAll(data);
    // notifyListeners();
  } catch (e) {
    log('USER FILER$e');
       userOrders = ApiResponse.error('$e');
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}




Future<void> getUserOrdersPaginate(BuildContext context ,

String nextUrl, 
 {
String?  status
  }
)async{

   userOrderPaginate = ApiResponse.loading('loading');
notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().getUserOrders(
      nextUrl,
      true ,   null);



    userOrderPaginate=ApiResponse.completed(response , );
    userOrders =userOrderPaginate;
    List<OrderMapper> data=[]; 
for (var item in userOrders!.data!.data!) {
  data.add(
    OrderMapper(
        orderCreaterId: item.maintainOrder!.admin!.name ,
        fromMe: sharedPrefs.user_id== item.adminId.toString(),
          confirmd:item.confirmed,
      
  orderId:item.id,
 maintainOrderId:item.maintainOrder!.id , 
model_name_ar: item.maintainOrder!.model_name_ar,
      model_name_en: item.maintainOrder!.model_name_en,
  createrName:   item.maintainOrder!.admin!.name,

   forwardToId:item.adminId.toString(),
  forwardToName:'',
  status:item.maintainOrder!.status,
 
   immediately:item.maintainOrder!.immedatly,
  files:  item.maintainOrder!.files,
  modelType:item.maintainOrder!.modelType,
  modelId: item.maintainOrder!.modelId.toString(),
 task:item.maintainOrder!.task,
 orderDate:item.createdAt,
   records: [],
    )
  );
}
    userOrdersData.addAll(data);
    // notifyListeners();
  } catch (e) {
    log(
      "USER PAGINATED  $e");
       userOrderPaginate = ApiResponse.error('$e');
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
String desc ,
file , extension
)async{
addRecordStatus= ApiResponse.loading('loading');
notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().addRecord(sharedPrefs.user_id,
     orderId, desc, file , extension);


await
getOrderRecord(context, orderId);

recordFile=null;
    notifyListeners();
    
  } catch (e) {
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 
addRecordStatus= ApiResponse.completed('loading');
notifyListeners();
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

showToast(
  
  currentLang(context)=="ar"?
  "تم تأكيد الطلب":
  
  'Order Confimed Successfully', false);

    // notifyListeners();
  } catch (e) {
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}





Future<void> closingOrder(
  BuildContext context ,

String orderId ,
)async{

notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().confrimOrder(orderId);

showToast(
  
  currentLang(context)=="ar"?
  "تم تأكيد الطلب":
  
  'Order Confimed Successfully', false);

    // notifyListeners();
  } catch (e) {
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 

      notifyListeners();
  }
}




Future<void> updateOrderStatus(
  BuildContext context ,
String orderId ,

String? reason,
String? status
)async{
updateOrder = ApiResponse.loading('ladong');
notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().updateOrderStatus(orderId, reason ,status);
updateOrder = ApiResponse.completed(response);

showToast(
  
  currentLang(context)=="ar"?
  "تم تحديث الطلب":
  
  'Order Updated', false);
// getUserOrders(context, status: status);
    // notifyListeners();
  } catch (e) {
notifyListeners();
showToast(e.toString(), true);
updateOrder = ApiResponse.error(e.toString());

  }finally{
      isBusy= false; 

      notifyListeners();
  }
}





Future<void> changeOrderStatus(
  BuildContext context ,


String orderId ,
String status ,
List<UploadFile> files
)async{
changeStatusState= ApiResponse.loading("loading");
notifyListeners();
  try {
    var  response = await 
    
    MaintenanceApis().changeOrderStatus(orderId, status  ,  files);

showToast(
  
  currentLang(context)=="ar"?"تم تغيير حالة الطلب":
  'Status changed successfully', false);
changeStatusState= ApiResponse.completed("done");
notifyListeners();
  refreshOrderDetails(!sharedPrefs.isMaintain, orderId);

    // notifyListeners();
  } catch (e) {
notifyListeners();
showToast(e.toString(), true);
  }finally{
      isBusy= false; 
clearFile();
removeImage();
      notifyListeners();
  }
}






//load order data by 

Future<void> getOrderDetails(
  bool isAdmin , String modelId, 
  {
    bool isEdit =false,
    Function(OrderDetailMapper?, bool)? onData
  }
)async{
  orderDetailsMapper = ApiResponse.loading('loading');
notifyListeners();
try {
   log("NO_CARE_ASSET{UNKNWON}");
  
if (!isAdmin) {
     log("NO_CARE_ASSET{MAINTAIN}");

  var response = await MaintenanceApis().
  getOrderDetails("maintain/get_admin_order/$modelId");
// log(response['data'].toString());
 var adminOrder= AdminOrderDetails.fromJson(response);
 log("NO_CARE_ASSET${adminOrder.data!.maintainOrder!.toJson()}");

 orderDetailsMapper = ApiResponse.completed(
  
  
  
   OrderDetailMapper(

     maintainStats: adminOrder.data!.maintainOrder!.status.toString(),
    
     orderStatus: adminOrder.data!.maintainOrder!.status.toString(),
     submittedOrder: adminOrder.data!.maintainId.toString() ,
     
modelType: adminOrder.data!.maintainOrder!.modelType,
reject_resion: adminOrder.data!.maintainOrder!.reject_resion ,
// model_name_ar: adminOrder.data.maintainOrder.m,
orderUserId: adminOrder.data!.adminId!.toString(),
     orderId: adminOrder.data!.maintainId.toString(),
    confirmed: adminOrder.data!.confirmed,
    task: adminOrder.data!.maintainOrder!.task,
     from: adminOrder.data!.maintainOrder!.admin!.name ,
    status: adminOrder.data!.maintainOrder!.status.toString(),
     to: adminOrder.data!.admin!.name!,
model_name_ar: adminOrder.data!.maintainOrder!.model_name_ar,
model_name_en:adminOrder.data!.maintainOrder!.model_name_en,
     date: adminOrder.data!.createdAt, file: 
     adminOrder.data!.maintainOrder!.files ,  
     
     maintainanceAsset: MaintainanceAsset.makeAsset(adminOrder.data!.maintainOrder!.model!.toJson(), 
     adminOrder.data!.maintainOrder!.modelType!)
     
     )
 );

}else {
   log("NO_CARE_ASSET{ORDER}");

  var response = await MaintenanceApis().
  getOrderDetails("maintain/show_submitted_order/$modelId");

  var userOrder =
   MaintainOrderDetails.fromJson(response);

 log("NO_CARE_ASSET${userOrder.data!.model!.toJson()}");


 orderDetailsMapper = ApiResponse.completed(
   
   OrderDetailMapper(
     reject_resion:userOrder.data!.forwardTo!.reject_resion ,
      maintainStats: userOrder.data!.status.toString(),
     orderStatus: userOrder.data!.status.toString().toString(),
     submittedOrder: userOrder.data!.forwardTo!.maintainId.toString() ,
modelType: userOrder.data!.modelType,

orderUserId: userOrder.data!.forwardTo!.adminId!.toString(),
     
     immedatly: userOrder.data!.immedatly,
     
     
model_name_ar: userOrder.data!.model_name_ar,   
model_name_en:userOrder.data!.model_name_en ,  
     orderId: userOrder.data!.id.toString(),
    confirmed: userOrder.data!.forwardTo!.confirmed,
    task: userOrder.data!.task, from: userOrder.data!.forwardTo!.admin!.name ,
      status: userOrder.data!.status.toString(),
     to:userOrder.data!.forwardTo!.admin!.name,
     date: userOrder.data!.createdAt, file: 
     userOrder.data!.files, 
     
     
       maintainanceAsset: MaintainanceAsset.makeAsset(userOrder.data!.model!.toJson(), 
     userOrder.data!.modelType!)
     )
 );




}
notifyListeners();

if (isEdit && orderDetailsMapper!.data!=null ) {
  onData!(orderDetailsMapper!.data!, true);
}





} catch (e) {
  if (isEdit) {
      onData!(null, false);
  }
  

  orderDetailsMapper = ApiResponse.error(e.toString());
}finally{

  notifyListeners();
}







}



Future<void> getOrderDetailsForEdit(
  bool isAdmin , String modelId, 
  {
    bool isEdit =false,
    Function(OrderDetailMapper?, bool)? onData
  }
)async{
  ordeEditMapper = ApiResponse.loading('loading');
notifyListeners();
try {
  
if (!isAdmin) {

  var response = await MaintenanceApis().
  getOrderDetails("maintain/get_admin_order/$modelId");
 var adminOrder= AdminOrderDetails.fromJson(response);

 ordeEditMapper = ApiResponse.completed(
  
  
  
   OrderDetailMapper(
reject_resion:adminOrder.data!.maintainOrder!.reject_resion ,
     maintainStats: adminOrder.data!.maintainOrder!.status.toString(),
    
     orderStatus: adminOrder.data!.maintainOrder!.status.toString(),
     submittedOrder: adminOrder.data!.maintainId.toString() ,
     
modelType: adminOrder.data!.maintainOrder!.modelType,
model_name_ar: adminOrder.data!.maintainOrder!.model_name_ar,
model_name_en:adminOrder.data!.maintainOrder!.model_name_en ,
orderUserId: adminOrder.data!.adminId!.toString(),
     orderId: adminOrder.data!.maintainId.toString(),
    confirmed: adminOrder.data!.confirmed,
    task: adminOrder.data!.maintainOrder!.task,
     from: adminOrder.data!.maintainOrder!.admin!.name ,
    status: adminOrder.data!.maintainOrder!.status.toString(),
     to: adminOrder.data!.admin!.name!,

     date: adminOrder.data!.createdAt, file: 
     adminOrder.data!.maintainOrder!.files ,  
     
     maintainanceAsset: MaintainanceAsset.makeAsset(adminOrder.data!.maintainOrder!.model!.toJson(), 
     adminOrder.data!.maintainOrder!.modelType!)
     
     )
 );

}else {
  
  var response = await MaintenanceApis().
  getOrderDetails("maintain/show_submitted_order/$modelId");
// log(response['data'].runtimeType.toString());
// log("NO PROBLEM");
  var userOrder =
   MaintainOrderDetails.fromJson(response);


log({
      "maintainStats": userOrder.data!.status.toString(),
     "orderStatus": userOrder.data!.status.toString().toString(),
     "submittedOrder": userOrder.data!.forwardTo!.maintainId.toString() ,
"modelType": userOrder.data!.modelType,

"orderUserId": userOrder.data!.forwardTo!.adminId.toString(),
     
     "immedatly": userOrder.data!.immedatly??0,
     
     
     
     "orderId": userOrder.data!.id.toString(),
    "confirmed": userOrder.data!.forwardTo!.confirmed,
    "task": userOrder.data!.task, "from": userOrder.data!.forwardTo!.admin!.name ,
      status: userOrder.data!.status.toString(),
     "to":userOrder.data!.forwardTo!.admin!.name,
     "date": userOrder.data!.createdAt, 
     "file": 
     userOrder.data!.files, 
     
     
       "maintainanceAsset": MaintainanceAsset.makeAsset(userOrder.data!.model!.toJson(), 
     userOrder.data!.modelType.toString())
}.toString());
 ordeEditMapper = ApiResponse.completed(
   
   OrderDetailMapper(
     reject_resion: userOrder.data!.forwardTo!.reject_resion,
      maintainStats: userOrder.data!.status.toString(),
     orderStatus: userOrder.data!.status.toString().toString(),
     submittedOrder: userOrder.data!.forwardTo!.maintainId.toString() ,
modelType: userOrder.data!.modelType,

orderUserId: userOrder.data!.forwardTo!.adminId.toString(),
     
     immedatly: userOrder.data!.immedatly??0,
     model_name_ar: userOrder.data!.model_name_ar,
     model_name_en: userOrder.data!.model_name_en,
     
     orderId: userOrder.data!.id.toString(),
    confirmed: userOrder.data!.forwardTo!.confirmed,
    task: userOrder.data!.task, from: userOrder.data!.forwardTo!.admin!.name ,
      status: userOrder.data!.status.toString(),
     to:userOrder.data!.forwardTo!.admin!.name,
     date: userOrder.data!.createdAt, 
     file: 
     userOrder.data!.files, 
     
     
       maintainanceAsset: MaintainanceAsset.makeAsset(userOrder.data!.model!.toJson(), 
     userOrder.data!.modelType.toString())
     )
 );




}
notifyListeners();

if (isEdit && ordeEditMapper!.data!=null ) {
  onData!(ordeEditMapper!.data!, true);
}





} catch (e) {
    onData!(null, false);

  ordeEditMapper = ApiResponse.error(e.toString());
}finally{

  notifyListeners();
}







}









Future<void> refreshOrderDetails(
  bool isAdmin , String modelId
)async{
  // orderDetailsMapper = ApiResponse.loading('loading');

try {
  
if (!isAdmin) {
  var response = await MaintenanceApis().
  getOrderDetails("maintain/get_admin_order/$modelId");
log(response['data'].toString());
 var adminOrder= AdminOrderDetails.fromJson(response);


 orderDetailsMapper = ApiResponse.completed(
   OrderDetailMapper(

     maintainStats: adminOrder.data!.maintainOrder!.status.toString(),
    
     orderStatus: adminOrder.data!.maintainOrder!.status.toString(),
     submittedOrder: adminOrder.data!.maintainId.toString() ,
     
modelType: adminOrder.data!.maintainOrder!.modelType,
model_name_ar: adminOrder.data!.maintainOrder!.model_name_ar,
model_name_en:adminOrder.data!.maintainOrder!.model_name_en ,
orderUserId: adminOrder.data!.adminId!.toString(),
     orderId: adminOrder.data!.maintainId.toString(),
    confirmed: adminOrder.data!.confirmed,
    task: adminOrder.data!.maintainOrder!.task,
     from: adminOrder.data!.maintainOrder!.admin!.name ,
    status: adminOrder.data!.maintainOrder!.status.toString(),
     to: adminOrder.data!.admin!.name!,

     date: adminOrder.data!.createdAt, file: 
     adminOrder.data!.maintainOrder!.files ,  
     
     maintainanceAsset: MaintainanceAsset.makeAsset(adminOrder.data!.maintainOrder!.model!.toJson(), 
     adminOrder.data!.maintainOrder!.modelType!)
     
     )
 );

}else {
  var response = await MaintenanceApis().
  getOrderDetails("maintain/show_submitted_order/$modelId");
log(response['data'].runtimeType.toString());
log("NO PROBLEM");
  var userOrder =
   MaintainOrderDetails.fromJson(response);

 orderDetailsMapper = ApiResponse.completed(
   
   OrderDetailMapper(
     
      maintainStats: userOrder.data!.status.toString(),
     orderStatus: userOrder.data!.status.toString().toString(),
     submittedOrder: userOrder.data!.forwardTo!.maintainId.toString() ,
modelType: userOrder.data!.modelType,

orderUserId: userOrder.data!.forwardTo!.adminId!.toString(),
     
     
     model_name_ar: userOrder.data!.model_name_ar,
     model_name_en: userOrder.data!.model_name_en,
     
     orderId: userOrder.data!.id.toString(),
    confirmed: userOrder.data!.forwardTo!.confirmed,
    task: userOrder.data!.task, from: userOrder.data!.forwardTo!.admin!.name ,
      status: userOrder.data!.status.toString(),
     to:userOrder.data!.forwardTo!.admin!.name,
     date: userOrder.data!.createdAt, file: 
     userOrder.data!.files, 
     
     
       maintainanceAsset: MaintainanceAsset.makeAsset(userOrder.data!.model!.toJson(), 
     userOrder.data!.modelType!)
     )
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