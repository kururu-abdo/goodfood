import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/assets/view/pages/cars_page.dart';
import 'package:goodfoods/app/assets/view/pages/maintainace_type.dart';
// import 'package:goodfoods/app/assets/view/pages/cars_page.dart';
import 'package:goodfoods/app/assets/view/pages/other_assets_page.dart';
import 'package:goodfoods/app/assets/view/pages/region_list.dart';
import 'package:goodfoods/app/help/view/pages/help_page.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class AssetsPage extends StatefulWidget {
  final  bool? fromDashboard;
  const AssetsPage({ Key? key, this.fromDashboard =false }) : super(key: key);

  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 3,
      child: Scaffold(
         appBar: 
        
        AppBar(
          elevation: 0,
          actions: [
            IconButton(onPressed: (){
    // const ChagePage().launch(context);
    HelpPage().launch(context);
            }, icon: const ImageIcon(AssetImage('assets/icons/headset.png')))
          ,
            // IconButton(onPressed: (){
    
            // }, icon: const ImageIcon(AssetImage('assets/icons/bell.png')))
          
          
          
          ],
          backgroundColor: Colors.white,
          titleSpacing: 0,
          
          leading: widget.fromDashboard!?const SizedBox(): 
    
    
          IconButton(onPressed: (){
    Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          title: Text(
            currentLang(context)=="ar"?"الاصول":"Assets"
          ),
        ),
       body: 
       
       GridView.count(
         crossAxisCount: 2,
  scrollDirection: Axis.vertical,           //default
  reverse: false,                           //default
  controller: ScrollController(),
  primary: false,
  childAspectRatio: 9/6,
  physics:const ScrollPhysics() ,
  shrinkWrap: true,
  padding: const EdgeInsets.all(5.0),
  children:  [
 Card(
        color: Theme.of(context).primaryColor,
        elevation: 5.0,
        child:  Center(
          child: Row( crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Image.asset("assets/icons/tools.png"
             ,color: Colors.white,
             
             height: 50,width: 50,
             
             ),
              Text(
                currentLang(context)=="ar"?"الماكينات ":
                "Machines",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  
                  color: Colors.white,
                  fontSize: 18.0),
              ),
            ],
          ),
        ),
      ).onTap((){

        const RegionsPage().launch(context);
      }),


Card(
        color: Theme.of(context).primaryColor.withOpacity(.80),
        elevation: 5.0,
        child:  Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Image.asset("assets/images/السيارات-removebg-preview.png"
             ,color: Colors.white,
             
             height: 50,width: 50,
             
             ),
              Text(
                currentLang(context)=="ar"?"السيارات":
                "Cars",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  
                  color: Colors.white,
                  fontSize: 18.0),
              ),
            ],
          ),
        ),
      ).onTap((){
        const CarsPage().launch(context);

  
      })
  ,
  
Card(
        color: Theme.of(context).primaryColor,
        elevation: 5.0,
        child:  Center(
          child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Image.asset("assets/icons/financial.png"
             ,color: Colors.white,
             
             height: 50,width: 50,
             
             ),
              Text(
                currentLang(context)=="ar"?"الاصول الاخرى":
                "Other Assets",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  
                  color: Colors.white,
                  fontSize: 18.0),
              ),
            ],
          ),
        ),
      ).onTap((){

        const OtherAssetsPage().launch(context);
      })
  
  
  ],

       )
       
       
//        const Column(children: [

// // Container(
// //   padding: const EdgeInsets.symmetric(horizontal: 10),
// // margin: const EdgeInsets.only(
// //   top: 10
// // ),
// //   height: MediaQuery.of(context).size.height/5,    
// //     width: MediaQuery.of(context).size.width,

// //   child:
// //     SingleChildScrollView(
// //       scrollDirection: Axis.horizontal,
// //       physics: const BouncingScrollPhysics(),
// //       child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //           DasboardItem(
// //         title: 'الماكينات' , count: 4,
// //         themeColor: Colors.purple,
// //        width:MediaQuery.of(context).size.width/3,
// //       ) , 
// //       DasboardItem(  width:MediaQuery.of(context).size.width/3,
// //         title: 'السيارات' , count: 4,
// //         themeColor: Colors.purple,
// //       ) ,     DasboardItem(
// //         title: 'اخرى' , count: 4,
// //         themeColor: Colors.purple, 
// //         width:MediaQuery.of(context).size.width/3,
// //       ) , 
// //       ],
// //       ),
// //     )
// //    ,
// // )

// //  , 
// //  const SizedBox(
// //    height: 80,
// //    child:  TabBar(
// //      labelColor: Colors.black,
     
// //           tabs: [
// //             Tab(
// //             text: 'ماكينات',
// //             // child: Tex,
// //           iconMargin: EdgeInsets.only(
// //             bottom: 5
// //           ),
              
// //               icon: Icon(Icons.directions_car)),
// //             Tab(
// //                    text: 'سيارات',
              
              
// //               icon: Icon(Icons.directions_transit)),
// //             Tab(
              
// //                    text: 'اصول اخرى',
              
// //               icon: Icon(Icons.directions_bike)),
// //           ],
// //         ),
// //  )
// //  , 
// //  const Expanded(child: 
 
// //  TabBarView(children: [
// //    MachineList() , 
// //    CarList() , 
// //    AssetsList()
// //  ],)
 
 
// //  )










//        ],),
       
      ),
    );
  }
}