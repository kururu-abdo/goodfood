import 'dart:developer';

class OrderStatus {
  

   dynamic created; 

   dynamic closed; 
   dynamic pre_closed; 
     dynamic accepted; 
   dynamic rejected;

  OrderStatus({this.created, this.closed, this.pre_closed, this.accepted, this.rejected}); 



OrderStatus.fromJson(Map<String,dynamic> data){
log("STATUS DATA$data");
  created = data['created'];
    closed = data['closed'];
    accepted = data['accpeted'];
    rejected = data['rejected'];
    pre_closed = data['pre_closed'];

}
Map<String,dynamic> toJson(){
Map<String,dynamic> data ={};

data['created'] =created;
data['closed'] = closed;

data['accpeted']= accepted;
 data['rejected'] = rejected;
 data['pre_closed'] = pre_closed;
 return data;
}







}