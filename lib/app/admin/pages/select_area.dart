import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/home_area.dart';
import 'package:goodfoods/common/controllers/langauage_controller.dart';
import 'package:goodfoods/core/controllers/admin_home_controller.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class SelectAreaPage extends StatefulWidget {
  const SelectAreaPage({super.key});

  @override
  State<SelectAreaPage> createState() => _SelectAreaPageState();
}

class _SelectAreaPageState extends State<SelectAreaPage> {
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      // NotificationApi.notificationHandler();

// getNotificationCount();

    // NotificationApi.initMessage();
//get status data
context.read<AdminHomeController>().getAreaStaus(context);
context.read<AdminHomeController>().updateToken();

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

    
    var controller = Provider.of<AdminHomeController>(context);
    return 
     Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
key: _scaffoldKey,
    
      body:  RefreshIndicator(
          onRefresh: ()async{
        
            controller.getAreaStaus(context);
          },
        child: SizedBox.expand(
        
          child: 
          
        Builder(builder: (context){
        
        
        if (controller.areaStatus!.status==Status.LOADING) {
          return Center(
               child: mProgress(context, fromPage: true),
             );
        }
          else if( controller.areaStatus!.status==Status.ERROR){
           return Center(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
           Text(controller.areaStatus!.message!),
           const SizedBox(height: 10,) ,
           IconButton(onPressed: (){
             controller.getAreaStaus(context);
           }, icon:  Icon(
             Icons.refresh ,color: Theme.of(context).primaryColor,
           ))
               ],
             ),
           );
           }
        else {
      /*
        return   ListView(
          children: [
            Wrap(
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
            
            children: [
            
            
            
            OrderStatusWidget(
              status: 0,
              icon: 'assets/images/created.png',
              count: controller.areaStatus.data!.created,
            title: currentLang(context)=="ar"?
            "تم الانشاء":"Created",
            )
            , 
            OrderStatusWidget(
              status: 3,
               icon: 'assets/images/accepted.png',
              count: controller.orderStatusData!.data!.accepted, 
            title:currentLang(context) =="ar"?
            "تحت المعالجة":"Processing"
            ),
            OrderStatusWidget(
              status: 1,
               icon: 'assets/images/pre_closed.png',
              count: controller.orderStatusData!.data!.pre_closed, 
            title:currentLang(context) =="ar"?
            "قيد الاغلاق":"Closing",
            
            ), 
            
            OrderStatusWidget(
              status: 2,
            
               icon: 'assets/images/closed.png',
              count: controller.orderStatusData!.data!.closed, 
            title:currentLang(context) =="ar"?
            "تم الاغلاق":"Closed"
            ), 
            
            
            OrderStatusWidget(
              status: 4,
            icon: 'assets/images/cancel.png',
              count: controller.orderStatusData!.data!.rejected, 
            title:currentLang(context) =="ar"?
            "مرفوض":"Rejected"
            
            ),
            
            
            
            
            
            
            
            
            
            
            ],
            
            ),
        
          
          ],
        );
        
        */
        return  Column(

          children: [
SizedBox(height: MediaQuery.of(context).size.height/8,), 

Text(currentLang(context)=="ar"?
"الرجاء اختيار المنطقة":"Please select area"
, 
style: const TextStyle(
  fontSize: 20 , fontWeight: FontWeight.bold
),
)
,
SizedBox(height: MediaQuery.of(context).size.height/9,)

, 
Row(
  mainAxisAlignment: MainAxisAlignment.center,
children: controller.areaStatus!.data!.asMap()
.map((i , area)=> 

MapEntry(i, 
  
   Container(
    height: MediaQuery.of(context).size.width*.41 ,
      width: MediaQuery.of(context).size.width*.41,
      margin: const EdgeInsets.all(5),
      padding:  const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: 
        controller.selectedIndex==i?
        
        Border.all(width: .8, 
        
        color: Theme.of(context).primaryColor
        ):Border.all(width: 0 , color: Colors.transparent)
      ),
    child: Container(
      height: MediaQuery.of(context).size.width*.40 ,
      width: MediaQuery.of(context).size.width*.40,
      decoration:  BoxDecoration(
    
        color: Colors.white , 

border: Border.all(width: 0 , color: Colors.transparent)
      ),
    child: Center(child: Text(
      currentLang(context)=="ar"?
      area.nameAr.toString() :  area.nameEn.toString(), 
      
      
      style: const TextStyle(
        fontWeight: FontWeight.bold
      ),
      ),
      
    
      ),
    ),
  ).onTap((){
    controller.changeIndex(i);
  })
  )
).values.toList()


)
,

const Spacer() , 
TextButton(onPressed: (){
HomeArea(
  areaStatusData: 
  
  controller.areaStatus!.data![controller.selectedIndex]


  ,
).launch(context);
}, child:  Text(
  currentLang(context)=="ar"?"متابعة":
  
  "Continue",style: const TextStyle(
  fontSize: 15 , fontWeight: FontWeight.bold, 
  decoration: TextDecoration.underline ,color: Colors.blue
),)),
const SizedBox(height: 100,), 


          ],
        );
        
        
        }
        
        
        
        
        
        
        })
             
        ),
      ),

drawerEnableOpenDragGesture: false,

appBar:



      AppBar(
        // leadingWidth: 0,
        leadingWidth: 0,
         title:
         
         
         
          Image.asset('assets/images/logo.png' ,
        width: 150,
        // color: Colors.white,
        ),
          // backgroundColor: Theme.of(context).primaryColor,
      leading:
      
      const SizedBox()
      
//       IconButton(onPressed: (){
// _scaffoldKey.currentState?.openDrawer();
//       }, icon: const Icon(Icons.menu)),
      
      ,
        elevation: 0,
    

      )


 

    );
  
  }
}