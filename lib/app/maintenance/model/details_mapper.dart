import 'package:goodfoods/app/maintenance/model/asset_info.dart';

class OrderDetailMapper{
    final String? orderId;
  final int? confirmed;
  final String? task;
  final String? from;
  final String? to;
  final String? modelType;
  final String? maintainStats;
  final String? orderStatus;
  final String? submittedOrder;
  final String? orderUserId;
final int? immedatly;
  final String?  date;
  String?
model_name_ar;
String? model_name_en;
  final String? status;
  final List? file;
  final dynamic reject_resion;
final MaintainanceAsset? maintainanceAsset;
  OrderDetailMapper(  {this.model_name_ar,this.model_name_en,
    this.reject_resion,
    this.immedatly,
    
    this.modelType, this.maintainStats, this.orderStatus, this.submittedOrder,
    this.status,
    this.orderUserId,
    this.maintainanceAsset,
    required this.orderId, required this.confirmed, required this.task, required this.from, required this.to, required this.date, required this.file});
}