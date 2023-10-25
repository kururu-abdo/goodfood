
class DocumentModel {
  int? id;
  String? reciverId;
  String? nameAr;
  String? nameEn;
  List<dynamic>? files;
  String? createdAt;
  String? updatedAt;

  DocumentModel(
      {this.id,
      this.reciverId,
      this.nameAr,
      this.nameEn,
      this.files,
      this.createdAt,
      this.updatedAt});

  DocumentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reciverId = json['reciver_id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    if (json['files']!=null) {
       files=[];
       // jsonDecode(json['files'].toString()
       for (var element in ((json['files']   ) as List  )) {

files!.add(element);
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
    data['reciver_id'] = reciverId;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['files'] = files;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
