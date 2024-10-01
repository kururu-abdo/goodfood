import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/assets_page.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/documents/views/pages/documents_page.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/maintance_page.dart';
import 'package:goodfoods/common/controllers/langauage_controller.dart';
import 'package:goodfoods/common/pages/order_page.dart';
import 'package:goodfoods/core/controllers/admin_home_controller.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/notifications_page.dart';
import 'package:goodfoods/core/presentation/splash_screen.dart';
import 'package:goodfoods/core/presentation/widgets/change_language_bottomsheet.dart';
import 'package:goodfoods/core/presentation/widgets/order_status_widget.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/services/notification_plugin.dart';
import 'package:goodfoods/core/utils/global.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:goodfoods/main.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeNew extends StatefulWidget {
  const HomeNew({super.key});

  @override
  State<HomeNew> createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {


final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   int? dropdownvalue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      NotificationApi.notificationHandler();

getNotificationCount();

    NotificationApi.initMessage();
//get status data
Provider.of<MaintenanceController>(context ,listen: false).getStatusData(context,

dropdownvalue
);
context.read<AdminHomeController>().updateToken();
context.read<AuthController>().getUserProfile();

    });
  }
  @override
  Widget build(BuildContext context) {
var appLocale = AppLocalizations.of(context);

var  langController  = Provider.of<LanguageProvier>(context);   
var  authController  = Provider.of<AuthController>(context);   


@override
void dispose() {
  _scaffoldKey.currentState!.closeDrawer();
  super.dispose();
}

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
    
    
    var controller = Provider.of<MaintenanceController>(context);
        // var authController = Provider.of<MaintenanceController>(context);

    return  
    
     Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
key: _scaffoldKey,
    
      body:  RefreshIndicator(
          onRefresh: ()async{
        dropdownvalue=null;
        setState(() {
          
        });
            controller.getStatusData(context , dropdownvalue
);
          },
        child: SizedBox.expand(
        
          child: 
          
        Column(
          children: [
     const SizedBox(height: 20,),
  Builder(
    builder: (context) {
return  
getBranches()!.length<=1?const SizedBox.shrink():
         Align(
                    alignment: AlignmentDirectional.centerStart,
      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
        child: PopupMenuButton(
                  onSelected: (value) {
                    // your logic
                    dropdownvalue =   
      authController.getMyBranches().indexWhere((branch)=> branch.id==value.id);
                    
        
        setState(() {
          
        });     
        controller.getStatusData(context, value.id);       
                  },
        itemBuilder: (BuildContext bc) {
         return 
                  authController.getMyBranches().map((e) =>   PopupMenuItem(
                        value: e,
                        child:Text(currentLang(context)=="ar"?e.nameAr.toString():e.nameEn.toString()),
                      )).toList();
        
           }
        , 
        
        child:        
        Container(
          width: 150 ,
          height: 30,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey ,width: .5
            )
        
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(dropdownvalue!=null?
                  currentLang(context)=="ar"?
               authController.getMyBranches()[dropdownvalue!].nameAr.toString(): 
                authController.getMyBranches()[dropdownvalue!].nameEn.toString()
                  // maintenanceController.selectedModel!
                  :
                   currentLang(context)=="ar"?'اختار الفرع':'select branch', 
                   
                   overflow: TextOverflow.ellipsis,
                   ),
              ),
              const Icon(Icons.keyboard_arrow_down_outlined )
            ],
          ),
        )
        ,
                ),
      ),
      );
   
      if (authController.user!.status==Status.ERROR ||
      authController.user!.status==Status.LOADING
      
      ) {
        return 
        
        // const Text("asdfsdf");
        const SizedBox.shrink();
      }
      else {
        var userData =  authController.user!.data;


        return
        
        userData!.branches!.length<=1? 
        
        // userData!.branches!.isEmpty? 
        
        const SizedBox.shrink():
        
         Align(
                    alignment: AlignmentDirectional.centerStart,
      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
        child: PopupMenuButton(
                  onSelected: (value) {
                    // your logic
                    dropdownvalue =   authController.getMyBranches().indexOf(
      authController.getMyBranches().firstWhere((branch)=> branch.id==value.id)
                    );
        
        setState(() {
          
        });     
        controller.getStatusData(context, value.id);       
                  },
        itemBuilder: (BuildContext bc) {
         return 
                  authController.getMyBranches().map((e) =>   PopupMenuItem(
                        value: e,
                        child:Text(currentLang(context)=="ar"?e.nameAr.toString():e.nameEn.toString()),
                      )).toList();
        
           }
        , 
        
        child:        
        Container(
          width: 150 ,
          height: 30,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey ,width: .5
            )
        
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(dropdownvalue!=null?
                  currentLang(context)=="ar"?
               authController.getMyBranches()[dropdownvalue!].nameAr.toString(): 
                authController.getMyBranches()[dropdownvalue!].nameEn.toString()
                  // maintenanceController.selectedModel!
                  :
                   currentLang(context)=="ar"?'اختار الفرع':'select branch', 
                   
                   overflow: TextOverflow.ellipsis,
                   ),
              ),
              const Icon(Icons.keyboard_arrow_down_outlined )
            ],
          ),
        )
        ,
                ),
      ),
      );
   
   
   
      }
    }
  ),



  const SizedBox(height: 10,),

            Builder(builder: (context){
            
            
            if (controller.orderStatusData!.status==Status.LOADING) {


              return 
                 Wrap(
            
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                
                children: List.generate(5, (i){
return
 Skeletonizer(
  enabled: true,
   child: ClipPath(
         clipper: const ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          )
      ),
      child:
   Container(
    
       margin: const EdgeInsets.only(
            bottom: 10 , left: 5 ,right: 5,
            top: 10
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 6 ,horizontal: 15
          ),
          width: MediaQuery.of(context).size.width*.45,
          height: MediaQuery.of(context).size.width*.45,
   decoration:   const BoxDecoration(
      
             color: Colors.white,
      
        //      gradient: const LinearGradient(
        //   stops:  [0.05, 0.02],
        //   colors: [Colors.red, Colors.white]
        // ),
        //      borderRadius: const BorderRadius.all(
        // Radius.circular(10),
        // ),
        boxShadow: [
        BoxShadow(
        color: Color(0xffDDDDDD),
        blurRadius: 2.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 3.0),
        )
        ],
      
            border: Border(
              bottom: BorderSide(
                
                  width: 7.0,
                
                
                
             
               
               
               )
            )
         
         
         
          ),
   
   child:  Column(children: [
Container(width: 80,height: 80,color: Colors.white,),
     const Text('The title goes here'),
      const Text('The title goes here'),
       const Text('The title goes here'),
   ],),
   )
   ),
 );


                }));

              return Center(
                   child: mProgress(context, fromPage: true),
                 );
            }
              else if( controller.orderStatusData!.status==Status.ERROR){
               return Center(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
               Text(controller.orderStatusData!.message!),
               const SizedBox(height: 10,) ,
               IconButton(onPressed: (){
                 controller.getStatusData(context , dropdownvalue
);
               }, icon:  Icon(
                 Icons.refresh ,color: Theme.of(context).primaryColor,
               ))
                   ],
                 ),
               );
               }
            else {
            
            return   Expanded(
              child: ListView(
                children: 
                [
                Wrap(
                            
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                
                children: [
                
                
                
                OrderStatusWidget(
                  status: 0,
                  icon: 'assets/images/created.png',
                  count: controller.orderStatusData!.data!.created,
                title: currentLang(context)=="ar"?
                "تم الانشاء":"Created",
                 branch: dropdownvalue!=null?
                 authController.getMyBranches()[dropdownvalue!].id
                  :
                  (authController.getMyBranches().isNotEmpty?
                
                authController.getMyBranches().first.id:null), 
                // region: ,
                )
                , 
                OrderStatusWidget(
                  status: 3,
                   icon: 'assets/images/accepted.png',
                  count: controller.orderStatusData!.data!.accepted, 
                title:currentLang(context) =="ar"?
                "تحت المعالجة":"Processing", 
                 branch: 
                 dropdownvalue!=null?
                 authController.getMyBranches()[dropdownvalue!].id
                  :
                 
                 (authController.getMyBranches().isNotEmpty?
                
                authController.getMyBranches().first.id:null)
                ),
                OrderStatusWidget(
                  status: 1,
                   icon: 'assets/images/pre_closed.png',
                  count: controller.orderStatusData!.data!.pre_closed, 
                title:currentLang(context) =="ar"?
                "قيد الاغلاق":"Closing",
                 branch:  dropdownvalue!=null?
                 authController.getMyBranches()[dropdownvalue!].id
                  :
                  (authController.getMyBranches().isNotEmpty?
                
                authController.getMyBranches().first.id:null)
                ), 
                
                OrderStatusWidget(
                  status: 2,
                branch: dropdownvalue!=null?
                 authController.getMyBranches()[dropdownvalue!].id
                  :
                  (authController.getMyBranches().isNotEmpty?
                
                authController.getMyBranches().first.id:null)
                ,
                   icon: 'assets/images/closed.png',
                  count: controller.orderStatusData!.data!.closed, 
                title:currentLang(context) =="ar"?
                "تم الاغلاق":"Closed" , 
                
                ), 
                
                
                OrderStatusWidget(
                  status: 4,
                icon: 'assets/images/cancel.png',
                  count: controller.orderStatusData!.data!.rejected, 
                title:currentLang(context) =="ar"?
                "مرفوض":"Rejected"
                , 
                 branch: dropdownvalue!=null?
                 authController.getMyBranches()[dropdownvalue!].id
                  :
                  (authController.getMyBranches().isNotEmpty?
                
                authController.getMyBranches().first.id:null)
                ),
                
                
                
                
                
                
                
                
                
                
                ],
                
                ),
                          ]),
            );
            
            
            
            
            
            }
            
            
            
            
            
            
            }),
          ],
        )
             
        ),
      ),

drawerEnableOpenDragGesture: false,

appBar:



      AppBar(
        // leadingWidth: 0,
        
         title:
         
         
          Image.asset('assets/images/logo.png' ,
        width: 150,
        // color: Colors.white,
        ),
          // backgroundColor: Theme.of(context).primaryColor,
      leading:IconButton(onPressed: (){
_scaffoldKey.currentState?.openDrawer();
      }, icon: const Icon(Icons.menu)),
        elevation: 0,
        actions: [



  
         MaterialButton(onPressed: (){
        const NotificationPage().launch(context).then((value){
context.read<AuthController>().getUserProfile();

setState(() {
  
});
        });
         
            } ,  
            child: 
            ValueListenableBuilder<int>(valueListenable: notificationCounterNotifier,
            
             builder: (context, count ,child){
if (count<=0) {
  
                return const ImageIcon(
                        AssetImage('assets/icons/bell.png')
                        ,
                        size:25 ,  
                
                color: 
                
                //  _currentTab ==1? 
                          
                //           //  Colors.white
                //                       Theme.of(context).primaryColor

                // :
                
                
                Colors.black
                          
                          // Theme.of(context).primaryColor
                          //   :Colors.grey
                        
                        
                        
                        
                );
            
}else {

      return 
              
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                    
                    const ImageIcon(
                          AssetImage('assets/icons/bell.png')
                          ,
                          size:25 ,  
                                    
                                    color: Colors.black
                            
                            // Theme.of(context).primaryColor
                            //   :Colors.grey
                          
                          
                          
                          
                                    ), 
                    
                                    Positioned(
                    
                    top: 0,
                    right: 0,
                    child: 
                                    Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red 
                    ),
                    child: Center(
                      child: Text(
                        ///TODO:NOTIFICATION COUNT
                        
                       count.toString() ,
                      
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 12
                      ),
                      ),
                    ),
                                    )
                                    
                                    )
                    
                    ],),
                  );
               
               
}


             })
            
            
          
          
            )






/*




,


            MaterialButton(onPressed: (){
         
        
            } ,  
            child:  const ImageIcon(
        AssetImage('assets/icons/settings.png')
        ,
        size:25 ,  
            
            color
            :Colors.black
        
        
        
            ),
            
            )
        ,
        */
,
         IconButton(onPressed: (){
const ChagePage().launch(context);
          }, icon: const ImageIcon(
            AssetImage('assets/icons/headset.png')
            
            ) ,  
            
            // color: Colors.white,
            )
      ]
 

      )


,

drawer:  Drawer(
   child:ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            
            color: Theme.of(context).primaryColor
          ),
          child: Row(
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
                                  Text(sharedPrefs.user_name, style: boldTextStyle(
                                    color: Colors.white
                                  ))
                                      .paddingOnly(top: 2)
                                      .visible(true),
                                  Text(sharedPrefs.userType,
                                          style: boldTextStyle(
                                              color: Colors.white))
                                      .paddingOnly(top: 2)
                                      .visible(true),
                                ],
                              ).paddingOnly(left: 4, right: 4, bottom: 8),
              ),
            ],
          ),
      
        ) , 

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
                       'assets/icons/chat2.png',
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
                  }).visible(sharedPrefs.authList.contains("branch")),  
   Divider(height: 4, thickness: 2, color: context.dividerColor)
                      .paddingOnly(top: 16, bottom: 8)
                      
                      .visible(sharedPrefs.authList.contains("branch"))
                      
                      ,
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
                      () async {   Navigator.pop(context);
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
   Navigator.pop(context);
                        
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
NotificationApi.clear();
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
    
    
      ]
   )
),

floatingActionButton: FloatingActionButton.extended(
  backgroundColor: Theme.of(context).primaryColor,
  onPressed: (){
 const MaintenancePage().launch(context);
}, label: Text(currentLang(context)=="ar"?"طلب جديد":"New order"),icon:
 const Icon(Icons.add, color: Colors.white,),
 )
 .visible(
           !sharedPrefs.isMaintain
         ),
 
 

    );
  
  
  }
}