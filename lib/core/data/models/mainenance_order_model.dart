import 'dart:convert';



class MaintainenanceOrderModel {
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
  ForwardTo? forwardTo;

  MaintainenanceOrderModel(
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
      this.forwardTo});

  MaintainenanceOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    machines = json['machines'];
    task = json['task'];
 if (json['files'] != null) {
      files = <dynamic>[];
     jsonDecode( json['files'].toString()).forEach((v) {
        files!.add(v);
      });
    }
    status = json['status'];
    immedatly = json['immedatly'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    if (forwardTo != null) {
      data['forward_to'] = forwardTo!.toJson();
    }
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
  dynamic fcmToken;
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
