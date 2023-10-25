class RecordModel {
  int? id;
  int? maintainId;
  String? des;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  String? name;

  RecordModel(
      {this.id,
      this.maintainId,
      this.des,
      this.addedBy,
      this.createdAt,
      this.updatedAt,
      this.name});

  RecordModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maintainId = json['maintain_id'];
    des = json['des'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maintain_id'] = this.maintainId;
    data['des'] = this.des;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    return data;
  }
}
