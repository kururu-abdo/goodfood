class BrandModel {
  int? id;
  String? name;
  bool? isLiked;
  String?  img_url;

  BrandModel({this.id, this.name, this.isLiked});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isLiked = json['isLiked'];
    img_url = json['img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['isLiked'] = isLiked;
    return data;
  }
}
