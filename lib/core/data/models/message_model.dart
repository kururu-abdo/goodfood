class MessageModel {
  int? code;
  List<MessageData>? data;

  MessageModel({this.code, this.data});

  MessageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <MessageData>[];
      json['data'].forEach((v) {
        data!.add(MessageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class MessageData {
  int? id;
  int? senderId;
  int? reciverId;
  String? msg;
  String? mediaUrl;
  String? createdAt;
  int? readed;

  MessageData(
      {this.id,
      this.senderId,
      this.reciverId,
      this.msg,
      this.mediaUrl,
      this.createdAt,
      this.readed});

  MessageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    reciverId = json['reciver_id'];
    msg = json['msg'];
    mediaUrl = json['media_url'];
    createdAt = json['created_at'];
    readed = json['readed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['reciver_id'] = reciverId;
    data['msg'] = msg;
    data['media_url'] = mediaUrl;
    data['created_at'] = createdAt;
    data['readed'] = readed;
    return data;
  }
}
