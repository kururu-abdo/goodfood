import 'dart:convert';
import 'dart:developer';

class MaintainOrderDetails {
  int? code;
  MaintainOrderData? data;

  MaintainOrderDetails({this.code, this.data});

  MaintainOrderDetails.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ?  MaintainOrderData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MaintainOrderData {
  int? id;
  int? adminId;
  String? modelType;
  int? modelId;
  dynamic machines;
  String? task;
 List<dynamic>? files;
  int? status;
  int? immedatly;
  String? createdAt;
  String? updatedAt;
  Model? model;
  ForwardTo? forwardTo;
String? model_name_ar;
String? model_name_en;
  MaintainOrderData(
      {this.id,
      this.adminId,
      this.modelType,
      this.modelId,
      this.machines,
      this.task,
      this.files,
      this.status,
      this.immedatly,
      this.createdAt,
      this.updatedAt,
      this.model,
      this.model_name_ar ,this.model_name_en,
      this.forwardTo});

  MaintainOrderData.fromJson(Map<String, dynamic> json) {
   
    id = json['id'];
    adminId = json['admin_id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    machines = json['machines'];
model_name_ar =json['model_name_ar'];
model_name_en =json['model_name_en'];

    task = json['task'];
     files=[];
     
if (!json.containsKey("files")) {
        log("FILSE NO PROBLEMA KEY");
  
     files=[];


}
else if( (json['files'].toString()==null.toString()) ){
          log("FILSE NO PROBLEMA NULL");

     files=[];

}
else if((jsonDecode( json['files'].toString()) as List).isEmpty){
          log("FILSE NO PROBLEMA DECODE");

     files=[];

}
else {
          log("FILSE NO PROBLEMA ELSE ");

  for (var v in (jsonDecode( json['files'].toString()) as List)) { 

   files!.add(v);
 }
}
    status = json['status'];
    immedatly = json['immedatly'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    model = json['model'] != null ? Model.fromJson(json['model']) : null;
    forwardTo = json['forward_to'] != null
        ? ForwardTo.fromJson(json['forward_to'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['admin_id'] = adminId;
    data['model_type'] = modelType;
    data['model_id'] = modelId;
    data['machines'] = machines;
    data['task'] = task;
    data['files'] = files;
    data['status'] = status;
    data['immedatly'] = immedatly;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (model != null) {
      data['model'] = model!.toJson();
    }
    if (forwardTo != null) {
      data['forward_to'] = forwardTo!.toJson();
    }
    return data;
  }
}

class Model {
  int? id;
  String? bordNumber;
  String? carType;
  String? bodyNum;
  String? carMark;
  int? adminId;
   List<dynamic>? files;
  String? createdAt;
  String? updatedAt;
String? nameAr;
String? nameEn;
  Model(
      {this.id,
      this.bordNumber,
      this.carType,
      this.bodyNum,
      this.nameAr,
      this.nameEn,
      this.carMark,
      this.adminId,
      this.files,
      this.createdAt,
      this.updatedAt});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr=json['name_ar'];
    nameEn= json['name_en'];
    bordNumber = json['bord_number'];
    carType = json['car_type'];
    bodyNum = json['body_num'];
    carMark = json['car_mark'];
    adminId = json['admin_id'];
 if (json['files']!=null) {
    files=[];

 for (var v in (jsonDecode( json['files'].toString()) as List)) { 

   files!.add(v);
 }
}else {
  files=[];
}
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bord_number'] = bordNumber;
    data['car_type'] = carType;
    data['body_num'] = bodyNum;
    data['car_mark'] = carMark;
    data['admin_id'] = adminId;
    data['files'] = files;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
  data['name_ar']=   nameAr;
   data['name_en']= nameEn;
    return data;
  }
}

class ForwardTo {
  int? id;
  int? maintainId;
  int? adminId;
  int? confirmed;
  String? createdAt;
  String? updatedAt;
  Admin? admin;
  dynamic reject_resion;

  ForwardTo(
      {this.id,
      this.reject_resion,
      this.maintainId,
      this.adminId,
      this.confirmed,
      this.createdAt,
      this.updatedAt,
      this.admin});

  ForwardTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maintainId = json['maintain_id'];
    adminId = json['admin_id'];
    confirmed = json['confirmed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reject_resion=json['reject_resion'];
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['maintain_id'] = maintainId;
    data['admin_id'] = adminId;
    data['confirmed'] = confirmed;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (admin != null) {
      data['admin'] = admin!.toJson();
    }
    return data;
  }
}

class Admin {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? regionId;
  String? fcmToken;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Admin(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.regionId,
      this.fcmToken,
      this.active,
      this.createdAt,
      this.updatedAt});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    regionId = json['region_id'];
    fcmToken = json['fcm_token'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['region_id'] = regionId;
    data['fcm_token'] = fcmToken;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
