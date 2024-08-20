import 'package:flutter/material.dart';
import 'package:goodfoods/app/notifications/models/notificaiton_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/notifications_apis.dart';

class NotificationController extends ChangeNotifier {
  

ApiResponse<List<NotificationModel>>?  notifications = ApiResponse.completed([]);


ApiResponse<void>?  readNotifications = ApiResponse.completed({});



List<Map>  statusList =[
  {
"en":"All",
"ar":"الكل" ,
"value":'0'
  },

 {
"en":"Read",
"ar":"المقروءة" ,
"value":'1'
  },

 {
"en":"Not Read",
"ar":"غير المقروءة" ,
"value":'2'
  },
 


];


String? selectedStatus;


String filterLink='';

Map? getSelectedStatusObject(){
  if (selectedStatus==null) {
    return null;
  }else {
   Map? value= statusList.firstWhere((e)=>  e['value']==selectedStatus);
    

    return value;

  }
}

setselectedStatus(status){
  selectedStatus=status;
  notifyListeners();
}

clearFilter(){
  filterLink='';
  // startDate=null;
  // endDate=null;
  // selectedModel=null;
  selectedStatus=null;
  notifyListeners();
}



setFilterLink(
  
  BuildContext context,
  String type){
 
  // filterLink = 'status=$selectedStatus&start_date=$startDate&end_date=$endDate&model_type=$selectedModel';
filterLink='';


if (selectedStatus!=null) {
  filterLink='${filterLink}status=$selectedStatus&';
}
// if (startDate!=null) {
//     filterLink='${filterLink}start_date=${     getUsaualDate(startDate!.toString())}&';

// }

// if (endDate!=null) {
//     filterLink='${filterLink}end_date=${     getUsaualDate(endDate!.toString())}&';

// }
// if (selectedModel!=null) {
//     filterLink='${filterLink}model_type=$selectedModel';

// }








  // log(filterLink);
  // if (type=="maintain") {
  // getFiliterUserOrders(context);
  // }else {
  //   geFiltertMaintainOrders(context);

  // }
  notifyListeners();
}


  Future<void> getNotifications()async{

notifications=ApiResponse.loading('Fetching Popular Movies');
notifyListeners();
try {

 var response =await NotificationsApis().getUnreadNotifications();

 notifications=ApiResponse.completed(response);

  notifications!.data!.sort((a, b) => b.id!.compareTo(a.id!));
notifications!.data!.reversed;  
  
} catch (e) {

       notifications=ApiResponse.error(e.toString());

 
} finally{
  notifyListeners();
}

  }





  Future<void> refresh()async{

notifications=ApiResponse.loading('Fetching Popular Movies');

try {

 var response =await NotificationsApis().getUnreadNotifications();

 notifications=ApiResponse.completed(response);

notifications!.data!.sort((a, b) => b.id!.compareTo(a.id!));
notifications!.data!.reversed;  
  
} catch (e) {

       notifications=ApiResponse.error(e.toString());

 
} finally{
notifyListeners();
}

  }




 Future<void>  makeAllNotificationsRead()async{
   try {
     NotificationsApis().readAllNotifications().then((value) {

       refresh();
     }
     
     
     );
   }finally{

   }
 }




 Future<void>  readNotificaiton(String id)async{
   try {
     NotificationsApis().readNotification(id).then((value) {

       refresh();
     }
     
     
     );
   }finally{

   }
 }


}