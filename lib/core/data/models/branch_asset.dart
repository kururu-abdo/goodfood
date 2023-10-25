class BranchAsset {
  int? id;
  int? branchId;
  int? mCode;
  int? maintainDuation;
  String? nameAr;
  String? nameEn;
  String? desAr;
  String? desEn;
  String? buyDate;
  String? lastMaintain;
  String? warrantyDate;
  String? imgUrl;
  String? createdAt;
  String? updatedAt;

  BranchAsset(
      {this.id,
      this.branchId,
      this.mCode,
      this.maintainDuation,
      this.nameAr,
      this.nameEn,
      this.desAr,
      this.desEn,
      this.buyDate,
      this.lastMaintain,
      this.warrantyDate,
      this.imgUrl,
      this.createdAt,
      this.updatedAt});

  BranchAsset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    mCode = json['m_code'];
    maintainDuation = json['maintain_duation'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    desAr = json['des_ar'];
    desEn = json['des_en'];
    buyDate = json['buy_date'];
    lastMaintain = json['last_maintain'];
    warrantyDate = json['warranty_date'];
    imgUrl = json['img_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['m_code'] = this.mCode;
    data['maintain_duation'] = this.maintainDuation;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['des_ar'] = this.desAr;
    data['des_en'] = this.desEn;
    data['buy_date'] = this.buyDate;
    data['last_maintain'] = this.lastMaintain;
    data['warranty_date'] = this.warrantyDate;
    data['img_url'] = this.imgUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
