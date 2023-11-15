import 'dart:convert';

class NewOrderStatus {
  int? id;
  int? adminId;
  String? modelType;
  int? modelId;
 dynamic machines;
  String? task;
  List<String>? files;
  int? status;
  int? immedatly;
  String? createdAt;
  String? updatedAt;

  NewOrderStatus(
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
      this.updatedAt});

  NewOrderStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    machines = json['machines'];
    task = json['task'];
   if (json['files'] != null) {
      files = <String>[];
     jsonDecode( json['files'].toString()).forEach((v) {
        files!.add(v);
      });
    }else {
       files = <String>[];
    }
    status = json['status'];
    immedatly = json['immedatly'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['machines'] = this.machines;
    data['task'] = this.task;
    data['files'] = this.files;
    data['status'] = this.status;
    data['immedatly'] = this.immedatly;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
