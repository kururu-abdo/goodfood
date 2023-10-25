import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/admin/widgets/dashboard_item.dart';
import 'package:goodfoods/core/presentation/widgets/assets_list.dart';
import 'package:goodfoods/core/presentation/widgets/car_list.dart';
import 'package:goodfoods/core/presentation/widgets/machine_list.dart';
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
    const ChagePage().launch(context);
            }, icon: const ImageIcon(AssetImage('assets/icons/headset.png')))
          ,
            IconButton(onPressed: (){
    
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
        title: 'الماكينات' , count: 4,
        themeColor: Colors.purple,
       width:MediaQuery.of(context).size.width/3,
      ) , 
      DasboardItem(  width:MediaQuery.of(context).size.width/3,
        title: 'السيارات' , count: 4,
        themeColor: Colors.purple,
      ) ,     DasboardItem(
        title: 'اخرى' , count: 4,
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
            text: 'ماكينات',
            // child: Tex,
          iconMargin: EdgeInsets.only(
            bottom: 5
          ),
              
              icon: Icon(Icons.directions_car)),
            Tab(
                   text: 'سيارات',
              
              
              icon: Icon(Icons.directions_transit)),
            Tab(
              
                   text: 'اصول اخرى',
              
              icon: Icon(Icons.directions_bike)),
          ],
        ),
 )
 , 
 const Expanded(child: 
 
 TabBarView(children: [
   MachineList() , 
   CarList() , 
   AssetsList()
 ],)
 
 
 )










       ],),
       
      ),
    );
  }
}