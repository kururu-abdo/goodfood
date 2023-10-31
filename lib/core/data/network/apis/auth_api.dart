import 'dart:convert';

import 'package:goodfoods/core/data/models/user_model.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';

class AuthApi {
  
  final ApiBaseHelper _helper = ApiBaseHelper();
   
   
   Future<UserModel> login(
     String? email , String? password
   ) async {
    final response = await _helper.post("auth/login" ,
   jsonEncode(
      {
      "email":email ,
      "password":password

    }
   )
    
    );
    return UserModel.fromJson(response);
  }
 Future<void> logout(
    
   ) async {
    final response = await _helper.post("auth/logout" ,
   jsonEncode(
      {
    //   "email":email ,
    //   "password":password

    }
   
    
    ));
    return ;
  }


}
// https://goodfoodsa.co/api/auth/logout
// maintain_emp
// }