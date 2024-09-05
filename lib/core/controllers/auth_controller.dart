import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/admin_dashboard.dart';
import 'package:goodfoods/app/admin/pages/home_new.dart';
import 'package:goodfoods/core/data/models/user_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/auth_api.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';

class AuthController extends ChangeNotifier {
  
var userType ='admin';
var isError = false;
var isLoading = false;
String err = '';
ApiResponse<UserModel>?  user = ApiResponse.completed(null);
AuthController(){
  loadUserType();

}

logout(
  BuildContext context ,


)async{
try {
  
 await AuthApi().logout();

 


} catch (e) {
}


}
loginUser(
  BuildContext context ,
  String? email , String? password , 

  Function? result
) async {
    user=ApiResponse.loading('Fetching Popular Movies');
       err ='';
  isError=false;
  isLoading=true;
    notifyListeners();
    try {
      var userModel = await AuthApi().login(email, password);
        user=ApiResponse.completed(userModel);

        notifyListeners();

if (user!.data!= null) {
  result!(true, false  ,'');
  setNotification(user!.data!);
  err ='';
  isError=false;
sharedPrefs.isLoggedIn= true;
sharedPrefs.isAdmin= user!.data!.user!.maintain_emp!;   
sharedPrefs.isMaintain = user!.data!.user!.maintain_emp!;
sharedPrefs.userEmail=user!.data!.user!.email!.trim();
sharedPrefs.userId= user!.data!.user!.id.toString();
if (sharedPrefs.isRemember) {
  sharedPrefs.userPass= password!.trim();
}
if(user!.data!.user!.maintain_emp!){
  sharedPrefs.userType ="فني صيانة";
}else {
  sharedPrefs.userType ="موظف";
}

//getAuth
  List<String> auth = [];
if (user!.data!.permisions!.showBranchs!) {
  auth.add('branch');
}
if (user!.data!.permisions!.showCars!) {
  auth.add('cars');
}

sharedPrefs.authList = auth;
sharedPrefs.user_name = user!.data!.user!.name!.toString();

sharedPrefs.user_id = user!.data!.user!.id!.toString();
sharedPrefs.user_pos = user!.data!.user!.regionId.toString();

sharedPrefs.token = user!.data!.accessToken!.toString();

// Navigator.of(context).push(
//         MaterialPageRoute(builder: (_)=>
//         const Dashboard())
//       );
// Navigator.of(context).push(
//         MaterialPageRoute(builder: (_)=>
//         const HomeNew())
//       );
 Navigator.pushAndRemoveUntil(

           context, MaterialPageRoute(builder: (_)=>const HomeNew()) ,
          (route)=>false
         );
  
}else {
    result!(false, true  ,'wrong email/password');
  err ='wrong email/password';
  isError=true;
}
 

notifyListeners();
    } catch (e) {
     user=ApiResponse.error(e.toString());

 isLoading=false;
       err =e.toString();
  isError=true;
   result!(false, true  ,e.toString());
         notifyListeners();

      print(e);
    }finally{
 isLoading=false;
  notifyListeners();
    }
  }
loadUserType()async{


   var type=
   sharedPrefs.userType;

  if (type.isNotEmpty) {
   userType= type;
   notifyListeners(); 
  }
}

setNotification(UserModel model){
  log("NOTIFICATIONS${model.notifications}" );
if (model.notifications!=null) {
 sharedPrefs.notificationCount= int.parse(model.notifications.toString());
 
//  int.parse(model.notifications.toString());
 
}else {
  sharedPrefs.notificationCount=0;
}
}
getUserProfile()async{
  try {
     AuthApi().login(sharedPrefs.userEmail, sharedPrefs.userPass)
     .then((model){
setNotification(model);

     });

notifyListeners();


  } catch (e) {
    print(e); 
  }
}

//change user type
changeUserType(String type){
  userType = type;
  notifyListeners();
}

}