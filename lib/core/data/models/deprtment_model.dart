class DepartmentModel {
  int? id;
  String? nameAr;
  String? nameEn;
  int? cityId;
  String? admins;
  String? createdAt;
  String? updatedAt;

  DepartmentModel(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.cityId,
      this.admins,
      this.createdAt,
      this.updatedAt});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
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
    data['admins'] = this.admins;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
