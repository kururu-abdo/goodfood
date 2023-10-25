class ChatSelectionModel {
  int? code;
  List<RegionData>? regions;

  ChatSelectionModel({this.code, this.regions});

  ChatSelectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      regions = <RegionData>[];
      json['data'].forEach((v) {
        regions!.add(RegionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    
    return data;
  }
}

class RegionData {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;
  List<Cities>? cities;

  RegionData(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.createdAt,
      this.updatedAt,
      this.cities});

  RegionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
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
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? id;
  String? nameAr;
  String? nameEn;
  int? regionId;
  String? createdAt;
  String? updatedAt;
  List<Branchs>? branchs;

  Cities(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.regionId,
      this.createdAt,
      this.updatedAt,
      this.branchs});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    regionId = json['region_id'];
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
    data['region_id'] = regionId;
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
  List<Emp>? emp;

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
      this.updatedAt,
      this.emp});

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
    if (json['emp'] != null) {
      emp = <Emp>[];
      json['emp'].forEach((v) {
        emp!.add(Emp.fromJson(v));
      });
    }
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
    if (emp != null) {
      data['emp'] = emp!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Emp {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? regionId;
 dynamic fcmToken;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Emp(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.regionId,
      this.fcmToken,
      this.active,
      this.createdAt,
      this.updatedAt});

  Emp.fromJson(Map<String, dynamic> json) {
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
