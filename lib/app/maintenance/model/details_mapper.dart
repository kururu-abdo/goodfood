class OrderDetailMapper{
    final String? orderId;
  final int? confirmed;
  final String? task;
  final String? from;
  final String? to;
  final String?  date;
  final String? status;
  final List? file;

  OrderDetailMapper( {
    this.status,
    
    required this.orderId, required this.confirmed, required this.task, required this.from, required this.to, required this.date, required this.file});
}