import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/admin/pages/new_maintance_order.dart';
import 'package:goodfoods/app/admin/widgets/dashboard_item.dart';
import 'package:goodfoods/app/help/view/pages/help_page.dart';
import 'package:goodfoods/core/presentation/notifications_page.dart';
import 'package:goodfoods/core/presentation/widgets/order_list.dart';
import 'package:nb_utils/nb_utils.dart';

class OdersPage extends StatefulWidget {
  final bool? fromDashboard;
  const OdersPage({ Key? key, this.fromDashboard  =false }) : super(key: key);

  @override
  _OdersPageState createState() => _OdersPageState();
}

class _OdersPageState extends State<OdersPage> {
  @override
  Widget build(BuildContext context) {


    
    return  DefaultTabController(
          length: 3,
      
      child: Scaffold(



        floatingActionButton: FloatingActionButton(
          
          backgroundColor: Theme.of(context).primaryColor,
          
          onPressed: 
        
        (){

showAdaptiveActionSheet(
 context: context,
 title: const Text(
   
   
   'الرجاء اختيار نوع الصيانة: '),
 androidBorderRadius: 30,
 actions: <BottomSheetAction>[
    BottomSheetAction(leading: const Text('صيانة ماكينة'),
    title: const SizedBox(),
   trailing: const Icon(Icons.fire_truck),
     onPressed: (context) {
const MaintenanceOrder().launch(context);


    }),
    BottomSheetAction(
         trailing: const Icon(Icons.car_crash),

      title: const SizedBox(),
      leading: const Text('صيانة اخرى'), onPressed: (context) {}),
 ],
 cancelAction: CancelAction(
   
   textStyle: TextStyle(
     color: Theme.of(context).primaryColor
   ),
   title: const Text('ألغاء')),// onPressed parameter is optional by default will dismiss the ActionSheet
);


        }
         , 

         child: const Icon(Icons.add),
        
        ),
          appBar: 
        
        AppBar(
          elevation: 0,
          actions: [
            IconButton(onPressed: (){
    // const ChagePage().launch(context);
    HelpPage().launch(context);
            }, icon: const ImageIcon(AssetImage('assets/icons/headset.png')))
          ,
            IconButton(onPressed: (){
    NotificationPage().launch(context);
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
       
         body: Column(children: [  


Container(
  padding: const EdgeInsets.symmetric(horizontal: 10),
margin: const EdgeInsets.only(
  top: 10
),
  height: MediaQuery.of(context).size.height/5,    
    width: MediaQuery.of(context).size.width,

  child:
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          DasboardItem(
        title: 'المكتملة' , count: 4,
        themeColor: Colors.purple,
       width:MediaQuery.of(context).size.width/3,
      ) , 
      DasboardItem(  width:MediaQuery.of(context).size.width/3,
        title: 'قيد التنفيذ' , count: 4,
        themeColor: Colors.purple,
      ) ,     DasboardItem(
        title: 'تم الالغاء' , count: 4,
        themeColor: Colors.purple, 
        width:MediaQuery.of(context).size.width/3,
      ) , 
      ],
      ),
    )
   ,
)

 , 
 const SizedBox(
   height: 80,
   child:  TabBar(
     labelColor: Colors.black,
     
          tabs: [
            Tab(
            text: 'قيد التفيذ',
            // child: Tex,
          iconMargin: EdgeInsets.only(
            bottom: 5
          ),
              
              icon: Icon(Icons.directions_car)),
            Tab(
                   text: 'تم التنفيذ',
              
              
              icon: Icon(Icons.directions_transit)),
            Tab(
              
                   text: 'تم الالغاء',
              
              icon: Icon(Icons.directions_bike)),
          ],
        ),
 )
 , 
const Expanded(child: 
TabBarView(children: [

OrderList(status: 0,) ,

OrderList(status:1 ,) ,
OrderList(status: 2,) ,


  
],)

)

         ])
      ),
    );
  
  
  
  }
}