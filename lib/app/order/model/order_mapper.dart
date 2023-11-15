import 'package:goodfoods/core/data/models/record_model.dart';

class OrderMapper {
  String? orderCreaterId;
  String? createrName;
  int? orderId;
  int? maintainOrderId;
  String? creatorEmail;
  String? creatorPhone;
  bool? fromMe;
    String? forwardToId;
    String? forwardToName;
int?  status;
int? confirmd;
int? immediately;
List<String>? files;
String? modelType;

String? task;
String? orderDate;
List<RecordModel>? records;
String? modelId;

OrderMapper(     
{
this. orderCreaterId,
this.orderId , 
this.maintainOrderId,
 this.createrName,
    this.forwardToId,
  this.forwardToName,
this.status,
this.confirmd,
this.immediately,
this.files,
this. modelType,

this. task,
this.orderDate,
this. records
,

this.creatorEmail,this.creatorPhone, this.fromMe , this.modelId
}
);

}