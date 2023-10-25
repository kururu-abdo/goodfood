class BranchModel {
  int? id;
  String? nameAr;
  String? nameEn;
  int? cityId;
  int? brandId;
  String? manegers;
  dynamic files;
  String? admins;
  String? createdAt;
  String? updatedAt;

  BranchModel(
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

  BranchModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['city_id'] = this.cityId;
    data['brand_id'] = this.brandId;
    data['manegers'] = this.manegers;
    data['files'] = this.files;
    data['admins'] = this.admins;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
