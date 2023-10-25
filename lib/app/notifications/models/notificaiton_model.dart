class NotificationModel {
  int? id;
  String? model;
  int? modelId;
  String? title;
  String? data;
  String? description;
  String? image;
  int? readed;
  String? createdAt;
  String? updatedAt;

  NotificationModel(
      {this.id,
      this.model,
      this.modelId,
      this.title,
      this.data,
      this.description,
      this.image,
      this.readed,
      this.createdAt,
      this.updatedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    model = json['model'];
    modelId = json['model_id'];
    title = json['title'];
    data = json['data'];
    description = json['description'];
    image = json['image'];
    readed = json['readed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model'] = this.model;
    data['model_id'] = this.modelId;
    data['title'] = this.title;
    data['data'] = this.data;
    data['description'] = this.description;
    data['image'] = this.image;
    data['readed'] = this.readed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
