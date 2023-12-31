import 'dart:convert';

class CarModel {
  int? id;
  String? bordNumber;
  String? carType;
  String? bodyNum;
  String? carMark;
  int? adminId;
  List<String>? files;
  String? createdAt;
  String? updatedAt;

  CarModel(
      {this.id,
      this.bordNumber,
      this.carType,
      this.bodyNum,
      this.carMark,
      this.adminId,
      this.files,
      this.createdAt,
      this.updatedAt});

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bordNumber = json['bord_number'];
    carType = json['car_type'];
    bodyNum = json['body_num'];
    carMark = json['car_mark'];
    adminId = json['admin_id'];
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
    data['bord_number'] = this.bordNumber;
    data['car_type'] = this.carType;
    data['body_num'] = this.bodyNum;
    data['car_mark'] = this.carMark;
    data['admin_id'] = this.adminId;
    data['files'] = this.files;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
