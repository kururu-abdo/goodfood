import 'package:goodfoods/core/utils/strings.dart';
import 'package:nb_utils/nb_utils.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;  
  
  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String get userType => _sharedPrefs!.getString(USER_TYPE) ?? "";
  bool get isLoggedIn => _sharedPrefs!.getBool(ISLOGGEDIN) ?? false;

  List<String> get authList => _sharedPrefs!.getStringList(AUTHLIST) ?? [];

  bool get isAdmin => _sharedPrefs!.getBool(ISADMIN) ?? false;
  bool get isOpen => _sharedPrefs!.getBool(ISOPEM) ?? false;
  bool get isMaintain => _sharedPrefs!.getBool(ISMAINTAIN) ?? false;
 bool get isRemember => _sharedPrefs!.getBool(IS_REMEMBER) ?? false;
  String get user_name => _sharedPrefs!.getString(USER_NAME) ?? "";
  String get user_id => _sharedPrefs!.getString(USER_ID) ?? "";
  String get   user_pos => _sharedPrefs!.getString(USER_POS) ?? "";
  String get   token => _sharedPrefs!.getString(TOKEN) ?? "";
  String get   userEmail => _sharedPrefs!.getString(USER_EMAIL) ?? "";
  String get   userPass => _sharedPrefs!.getString(USER_PASS) ?? "";

 set userEmail(String email){
 _sharedPrefs!.setString(USER_EMAIL, email);
 }
  set userId(String email){
 _sharedPrefs!.setString(USER_ID, email);
 }
 set userPass(String pass){
 _sharedPrefs!.setString(USER_PASS, pass);
 }


 set isAdmin(bool value){
 _sharedPrefs!.setBool(ISADMIN, value);
 }



 set isRemember(bool value){
 _sharedPrefs!.setBool(IS_REMEMBER, value);
 }

 set isMaintain(bool value){
 _sharedPrefs!.setBool(ISMAINTAIN, value);
 }
 set isOpen(bool value){
 _sharedPrefs!.setBool(ISOPEM, value);
 }
  set userType(String value) {
    _sharedPrefs!.setString(USER_TYPE, value);
  }
  set token(String value) {
    _sharedPrefs!.setString(TOKEN, value);
  }


  set user_name(String value) {
    _sharedPrefs!.setString(USER_NAME, value);
  }

 set user_id(String value) {
    _sharedPrefs!.setString(USER_ID, value);
  }
    set user_pos(String value) {
    _sharedPrefs!.setString(USER_POS, value);
  }


set authList(list){
   _sharedPrefs!.setStringList(AUTHLIST , []);
      _sharedPrefs!.setStringList(AUTHLIST , list);


}
  set isLoggedIn(bool value) {
    _sharedPrefs!.setBool(ISLOGGEDIN, value);
  }
// clear(){
//   _sharedPrefs!.clear();
// }

logout(){
isLoggedIn=false;

}
}

final sharedPrefs = SharedPrefs();