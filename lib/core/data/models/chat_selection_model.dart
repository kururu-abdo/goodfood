class ChatSelectionModel {
  int? code;
  List<RegionData>? regions;

  ChatSelectionModel({this.code, this.regions});

  ChatSelectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      regions = <RegionData>[];
      json['data'].forEach((v) {
        regions!.add(new RegionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.regions != null) {
      data['data'] = this.regions!.map((v) => v.toJson()).toList();
    }
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
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
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
  List<Departments>? departments;

  Cities(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.regionId,
      this.createdAt,
      this.updatedAt,
      this.branchs,
      this.departments});

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
        branchs!.add(new Branchs.fromJson(v));
      });
    }
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(new Departments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['region_id'] = this.regionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.branchs != null) {
      data['branchs'] = this.branchs!.map((v) => v.toJson()).toList();
    }
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) => v.toJson()).toList();
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
        emp!.add(new Emp.fromJson(v));
      });
    }
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
    if (this.emp != null) {
      data['emp'] = this.emp!.map((v) => v.toJson()).toList();
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
  String? fcmToken;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['region_id'] = this.regionId;
    data['fcm_token'] = this.fcmToken;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Departments {
  int? id;
  String? nameAr;
  String? nameEn;
  int? cityId;
  String? admins;
  String? createdAt;
  String? updatedAt;
  List<Emp>? emp;

  Departments(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.cityId,
      this.admins,
      this.createdAt,
      this.updatedAt,
      this.emp});

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    admins = json['admins'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['emp'] != null) {
      emp = <Emp>[];
      json['emp'].forEach((v) {
        emp!.add(new Emp.fromJson(v));
      });
    }
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
    if (this.emp != null) {
      data['emp'] = this.emp!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

