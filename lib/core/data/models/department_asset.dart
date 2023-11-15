import 'dart:convert';

class DepartmentAsset {
  int? id;
  String? nameAr;
  String? nameEn;
  String? desAr;
  String? desEn;
  int? departmentId;
  List<String>? files;
  String? createdAt;
  String? updatedAt;

  DepartmentAsset(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.desAr,
      this.desEn,
      this.departmentId,
      this.files,
      this.createdAt,
      this.updatedAt});

  DepartmentAsset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    desAr = json['des_ar'];
    desEn = json['des_en'];
    departmentId = json['department_id'];
    if (json['files'] != null) {
      files = <String>[];
     jsonDecode( json['files'].toString()).forEach((v) {
        files!.add(v);
      });
    }else {
       files = <String>[];
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['des_ar'] = this.desAr;
    data['des_en'] = this.desEn;
    data['department_id'] = this.departmentId;
    data['files'] = this.files;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
