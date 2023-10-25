
class ManagementOrderModel {
  int? id;
  int? senderId;
  String? reciverId;
  String? taskAr;
  String? taskEn;
  String? replay;
  List<dynamic>? files;
  int? recived;
  String? createdAt;
  String? updatedAt;

  ManagementOrderModel(
      {this.id,
      this.senderId,
      this.reciverId,
      this.taskAr,
      this.taskEn,
      this.replay,
      this.files,
      this.recived,
      this.createdAt,
      this.updatedAt});

  ManagementOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    reciverId = json['reciver_id'];
    taskAr = json['task_ar'];
    taskEn = json['task_en'];
    replay = json['replay'];
    // files = json['files'].cast<String>();


    if (json['files']!=null) {
       files=[];

       //jsonDecode(json['files'].toString() )
       for (var element in (json['files'] as List  )) {

files!.add(element);
       }
    }else {
      files=[];
    }







    recived = json['recived'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['reciver_id'] = reciverId;
    data['task_ar'] = taskAr;
    data['task_en'] = taskEn;
    data['replay'] = replay;
    data['files'] = files;
    data['recived'] = recived;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
