import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/assets_page.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/admin/pages/profile_page.dart';
import 'package:goodfoods/app/documents/views/pages/documents_page.dart';
import 'package:goodfoods/common/controllers/langauage_controller.dart';
import 'package:goodfoods/common/pages/order_page.dart';
import 'package:goodfoods/core/controllers/admin_home_controller.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/models/area_staus_data.dart';
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

class HomeArea extends StatefulWidget {
  final AreaStatusData? areaStatusData;
  const HomeArea({super.key, this.areaStatusData});

  @override
  State<HomeArea> createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeArea> {


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
// Provider.of<MaintenanceController>(context ,listen: false).getStatusData(context);
context.read<AdminHomeController>().updateToken();
context.read<AuthController>().getUserProfile();
Provider.of<MaintenanceController>(context ,listen: false).getAreaDataByBranch(context,
widget.areaStatusData!.id,
dropdownvalue
);
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
    return  
    
     Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
key: _scaffoldKey,
    
      body:  RefreshIndicator(
          onRefresh: ()async{
        dropdownvalue=null;
        Provider.of<MaintenanceController>(context ,listen: false).getAreaDataByBranch(context,
widget.areaStatusData!.id,
dropdownvalue
);
            // controller.getStatusData(context);
          },
        child: SizedBox.expand(
        
          child: 
          
        Builder(builder: (context){
        
      return   SizedBox.expand(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
const SizedBox(height: 20,),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
        child: PopupMenuButton(
                  onSelected: (value) {
                    // your logic
                   dropdownvalue =
                       widget.areaStatusData!.branchs!.indexOf(
        widget.areaStatusData!.branchs!.firstWhere((branch)=> branch.id==value.id)
                    );
        // dropdownvalue =   value.id;
        setState(() {
          
        });         
                controller.getAreaDataByBranch(context,
      widget.areaStatusData!.id,
      widget.areaStatusData!.branchs![dropdownvalue!].id
      );   
                  },
        itemBuilder: (BuildContext bc) {
         return 
                   widget.areaStatusData!.branchs!.map((e) =>   PopupMenuItem(
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
                widget.areaStatusData!.branchs![dropdownvalue!].nameAr.toString(): 
                 widget.areaStatusData!.branchs![dropdownvalue!].nameEn.toString()
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
   
   
    Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text(currentLang(context)=="ar"?
              "عرض المناطق":"Back to regions"
              ,style: const TextStyle(
                fontSize: 15 , fontWeight: FontWeight.bold
              ),
              )),
    )
    ],
  ),














        const SizedBox(height: 15,),


              Builder(
                builder: (context) {
                   if (controller.areaStatusDataByBranch!.status==Status.LOADING) {


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
               Text(controller.areaStatusDataByBranch!.message!),
               const SizedBox(height: 10,) ,
               IconButton(onPressed: (){
                 controller.getAreaDataByBranch(context,
widget.areaStatusData!.id,
dropdownvalue
);
               }, icon:  Icon(
                 Icons.refresh ,color: Theme.of(context).primaryColor,
               ))
                   ],
                 ),
               );
               }
                // ignore: curly_braces_in_flow_control_structures
                else   return Expanded(
                  child: ListView(
                    children:[
                     Wrap(
                        runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.center,
                      
                      children: [
                      
                      
                      
                      OrderStatusWidget(
                        status: 0,
                        icon: 'assets/images/created.png',
                        count: controller.areaStatusDataByBranch!.data!.created,
                      title: currentLang(context)=="ar"?
                      "تم الانشاء":"Created",
                      region: widget.areaStatusData!.id, 
                      branch:
                      
                      dropdownvalue==null?null:
                       widget.areaStatusData!.branchs![dropdownvalue!].id
,
                      )
                      , 
                      OrderStatusWidget(
                        status: 3,
                         icon: 'assets/images/accepted.png',
                        count: controller.areaStatusDataByBranch!.data!.accpeted, 
                      title:currentLang(context) =="ar"?
                      "تحت المعالجة":"Processing",
                      region: widget.areaStatusData!.id , 
                    
                                        branch:                       dropdownvalue==null?null:
widget.areaStatusData!.branchs![dropdownvalue!].id
,
                    
                      ),
                      OrderStatusWidget(
                        status: 1,
                         icon: 'assets/images/pre_closed.png',
                        count: controller.areaStatusDataByBranch!.data!.preClosed, 
                      title:currentLang(context) =="ar"?
                      "قيد الاغلاق":"Closing",
                      
                      region: widget.areaStatusData!.id , 
                                        branch:                      dropdownvalue==null?null:
 widget.areaStatusData!.branchs![dropdownvalue!].id
,
                    
                      ), 
                      
                      OrderStatusWidget(
                        status: 2,
                      
                         icon: 'assets/images/closed.png',
                        count:controller.areaStatusDataByBranch!.data!.closed, 
                      title:currentLang(context) =="ar"?
                      "تم الاغلاق":"Closed",
                      region: widget.areaStatusData!.id , 
                                        branch:                      dropdownvalue==null?null:
 widget.areaStatusData!.branchs![dropdownvalue!].id
,
                    
                      ), 
                      
                      
                      OrderStatusWidget(
                        status: 4,
                      icon: 'assets/images/cancel.png',
                        count: controller.areaStatusDataByBranch!.data!.rejected, 
                      title:currentLang(context) =="ar"?
                      "مرفوض":"Rejected",
                      region: widget.areaStatusData!.id , 
                                        branch:                      dropdownvalue==null?null:
 widget.areaStatusData!.branchs![dropdownvalue!].id
,
                    
                      
                      ),
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      ],
                      
                      ),
                
                    ]
                  ),
                );
                }
              ),
          
            
            ],
          ),
      );
        
        
        
        
        
        
        
        
        })
             
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
            ), 



          
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
           
           
           IconButton(onPressed: (){
ProfilePage().launch(context);

           }, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,))
           
           
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


 
 

    );
  
  
  }
}