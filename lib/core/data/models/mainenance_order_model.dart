import 'dart:convert';
import 'dart:developer';



// class MaintainenanceOrderModel {
//   int? id;
//   int? adminId;
//   String? modelType;
//   int? modelId;
//   dynamic machines;
//   String? task;
//   List<dynamic>? files;
//   int? status;
//   int? immedatly;
//   String? createdAt;
//   String? updatedAt;
//   ForwardTo? forwardTo;

//   MaintainenanceOrderModel(
//       {this.id,
//       this.adminId,
//       this.modelType,
//       this.modelId,
//       this.machines,
//       this.task,
//       this.files,
//       this.status,
//       this.immedatly,
//       this.createdAt,
//       this.updatedAt,
//       this.forwardTo});

//   MaintainenanceOrderModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     adminId = json['admin_id'];
//     modelType = json['model_type'];
//     modelId = json['model_id'];
//     machines = json['machines'];
//     task = json['task'];
//  if (json['files'] != null) {
//       files = <dynamic>[];
//      jsonDecode( json['files'].toString()).forEach((v) {
//         files!.add(v);
//       });
//     }
//     status = json['status'];
//     immedatly = json['immedatly'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     forwardTo = json['forward_to'] != null
//         ? ForwardTo.fromJson(json['forward_to'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['admin_id'] = adminId;
//     data['model_type'] = modelType;
//     data['model_id'] = modelId;
//     data['machines'] = machines;
//     data['task'] = task;
//     data['files'] = files;
//     data['status'] = status;
//     data['immedatly'] = immedatly;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (forwardTo != null) {
//       data['forward_to'] = forwardTo!.toJson();
//     }
//     return data;
//   }
// }

// class ForwardTo {
//   int? id;
//   int? maintainId;
//   int? adminId;
//   int? confirmed;
//   String? createdAt;
//   String? updatedAt;
//   Admin? admin;

//   ForwardTo(
//       {this.id,
//       this.maintainId,
//       this.adminId,
//       this.confirmed,
//       this.createdAt,
//       this.updatedAt,
//       this.admin});

//   ForwardTo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     maintainId = json['maintain_id'];
//     adminId = json['admin_id'];
//     confirmed = json['confirmed'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['maintain_id'] = maintainId;
//     data['admin_id'] = adminId;
//     data['confirmed'] = confirmed;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (admin != null) {
//       data['admin'] = admin!.toJson();
//     }
//     return data;
//   }
// }

// class Admin {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   int? regionId;
//   dynamic fcmToken;
//   bool? active;
//   String? createdAt;
//   String? updatedAt;

//   Admin(
//       {this.id,
//       this.name,
//       this.email,
//       this.phone,
//       this.regionId,
//       this.fcmToken,
//       this.active,
//       this.createdAt,
//       this.updatedAt});

//   Admin.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     regionId = json['region_id'];
//     fcmToken = json['fcm_token'];
//     active = json['active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['phone'] = phone;
//     data['region_id'] = regionId;
//     data['fcm_token'] = fcmToken;
//     data['active'] = active;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }




// class MaintainenanceOrderModel {
//   int? code;
//   Data? data;

//   MaintainenanceOrderModel({this.code, this.data});

//   MaintainenanceOrderModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? currentPage;
//   List<AdminOrderData2>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Links>? links;
//   String? nextPageUrl;
//   String? path;
//   int? perPage;
//   Null? prevPageUrl;
//   int? to;
//   int? total;

//   Data(
//       {this.currentPage,
//       this.data,
//       this.firstPageUrl,
//       this.from,
//       this.lastPage,
//       this.lastPageUrl,
//       this.links,
//       this.nextPageUrl,
//       this.path,
//       this.perPage,
//       this.prevPageUrl,
//       this.to,
//       this.total});

//   Data.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = <AdminOrderData2>[];
//       json['data'].forEach((v) {
//         data!.add(new AdminOrderData2.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     if (json['links'] != null) {
//       links = <Links>[];
//       json['links'].forEach((v) {
//         links!.add(new Links.fromJson(v));
//       });
//     }
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this.currentPage;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = this.firstPageUrl;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     data['last_page_url'] = this.lastPageUrl;
//     if (this.links != null) {
//       data['links'] = this.links!.map((v) => v.toJson()).toList();
//     }
//     data['next_page_url'] = this.nextPageUrl;
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     data['prev_page_url'] = this.prevPageUrl;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }

// class AdminOrderData2 {
//   int? id;
//   int? maintainId;
//   int? adminId;
//   int? confirmed;
//   dynamic rejectResion;
//   String? createdAt;
//   String? updatedAt;
//   MaintainOrder? maintainOrder;

//   AdminOrderData2(
//       {this.id,
//       this.maintainId,
//       this.adminId,
//       this.confirmed,
//       this.rejectResion,
//       this.createdAt,
//       this.updatedAt,
//       this.maintainOrder});

//   AdminOrderData2.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     maintainId = json['maintain_id'];
//     adminId = json['admin_id'];
//     confirmed = json['confirmed'];
//     rejectResion = json['reject_resion'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     maintainOrder = json['maintain_order'] != null
//         ? new MaintainOrder.fromJson(json['maintain_order'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['maintain_id'] = this.maintainId;
//     data['admin_id'] = this.adminId;
//     data['confirmed'] = this.confirmed;
//     data['reject_resion'] = this.rejectResion;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.maintainOrder != null) {
//       data['maintain_order'] = this.maintainOrder!.toJson();
//     }
//     return data;
//   }
// }

// class MaintainOrder {
//   int? id;
//   int? adminId;
//   String? modelType;
//   int? modelId;
//   Null? machines;
//   String? task;
//   Null? files;
//   int? status;
//   int? immedatly;
//   String? createdAt;
//   String? updatedAt;
//   Admin? admin;

//   MaintainOrder(
//       {this.id,
//       this.adminId,
//       this.modelType,
//       this.modelId,
//       this.machines,
//       this.task,
//       this.files,
//       this.status,
//       this.immedatly,
//       this.createdAt,
//       this.updatedAt,
//       this.admin});

//   MaintainOrder.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     adminId = json['admin_id'];
//     modelType = json['model_type'];
//     modelId = json['model_id'];
//     machines = json['machines'];
//     task = json['task'];
//     files = json['files'];
//     status = json['status'];
//     immedatly = json['immedatly'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['admin_id'] = this.adminId;
//     data['model_type'] = this.modelType;
//     data['model_id'] = this.modelId;
//     data['machines'] = this.machines;
//     data['task'] = this.task;
//     data['files'] = this.files;
//     data['status'] = this.status;
//     data['immedatly'] = this.immedatly;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.admin != null) {
//       data['admin'] = this.admin!.toJson();
//     }
//     return data;
//   }
// }

// class Admin {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   int? regionId;
//   String? fcmToken;
//   bool? active;
//   String? createdAt;
//   String? updatedAt;

//   Admin(
//       {this.id,
//       this.name,
//       this.email,
//       this.phone,
//       this.regionId,
//       this.fcmToken,
//       this.active,
//       this.createdAt,
//       this.updatedAt});

//   Admin.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     regionId = json['region_id'];
//     fcmToken = json['fcm_token'];
//     active = json['active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['region_id'] = this.regionId;
//     data['fcm_token'] = this.fcmToken;
//     data['active'] = this.active;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Links {
//   String? url;
//   String? label;
//   bool? active;

//   Links({this.url, this.label, this.active});

//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }




class MaintainenanceOrderModel {
  int? code;
  Data? data;

  MaintainenanceOrderModel({this.code, this.data});

  MaintainenanceOrderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<AdminOrderData2>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
 dynamic prevPageUrl;
  int? to;
  int? total;
  Data(

      {
        
        
        this.currentPage,
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

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    
    if (json['data'] != null) {
      data = <AdminOrderData2>[];
      json['data'].forEach((v) {
        data!.add(AdminOrderData2.fromJson(v));
      });
    }


    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class AdminOrderData2 {
  int? id;
  int? adminId;
  String? modelType;
  int? modelId;
dynamic machines;
  String? task;
List<String>? files;
  int? status;
  int? immedatly;
  String? createdAt;
  String? updatedAt;
  ForwardTo? forwardTo;
String? model_name_ar;
String? model_name_en;
Admin? admin;
  AdminOrderData2(
      {this.id,
      this.model_name_ar,this.model_name_en,
      this.adminId,
      this.modelType,
      this.modelId,
      this.machines,
      this.task,
      this.admin,
      this.files,
      this.status,
      this.immedatly,
      this.createdAt,
      this.updatedAt,
      this.forwardTo});

  AdminOrderData2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    model_name_ar= json['model_name_ar'];
    model_name_en= json['model_name_en'];
log("AR$model_name_ar");

log("EN$model_name_en");
    admin =  json['admin'] != null
        ? Admin.fromJson(json['admin'])
        : null;
    adminId = json['admin_id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    machines = json['machines'];
    task = json['task'];
    if (!json.containsKey("files")|| json['files'] == null) {
      
    
files = <String>[];
    }
    else if (json['files'].toString()!=null.toString() ) {
      files = <String>[];
     jsonDecode( json['files'].toString()).forEach((v) {
        files!.add(v);
      });
    }else {
      files = <String>[];

    }
    status = json['status'];
    immedatly = json['immedatly'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    forwardTo = json['forward_to'] != null
        ? ForwardTo.fromJson(json['forward_to'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['admin_id'] = adminId;
    data['model_type'] = modelType;
    data['model_id'] = modelId;
    data['machines'] = machines;
    data['task'] = task;
    data['files'] = files;
    data['status'] = status;
    data['immedatly'] = immedatly;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (forwardTo != null) {
      data['forward_to'] = forwardTo!.toJson();
    }
    return data;
  }
}

class ForwardTo {
  int? id;
  int? maintainId;
  int? adminId;
  int? confirmed;
dynamic rejectResion;
  String? createdAt;
  String? updatedAt;
  Admin? admin;

  ForwardTo(
      {this.id,
      this.maintainId,
      this.adminId,
      this.confirmed,
      this.rejectResion,
      this.createdAt,
      this.updatedAt,
      this.admin});

  ForwardTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maintainId = json['maintain_id'];
    adminId = json['admin_id'];
    confirmed = json['confirmed'];
    rejectResion = json['reject_resion'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['maintain_id'] = maintainId;
    data['admin_id'] = adminId;
    data['confirmed'] = confirmed;
    data['reject_resion'] = rejectResion;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (admin != null) {
      data['admin'] = admin!.toJson();
    }
    return data;
  }
}

class Admin {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? regionId;
  String? fcmToken;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Admin(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.regionId,
      this.fcmToken,
      this.active,
      this.createdAt,
      this.updatedAt});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
