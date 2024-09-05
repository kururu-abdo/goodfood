import 'dart:convert';

import 'package:nb_utils/nb_utils.dart';

class OrderData {
  int? currentPage;
  List<UserOrder>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
 dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  OrderData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  OrderData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <UserOrder>[];
      json['data'].forEach((v) {
        data!.add(UserOrder.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class UserOrder {
  int? id;
  int? maintainId;
  int? adminId;
  int? confirmed;
  String? createdAt;
  String? updatedAt;
  String? model_name_ar;
String? model_name_en;
  MaintainOrder? maintainOrder;

  UserOrder(
      {this.id,
      this.maintainId,
      this.adminId,
      this.confirmed,
      this.createdAt,
      this.updatedAt,
      this.model_name_ar,this.model_name_en,
      this.maintainOrder});

  UserOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maintainId = json['maintain_id'];
    adminId = json['admin_id'];
    confirmed = json['confirmed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    model_name_ar = json['model_name_ar'];
    model_name_en=json['model_name_en'];

    log("EN 2$model_name_en");

    log("AR 2$model_name_ar");

    maintainOrder = json['maintain_order'] != null
        ? MaintainOrder.fromJson(json['maintain_order'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['maintain_id'] = maintainId;
    data['admin_id'] = adminId;
    data['confirmed'] = confirmed;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (maintainOrder != null) {
      data['maintain_order'] = maintainOrder!.toJson();
    }
    return data;
  }
}

class MaintainOrder {
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
  Admin? admin;
  String? model_name_ar;
String? model_name_en;
  MaintainOrder(
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
      this.model_name_ar ,this.model_name_en,
      this.admin});

  MaintainOrder.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    id = json['id'];
    model_name_ar = json['model_name_ar'];
    model_name_en = json['model_name_en'];
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
    status = json['status']??0;
    immedatly = json['immedatly'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
