


class MessageModel {
  int? code;
  MessageData? data;

  MessageModel({this.code, this.data});

  MessageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new MessageData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MessageData {
  int? currentPage;
  List<Message>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
 dynamic nextPageUrl;
  String? path;
  int? perPage;
 dynamic prevPageUrl;
  int? to;
  int? total;

  MessageData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  MessageData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Message>[];
      json['data'].forEach((v) {
        data!.add(new Message.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Message {
  int? id;
  int? senderId;
  int? reciverId;
  String? msg;
  dynamic  mediaUrl;
  int? readed;
  String? createdAt;
  String? updatedAt;

  Message(
      {this.id,
      this.senderId,
      this.reciverId,
      this.msg,
      this.mediaUrl,
      this.readed,
      this.createdAt,
      this.updatedAt});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    reciverId = json['reciver_id'];
    msg = json['msg'];
    mediaUrl = json['media_url'];
    readed = json['readed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['reciver_id'] = this.reciverId;
    data['msg'] = this.msg;
    data['media_url'] = this.mediaUrl;
    data['readed'] = this.readed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}























// class MessageModel {
//   int? code;
//   List<MessageData>? data;

//   MessageModel({this.code, this.data});

//   MessageModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     if (json['data'] != null) {
//       data = <MessageData>[];
//       json['data'].forEach((v) {
//         data!.add(MessageData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['code'] = code;
//     // if (this.data != null) {
//     //   data['data'] = this.data!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }

// class MessageData {
//   int? id;
//   int? senderId;
//   int? reciverId;
//   String? msg;
//   String? mediaUrl;
//   String? createdAt;
//   int? readed;

//   MessageData(
//       {this.id,
//       this.senderId,
//       this.reciverId,
//       this.msg,
//       this.mediaUrl,
//       this.createdAt,
//       this.readed});

//   MessageData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     senderId = json['sender_id'];
//     reciverId = json['reciver_id'];
//     msg = json['msg'];
//     mediaUrl = json['media_url'];
//     createdAt = json['created_at'];
//     readed = json['readed'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['sender_id'] = senderId;
//     data['reciver_id'] = reciverId;
//     data['msg'] = msg;
//     data['media_url'] = mediaUrl;
//     data['created_at'] = createdAt;
//     data['readed'] = readed;
//     return data;
//   }
// }
