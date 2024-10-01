import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/presentation/login.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/presentation/widgets/password_field.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/sizes.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    TextEditingController passwordController = TextEditingController();
        TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
final FocusNode _nameFocus =FocusNode();
final FocusNode _passwordFocus =FocusNode();
final FocusNode _emailFocus =FocusNode();




  signUser(BuildContext context){
try {
   if (_formKey.currentState!.validate()) {
  context.read<AuthController>().signUser(
       context,
       nameController.text.trim(),emailController.text.trim() ,passwordController.text.trim(),
      
       (bool isAuth , bool isError ,String err){

 if (isError){
  //  log(value);
 ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Oops... $err'), 
         
         backgroundColor: Colors.red,
         ),
      );
 }

else   {ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('success'), 
        
          backgroundColor: Colors.green,
        ),
        
      );
 
  const LoginScreen().launch(context ,isNewTask: true);
}

       }
  );
   }
} catch (e) {
  
}

  }
  @override
  Widget build(BuildContext context) {
      var provider = Provider.of<AuthController>(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20 
          ),
          child: Form(
            key: _formKey,
            child:  SingleChildScrollView(
              child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                
                 children: [
                   SizedBox(height: MediaQuery.of(context).size.height/6,),
                  SizedBox(
                      width: 200.0,
                      height: 120.0,
                      child: Image.asset('assets/images/logo.png'),
                    
                    ),
              
              
                     SizedBox(height: defaultSpace,),
              
              
                    BoxInputField(
                    controller: nameController,
                    placeholder: 
                    
                 currentLang(context)=="ar"? 
                 "الاسم":"Name"
                    // 'Email'
                    ,
                    validator: (text){
                         if (text!.isEmpty) {
                    return 
                                      locale!.translate("name_required");
              
                    
                  }
                 
                  return null;
                    },
                  ) ,
              
              
              
                  SizedBox(height: defaultSpace,),
                    
                    BoxInputField(
                    controller: emailController,
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
                  if (text.length < 8) {
                    return 
                    
                                                        locale.translate("password_short");
              
                  }
                  return null;
                },
                    
                  ) ,
              
               SizedBox(height: defaultSpace,),
                    PasswordField(
                    controller: confirmPasswordController,
                    password: true,
                    placeholder:
                    
                              locale.translate("confirm_password")!
              
                     
                     ,
                    validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 
                                                        locale.translate("password_required");
              
                    
                  }
                  if (text.length < 8) {
                    return 
                    
                                                        locale.translate("password_short");
              
                  }
                  if (text!=passwordController.text.trim()) {
                     return 
                    
                                                        locale.translate("passwords_not_mathced");
                  }
                  return null;
                },
                    
                  ) ,
              
              
               SizedBox(height: defaultSpace,),
              
              
              BoxButton(
              title:             
                                      locale.translate("sign_up")!
              ,
              disabled: provider.isLoading,
              busy:provider.isLoading,
              onTap: (){
               
                        if (_formKey.currentState!.validate()) {
              signUser(context);
                        }
                        
              },
                    )
                  , 
              
              const SizedBox(height: 10,),
              
                     SizedBox(height: defaultSpace,),
                         RichText(  
                  text:  TextSpan(  
                      text: locale.translate('already_have_account'),  
                      style: const TextStyle(color: Colors.black, fontSize: 15),  
                      children: <TextSpan>[  
              TextSpan(text: ' ${locale.translate('login')}',  
                  style: const TextStyle(color: Colors.blueAccent, fontSize: 15) ,
                  recognizer:TapGestureRecognizer()..onTap=(){
              const LoginScreen().launch(context);
                  }
              )  
                 
              ],
              
              )  
              
              
              
               )
              
              
              
              
              
              ]
              ),
            )
          )
        )
      )
      
      );
  }
}