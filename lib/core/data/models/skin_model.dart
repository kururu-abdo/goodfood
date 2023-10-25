class SkinModel {
  int? id;
  String? nameAr;
  String? nameEn;
  String? branchs;
  String? createdAt;
  String? updatedAt;

  SkinModel(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.branchs,
      this.createdAt,
      this.updatedAt});

  SkinModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    branchs = json['branchs'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['branchs'] = this.branchs;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
