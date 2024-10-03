import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/presentation/splash_screen.dart';
import 'package:goodfoods/core/services/notification_plugin.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        
        title:  Text(translate(context, "profile"
        
        
        ), style: const TextStyle(
                          color: Colors.black
                        ),),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
CircleAvatar(
                                backgroundColor: context.cardColor,
                                radius: 35,
                                // backgroundImage: Image.asset('assets/icons/user.png').image,
                                child: Center( child:Image.asset('assets/icons/user.png' , 
                                
                                
                                width: 30 ,height: 30,
                                ) ,
                              
                                
                                )),
            
            
            const SizedBox(height: 20),
            // User Name
           Text(sharedPrefs.user_name, style: boldTextStyle(
                                    color: Colors.black
                                  ))
                                      .paddingOnly(top: 2)
                                      .visible(true),
            
            const SizedBox(height: 10),
            // User Details
            Text(sharedPrefs.userType,
                                          style: boldTextStyle(
                                              color: Colors.black))
                                      .paddingOnly(top: 2)
                                      .visible(true),
          
            const SizedBox(height: 30),
            // Additional Info Section
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                   
                    const SizedBox(height: 10),
   Row(
                      children: [
                        const Icon(Icons.mail_outline, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                         sharedPrefs.userEmail,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

  const SizedBox(height: 10),
   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(currentLang(context)=="ar"?
                        "الحساب":"Account" ,
                        style: const TextStyle(
                          color: Colors.black
                        ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(onPressed: (){
//alert
         Dialogs.materialDialog(
          msg: translate(context,"want_delete_account")!,
          title: translate(context,"delete_account")!,
          color: Colors.white,
          context: context,
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: translate(context,"cancel")!,
              iconData: Icons.cancel_outlined,
              textStyle: const TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {


authController.logout(context);

//delete account
authController.deleteAccount(context);
//clear everything
NotificationApi.clear();
sharedPrefs.logout();
const SplashScreen().launch(context);

              },
              text: translate(context,"confirm")!,
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
                        }, icon: const Icon(Icons.delete ,color: Colors.red,))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}