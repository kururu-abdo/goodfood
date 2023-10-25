import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/admin_dashboard.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/presentation/widgets/password_field.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/sizes.dart';
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
  const Dashboard().launch(context);
}


       });
   // const AdminDashboard().launch(context);
    }
    } catch (e) {
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
}