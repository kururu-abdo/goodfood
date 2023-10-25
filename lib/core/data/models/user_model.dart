class UserModel {
  String? accessToken;
  String? tokenType;
  User? user;
  Permisions? permisions;

  UserModel({this.accessToken, this.tokenType, this.user, this.permisions});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    permisions = json['permisions'] != null
        ? Permisions.fromJson(json['permisions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (permisions != null) {
      data['permisions'] = permisions!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? regionId;
  String?  fcmToken;
  bool? active;
  String? createdAt;
  String? updatedAt;
  bool? maintain_emp;

  User(
      {this.id,
      this.name,
      this.maintain_emp,
      this.email,
      this.phone,
      this.regionId,
      this.fcmToken,
      this.active,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    maintain_emp =json['maintain_emp'];
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

class Permisions {
  bool? showBranchs;
  bool? showCars;

  Permisions({this.showBranchs, this.showCars});

  Permisions.fromJson(Map<String, dynamic> json) {
    showBranchs = json['show_branchs'];
    showCars = json['show_cars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['show_branchs'] = showBranchs;
    data['show_cars'] = showCars;
    return data;
  }
}
