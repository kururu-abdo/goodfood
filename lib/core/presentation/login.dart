import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/home_new.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/presentation/widgets/password_field.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/sizes.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userCodeController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    TextEditingController passwordController = TextEditingController();

  login(BuildContext context){
    try {
      if (_formKey.currentState!.validate()) {
      // on success, notify the parent widget
     context.read<AuthController>().loginUser(
       context,
       userCodeController.text.trim(), passwordController.text.trim(),
      
       (bool isAuth , bool isError ,String err){

 if (isError){
  //  log(value);
 }

else   {
  const HomeNew().launch(context ,isNewTask: true);
}


       });
   // const AdminDashboard().launch(context);
    }
    } catch (e) {
    }
  }
  

  @override
  void initState() { 
    super.initState();
    

if(  sharedPrefs.isRemember){
  passwordController.text = sharedPrefs.userPass;
  userCodeController.text = sharedPrefs.userEmail;
}

  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthController>(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20 
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                  SizedBox(
                    width: 200.0,
                    height: 120.0,
                    child: Image.asset('assets/images/logo.png'),
                  
                  ),
                SizedBox(height: defaultSpace,),
                  BoxInputField(
                  controller: userCodeController,
                  placeholder: 
                  
                  locale!.translate("email")!
                  // 'Email'
                  ,
                  validator: (text){
            var email = text!.trim();
            bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email.trim());
           if (text.isEmpty) {
                  return 
                                    locale.translate("email_required");

                  
                }
                if (!emailValid) {
                  return 
                                                      locale.translate("email_invalid");

                }
                return null;
                  },
                ) ,
               
                   SizedBox(height: defaultSpace,),
                  PasswordField(
                  controller: passwordController,
                  password: true,
                  placeholder:
                  
                            locale.translate("password")!

                   
                   ,
                  validator: (text) {
                if (text == null || text.isEmpty) {
                  return 
                                                      locale.translate("password_required");

                  
                }
                if (text.length < 4) {
                  return 
                  
                                                      locale.translate("password_short");

                }
                return null;
              },
                  
                ) ,
                   SizedBox(height: defaultSpace,),
                   Visibility(
                     visible: provider.isError,
                     child: Text(
                    provider.err , 
                       style: const TextStyle(
                         color: Colors.red  , 
                         fontSize: 18
                       ),
                   
                     ),
                   ),
remberMeCheckBox(),

                                      // SizedBox(height: defaultSpace,),

                  BoxButton(
            title:                                     locale.translate("login")!
,
            disabled: provider.isLoading,
            busy:provider.isLoading,
            onTap: (){
             
          
          
              login(context);
            },
                  )
                
              ],
            ),
          ),
        ),
      ),
      
    );
  }

  remberMeCheckBox() {
      return CheckboxListTile(
        checkColor: Colors.green,
        activeColor:  Colors.white,
        
        value: sharedPrefs.isRemember,
        onChanged: (value) {

          sharedPrefs.isRemember=value!;
          setState(() {
            
          });
          // if (value) {
          //   sharedPrefs.userPass= passwordController.text.trim();
          //   sharedPrefs.userEmail = userCodeController.text.trim();
          // }else {
          //    sharedPrefs.userPass= '';
          //   sharedPrefs.userEmail = '';
          // }
        },
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.only(left: 0, top: 0),
        title: Text(
          currentLang(context)=="ar"?
          "حفظ معلومات الدخول":
          "Remember Me",
          style: const TextStyle(color:  Colors.grey,  fontSize: 14),
        ),
      );
    }
}