import 'dart:convert';

import 'package:nb_utils/nb_utils.dart';

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
      this.forwardTo});

  MaintainOrderData.fromJson(Map<String, dynamic> json) {
   
   log("NO PROBLEMA");
    id = json['id'];
    adminId = json['admin_id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    machines = json['machines'];
    task = json['task'];
     files=[];
    if (json['files']!=null) {
   

 for (var v in (jsonDecode( json['files'].toString()) as List)) { 

   files!.add(v);
 }
}else {
  files=[];
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

  Model(
      {this.id,
      this.bordNumber,
      this.carType,
      this.bodyNum,
      this.carMark,
      this.adminId,
      this.files,
      this.createdAt,
      this.updatedAt});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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

  ForwardTo(
      {this.id,
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
