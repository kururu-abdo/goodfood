import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/assets_page.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/documents/views/pages/documents_page.dart';
import 'package:goodfoods/common/controllers/langauage_controller.dart';
import 'package:goodfoods/common/pages/order_page.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/presentation/notifications_page.dart';
import 'package:goodfoods/core/presentation/splash_screen.dart';
import 'package:goodfoods/core/presentation/widgets/change_language_bottomsheet.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class AdminSettings extends StatefulWidget {
    final bool?  fromDashboard;

  const AdminSettings({ Key? key, this.fromDashboard }) : super(key: key);

  @override
  _AdminSettingsState createState() => _AdminSettingsState();
}

class _AdminSettingsState extends State<AdminSettings> {
  @override
  Widget build(BuildContext context) {
var appLocale = AppLocalizations.of(context);

var  langController  = Provider.of<LanguageProvier>(context);   
var  authController  = Provider.of<AuthController>(context);   


     Widget mSideMenu(var text, var icon, Function onTap) {
      return SettingItemWidget(
        title: text,
        leading:
        (icon is String)?
        ImageIcon(AssetImage(icon) ,  
        
        color:
             Theme.of(context).textTheme.titleSmall!.color
        ): 

            Icon(icon, color:
             Theme.of(context).textTheme.titleSmall!.color),


        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          onTap.call();
        },
        titleTextStyle: secondaryTextStyle(size: 16),
      );
    }
    
    
    
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       
       
       
        appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
const ChagePage().launch(context);
          }, icon: const ImageIcon(AssetImage('assets/icons/headset.png')))
        ,
          IconButton(onPressed: (){
   const NotificationPage().launch(context);  
          }, icon: const ImageIcon(AssetImage('assets/icons/bell.png')))
        
        
        
        ],
        backgroundColor: Colors.white,
        titleSpacing: 0,
        
        leading: widget.fromDashboard!?const SizedBox(): 


        IconButton(onPressed: (){
Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        title: Image.asset('assets/images/logo.png' ,
        width: 150,
        
        ),
      ),
     


body: SingleChildScrollView(
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
   16.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: CircleAvatar(
                                backgroundColor: context.cardColor,
                                radius: 35,
                                // backgroundImage: Image.asset('assets/icons/user.png').image,
                                child: Center( child:Image.asset('assets/icons/user.png' , 
                                
                                
                                width: 30 ,height: 30,
                                ) ,
                              
                                
                                )),
                      ),
                      8.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            10.height,
                            Text(sharedPrefs.user_name, style: boldTextStyle())
                                .paddingOnly(top: 2)
                                .visible(true),
                            Text(sharedPrefs.userType,
                                    style: boldTextStyle(
                                        color: Colors.grey))
                                .paddingOnly(top: 2)
                                .visible(true),
                          ],
                        ).paddingOnly(left: 4, right: 4, bottom: 8),
                      )
                    ],
                  )
                      .paddingOnly(left: 4)
                      .paddingOnly(left: 8, right: 8)
                      .visible(true)
    ,
    
     Divider(height: 4, thickness: 2, color: context.dividerColor)
                      .paddingOnly(top: 16, bottom: 8)
                      .visible(true),
                  mSideMenu(
                     appLocale!.translate("notifications")
                     
                     
             
                      
                      
                      
                      ,
                       'assets/icons/bell.png',
                      () async {
                 const NotificationPage().launch(context);  
                  }).visible(true),
                 
          Divider(height: 4, thickness: 2, color: context.dividerColor)
                      .paddingOnly(top: 16, bottom: 8)
                      .visible(true),
                  mSideMenu(
                           appLocale.translate("message"),
                       'assets/icons/headset.png',
                      () async {
                   const ChagePage().launch(context);
                  }).visible(true),  
                   Divider(height: 4, thickness: 2, color: context.dividerColor)
                      .paddingOnly(top: 16, bottom: 8)
                      .visible(true),
                  mSideMenu(
                       appLocale.translate("orders"),
                       'assets/icons/tools.png',
                      () async {
                   const OdersPage().launch(context);
                  }).visible(false),  
  Divider(height: 4, thickness: 2, color: context.dividerColor)
                      .paddingOnly(top: 16, bottom: 8)
                      .visible(false),
                  mSideMenu(
                        appLocale.translate("assets"),
                       'assets/icons/financial.png',
                      () async {
                   const AssetsPage().launch(context);
                  }).visible(!sharedPrefs.isAdmin),  
   Divider(height: 4, thickness: 2, color: context.dividerColor)
                      .paddingOnly(top: 16, bottom: 8)
                      .visible(!sharedPrefs.isAdmin),
                  mSideMenu(
                      appLocale.translate("documents"),
                       'assets/icons/document.png',
                      () async {
                   const DocumentsPage().launch(context);
                  }).visible(true),  
  
  
          
         Divider(height: 4, thickness: 2, color: context.dividerColor)
                      .paddingOnly(top: 16, bottom: 8)
                      .visible(true),
                  mSideMenu(
                        appLocale.translate("change_lang"),
                       'assets/icons/language.png',
                      () async {
 showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)
        )
      ),
      builder: (_)=>const ChangeLanguageBottomSheet() );





//                    showAdaptiveActionSheet(
//  context: context,
//  title:  Text(   appLocale.translate("please_select_lang")!),
//  androidBorderRadius: 30,
//  actions: <BottomSheetAction>[
//     BottomSheetAction(
      
      
//       leading:  Text(
//  appLocale.translate("ar")!
//  ,
 
//     ),
//     title: const SizedBox(),
//    trailing: 
//     langController.appLocal!.languageCode=="ar"?
//     const Icon(
    
     
//      Icons.check_circle ,color: Colors.green ,size: 30,):null,
//      onPressed: (context) {

// langController.changeLanguage(const Locale("ar"));
//     }),
//     BottomSheetAction(
//          trailing:  langController.appLocal!.languageCode=="en"?
//     const Icon(
    
     
//      Icons.check_circle ,color: Colors.green ,size: 30,):null,

//       title: const SizedBox(),
//       leading:  Text( appLocale.translate("en")!),
      
      
//        onPressed: (context) {

//          langController.changeLanguage(const Locale("en"));
//        }),
//  ],
//  cancelAction: CancelAction(
   
//    textStyle: TextStyle(
//      color: Theme.of(context).primaryColor
//    ),
//    title:  Text(appLocale.translate("cancel")!)),// onPressed parameter is optional by default will dismiss the ActionSheet
// );


                  }).visible(true), 
  
  
  
                       Divider(height: 4, thickness: 2, color: context.dividerColor)
                      .paddingOnly(top: 16, bottom: 8)
                      .visible(true),
                  mSideMenu(
                     appLocale.translate("logout")!,
                       'assets/icons/power-off.png',
                      () async {

                        
                   Dialogs.materialDialog(
          msg:   appLocale.translate("sure_logout")!,
          title: appLocale.translate("logout")!,
          color: Colors.white,
          context: context,
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: appLocale.translate("cancel")!,
              iconData: Icons.cancel_outlined,
              textStyle: const TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {


authController.logout(context);

sharedPrefs.logout();
const SplashScreen().launch(context);

              },
              text: appLocale.translate("logout")!,
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
                  }).visible(true), 
    ],
  ),
),
    );
  }
}