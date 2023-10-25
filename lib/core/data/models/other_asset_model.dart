class OtherAsset {
  int? id;
  String? nameAr;
  String? nameEn;
  String? desAr;
  String? desEn;
  int? regionId;
dynamic files;
  String? createdAt;
  String? updatedAt;

  OtherAsset(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.desAr,
      this.desEn,
      this.regionId,
      this.files,
      this.createdAt,
      this.updatedAt});

  OtherAsset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    desAr = json['des_ar'];
    desEn = json['des_en'];
    regionId = json['region_id'];
    files = json['files'];
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
    data['region_id'] = this.regionId;
    data['files'] = this.files;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
