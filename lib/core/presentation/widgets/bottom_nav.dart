

import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/home.dart';
import 'package:goodfoods/app/admin/pages/settings_page.dart';
import 'package:goodfoods/app/admin/pages/stats_page.dart';
import 'package:goodfoods/core/controllers/app_state.dart';
import 'package:goodfoods/core/presentation/notifications_page.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

Widget mDarkBottomNav(BuildContext context){
  var controller = Provider.of<AppState>(context);
  
return    Positioned(

      bottom: 15,
      child: 
      Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.10) ,
          borderRadius: BorderRadius.circular(50)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


      MaterialButton(onPressed: (){
controller.setPageIndex=0;

 const Home().launch(context);
      } ,  
      child:   ImageIcon(
        const AssetImage('assets/icons/home.png'),
         size:25 ,  
      
      color: 
      controller.pageIndex ==0? 
      
      Colors.white
      :Colors.grey

      ,),
      
      )
    
    
    ,



      MaterialButton(onPressed: (){
 controller.setPageIndex=1;
const StatsPage().launch(context);
 
      } ,  
      child:  ImageIcon(
        const AssetImage('assets/icons/stats.png')
,
  size:25 ,  
      
      color:  controller.pageIndex ==1? 
    Colors.white
      :Colors.grey




      ),
      
      )



,




      MaterialButton(onPressed: (){
 controller.setPageIndex=2;
const NotificationPage().launch(context);
 
      } ,  
      child:  ImageIcon(
        const AssetImage('assets/icons/bell.png')
,
  size:25 ,  
      
      color:  controller.pageIndex ==2? 
    Colors.white
      :Colors.grey




      ),
      
      ),

      MaterialButton(onPressed: (){
 controller.setPageIndex=3;

 const AdminSettings().launch(context);
      } ,  
      child:  ImageIcon(
        const AssetImage('assets/icons/settings.png')
,
  size:25 ,  
      
      color:  controller.pageIndex ==3? 
    Colors.white
      :Colors.grey




      ),
      
      )




          ],
        ),
      ),
    );
    

}




Widget mLightBottomNav(BuildContext context){
  var controller = Provider.of<AppState>(context);
  
return    Positioned(

      bottom: 15,
      child:
      
      
       Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10),

        // width: 350,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.10) ,
          borderRadius: BorderRadius.circular(50)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


      MaterialButton(onPressed: (){
controller.setPageIndex=0;
 const Home().launch(context ,
 
 pageRouteAnimation: PageRouteAnimation.Fade
 );
 
      } ,  
      child:   ImageIcon(
        const AssetImage('assets/icons/home.png'),
         size:25 ,  
      
      color: 
      controller.pageIndex ==0? 
      
      Theme.of(context).primaryColor
      :Colors.grey

      ,),
      
      )
    
    
    ,



      MaterialButton(onPressed: (){
 controller.setPageIndex=1;
 const StatsPage().launch(context);

 
      } ,  
      child:  ImageIcon(
        const AssetImage('assets/icons/stats.png')
,
  size:25 ,  
      
      color:  controller.pageIndex ==1? 
    Theme.of(context).primaryColor
      :Colors.grey




      ),
      
      )



,

   MaterialButton(onPressed: (){
 controller.setPageIndex=2;
const NotificationPage().launch(context);

 
      } ,  
      child:  ImageIcon(
        const AssetImage('assets/icons/bell.png')
,
  size:25 ,  
      
      color:  controller.pageIndex ==2? 
    Theme.of(context).primaryColor
      :Colors.grey




      ),
      
      )



,



      MaterialButton(onPressed: (){
 controller.setPageIndex=3;

 const AdminSettings().launch(context);

      } ,  
      child:  ImageIcon(
        const AssetImage('assets/icons/settings.png')
,
  size:25 ,  
      
      color:  controller.pageIndex ==3? 
    Theme.of(context).primaryColor
      :Colors.grey




      ),
      
      )




          ],
        ),
      ),
    
    
    
    );
    

}








