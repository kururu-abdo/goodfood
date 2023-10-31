import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:nb_utils/nb_utils.dart';

AppBar  mAppBar(
  BuildContext context,
  
  String? title, 

[Widget leading= const  SizedBox()]
){

var appLocale = AppLocalizations.of(context);

return 



      AppBar(
        
         title:
         title!=null?
         Text(title ,
         
         
         style: const TextStyle(
               color: Colors.white,
         ),
         ):
         
          Image.asset('assets/images/logo.png' ,
        width: 150,
        color: Colors.white,
        ),
          backgroundColor: Theme.of(context).primaryColor,
      leading:leading,
        elevation: 0,
        actions: [





//  IconButton(onPressed: (){

                        
//                    Dialogs.materialDialog(
//           msg:   appLocale!.translate("sure_logout")!,
//           title: appLocale.translate("logout")!,
//           color: Colors.white,
//           context: context,
//           actions: [
//             IconsOutlineButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               text: appLocale.translate("cancel")!,
//               iconData: Icons.cancel_outlined,
//               textStyle: const TextStyle(color: Colors.grey),
//               iconColor: Colors.grey,
//             ),
//             IconsButton(
//               onPressed: () {

// sharedPrefs.clear();

// const SplashScreen().launch(context);

//               },
//               text: appLocale.translate("logout")!,
//               iconData: Icons.delete,
//               color: Colors.red,
//               textStyle: const TextStyle(color: Colors.white),
//               iconColor: Colors.white,
//             ),
//           ]);
//           }, icon: const ImageIcon(
//             AssetImage('assets/icons/power-off.png')
            
//             ) ,  
            
//             color: Colors.white,
//             )
//         ,




 IconButton(onPressed: (){
const ChagePage().launch(context);
          }, icon: const ImageIcon(
            AssetImage('assets/icons/headset.png')
            
            ) ,  
            
            color: Colors.white,
            )
        ,

          // IconButton(onPressed: (){

          // }, icon: const ImageIcon(AssetImage('assets/icons/bell.png'))
          
          // ,
          // color: Colors.white
          // )
        
        

        ]

      );
}









AppBar  mLightAppBar(
  BuildContext context,
  
  String? title, 

[Widget leading= const  SizedBox()]
){

var appLocale = AppLocalizations.of(context);

return 



      AppBar(
        
         title:
         title!=null?
         Text(title ,
         
         
         style: const TextStyle(
              //  color: Colors.white,
         ),
         ):
         
          Image.asset('assets/images/logo.png' ,
        width: 150,
        // color: Colors.white,
        ),
          // backgroundColor: Theme.of(context).primaryColor,
      leading:leading,
        elevation: 0,
        actions: [





//  IconButton(onPressed: (){

                        
//                    Dialogs.materialDialog(
//           msg:   appLocale!.translate("sure_logout")!,
//           title: appLocale.translate("logout")!,
//           color: Colors.white,
//           context: context,
//           actions: [
//             IconsOutlineButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               text: appLocale.translate("cancel")!,
//               iconData: Icons.cancel_outlined,
//               textStyle: const TextStyle(color: Colors.grey),
//               iconColor: Colors.grey,
//             ),
//             IconsButton(
//               onPressed: () {

// sharedPrefs.clear();

// const SplashScreen().launch(context);

//               },
//               text: appLocale.translate("logout")!,
//               iconData: Icons.delete,
//               color: Colors.red,
//               textStyle: const TextStyle(color: Colors.white),
//               iconColor: Colors.white,
//             ),
//           ]);
//           }, icon: const ImageIcon(
//             AssetImage('assets/icons/power-off.png')
            
//             ) ,  
            
//             // color: Colors.white,
//             )
//         ,




 IconButton(onPressed: (){
const ChagePage().launch(context);
          }, icon: const ImageIcon(
            AssetImage('assets/icons/headset.png')
            
            ) ,  
            
            // color: Colors.white,
            )
        ,
          // IconButton(onPressed: (){

          // }, icon: const ImageIcon(AssetImage('assets/icons/bell.png'))
          
          // ,
          // // color: Colors.white
          // )
        
        

        ]

      );
}



