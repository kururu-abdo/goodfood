
import 'package:nb_utils/nb_utils.dart';

class MaintainanceAsset {
  
MaintainanceAsset();
factory MaintainanceAsset.makeAsset(Map<String, dynamic> data , String modelType){ 

    log("NO_CARE_ASKSET$data");

switch (modelType.toLowerCase()) {
  case 'car':
    return CarMaintenanceAsset.fromJson(data, modelType.toLowerCase());
  default:
    return DefaultMaintenanceAsset.fromJson(data, modelType.toLowerCase());

}

}



}

class CarMaintenanceAsset  extends MaintainanceAsset{
  

int? id;
  String? bordNumber;
  int? model;
  int? walkway;
  dynamic walkwayRemaind;
  String? carType;
  String? bodyNum;
  String? carMark;
  List<String>? files;
String? modelName;

  CarMaintenanceAsset(
      {this.id,
      this.bordNumber,
      this.model,
      this.walkway,
      this.modelName,
      this.walkwayRemaind,
      this.carType,
      this.bodyNum,
      this.carMark,
      this.files});

  CarMaintenanceAsset.fromJson(Map<String, dynamic> json , model) {
    modelName= model;
        id = json['id'];
    bordNumber = json['bord_number'];
    model = json['model'];
    walkway = json['walkway'];
    walkwayRemaind = json['walkway_remaind'];
    carType = json['car_type'];
    bodyNum = json['body_num'];
    carMark = json['car_mark'];
  files =[];
    if (json['files']!= null) {
      files = <String>[];
     json['files'].forEach((v) {
        files!.add(v);
      });
    }
   
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bord_number'] = bordNumber;
    data['model'] = model;
    data['walkway'] = walkway;
    data['walkway_remaind'] = walkwayRemaind;
    data['car_type'] = carType;
    data['body_num'] = bodyNum;
    data['car_mark'] = carMark;
    data['files'] = files;
    return data;
  }









}




class DefaultMaintenanceAsset  extends MaintainanceAsset{
  

@override
  String? nameAr;
  @override
  String? nameEn;
String? modelType;
  DefaultMaintenanceAsset({this.nameAr, this.nameEn , this.modelType});

  DefaultMaintenanceAsset.fromJson(Map<String, dynamic> json , model) {
    log("NO_CARE_ASSET$json");
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    modelType =model;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    return data;
  }
}
