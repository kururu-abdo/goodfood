import 'dart:convert';

class ReportModel {
  int? id;
  int? senderId;
 List? reciverId;
  int? brandId;
  int? reportTypeId;
  int? recived;
  String? createdAt;
  String? updatedAt;

  ReportModel(
      {this.id,
      this.senderId,
      this.reciverId,
      this.brandId,
      this.reportTypeId,
      this.recived,
      this.createdAt,
      this.updatedAt});

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];




    if (json['reciver_id']!=null) {
       reciverId=[];
       (jsonDecode(json['reciver_id'].toString() ) as List  ).forEach((element) {

reciverId!.add(element);
       });
    }else {
      reciverId=[];
    }

   




    brandId = json['brand_id'];
    reportTypeId = json['report_type_id'];
    recived = json['recived'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['reciver_id'] = this.reciverId;
    data['brand_id'] = this.brandId;
    data['report_type_id'] = this.reportTypeId;
    data['recived'] = this.recived;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
