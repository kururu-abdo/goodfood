class AreaStatusData {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;
  int? created;
  int? preClosed;
  int? closed;
  int? accpeted;
  int? rejected;
  List<Branchs>? branchs;

  AreaStatusData(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.createdAt,
      this.updatedAt,
      this.created,
      this.preClosed,
      this.closed,
      this.accpeted,
      this.rejected,
      this.branchs});

  AreaStatusData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    created = json['created'];
    preClosed = json['pre_closed'];
    closed = json['closed'];
    accpeted = json['accpeted'];
    rejected = json['rejected'];
    if (json['branchs'] != null) {
      branchs = <Branchs>[];
      json['branchs'].forEach((v) {
        branchs!.add(new Branchs.fromJson(v));
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
    data['created'] = this.created;
    data['pre_closed'] = this.preClosed;
    data['closed'] = this.closed;
    data['accpeted'] = this.accpeted;
    data['rejected'] = this.rejected;
    if (this.branchs != null) {
      data['branchs'] = this.branchs!.map((v) => v.toJson()).toList();
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
  Null? files;
  String? admins;
  double? lat;
  double? lng;
  String? img;
  String? createdAt;
  String? updatedAt;
  int? laravelThroughKey;

  Branchs(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.cityId,
      this.brandId,
      this.manegers,
      this.files,
      this.admins,
      this.lat,
      this.lng,
      this.img,
      this.createdAt,
      this.updatedAt,
      this.laravelThroughKey});

  Branchs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    brandId = json['brand_id'];
    manegers = json['manegers'];
    files = json['files'];
    admins = json['admins'];
    lat = json['lat'];
    lng = json['lng'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    laravelThroughKey = json['laravel_through_key'];
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
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['laravel_through_key'] = this.laravelThroughKey;
    return data;
  }
}
