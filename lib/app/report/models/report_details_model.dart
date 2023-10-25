import 'dart:convert';

class ReportDetailsModel {
  int? id;
  int? senderId;
  List? reciverId;
  int? brandId;
  int? reportTypeId;
  int? recived;
  String? createdAt;
  String? updatedAt;
  List<Tasks>? tasks;
  ReportType? reportType;
  Brand? brand;

  ReportDetailsModel(
      {this.id,
      this.senderId,
      this.reportType,
      this.reciverId,
      this.brandId,
      this.reportTypeId,
      this.recived,
      this.createdAt,
      this.updatedAt,
      this.tasks,
      this.brand});

  ReportDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
   if (json['reciver_id']!=null) {
       reciverId=[];
       for (var element in (jsonDecode(json['reciver_id'].toString() ) as List  )) {

reciverId!.add(element);
       }
    }else {
      reciverId=[];
    }

    brandId = json['brand_id'];
    reportType= json['type'] != null ? ReportType.fromJson(json['type']) : null;
    reportTypeId = json['report_type_id'];
    recived = json['recived'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(Tasks.fromJson(v));
      });
    }
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['reciver_id'] = reciverId;
    data['brand_id'] = brandId;
    data['report_type_id'] = reportTypeId;
    data['recived'] = recived;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (tasks != null) {
      data['tasks'] = tasks!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    return data;
  }
}

class Tasks {
  int? id;
  int? reportId;
  String? taskAr;
  String? senderDesAr;
  String? taskEn;
  String? senderDesEn;
  String? createdAt;
  String? updatedAt;

  Tasks(
      {this.id,
      this.reportId,
      this.taskAr,
      this.senderDesAr,
      this.taskEn,
      this.senderDesEn,
      this.createdAt,
      this.updatedAt});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportId = json['report_id'];
    taskAr = json['task_ar'];
    senderDesAr = json['sender_des_ar'];
    taskEn = json['task_en'];
    senderDesEn = json['sender_des_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['report_id'] = reportId;
    data['task_ar'] = taskAr;
    data['sender_des_ar'] = senderDesAr;
    data['task_en'] = taskEn;
    data['sender_des_en'] = senderDesEn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Brand {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;
  List<Branchs>? branchs;

  Brand(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.createdAt,
      this.updatedAt,
      this.branchs});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['branchs'] != null) {
      branchs = <Branchs>[];
      json['branchs'].forEach((v) {
        branchs!.add(Branchs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (branchs != null) {
      data['branchs'] = branchs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branchs {
  int? id;
  String? nameAr;
  String? nameEn;
  int? cityId;
  int? brandId;
  String? manegers;
  String? files;
  String? admins;
  String? createdAt;
  String? updatedAt;

  Branchs(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.cityId,
      this.brandId,
      this.manegers,
      this.files,
      this.admins,
      this.createdAt,
      this.updatedAt});

  Branchs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    brandId = json['brand_id'];
    manegers = json['manegers'];
    files = json['files'];
    admins = json['admins'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['city_id'] = cityId;
    data['brand_id'] = brandId;
    data['manegers'] = manegers;
    data['files'] = files;
    data['admins'] = admins;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}



class ReportType {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  ReportType(
      {this.id, this.nameAr, this.nameEn, this.createdAt, this.updatedAt});

  ReportType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
