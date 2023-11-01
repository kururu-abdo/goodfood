import 'package:flutter/material.dart';
import 'package:goodfoods/app/help/view/pages/help_page.dart';
import 'package:goodfoods/core/presentation/notifications_page.dart';
import 'package:nb_utils/nb_utils.dart';

class DepartmentPage extends StatefulWidget {
  final bool?  fromDashboard;
  const DepartmentPage({ Key? key, this.fromDashboard }) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       
       
       
        appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
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
     


     body: SizedBox.expand(
       child: Container(
             padding: const EdgeInsets.symmetric(

               vertical: 10 ,horizontal: 8
             ),
         child: ListView(
           children: [

             Card(
               elevation: 2, margin: const EdgeInsets.only(
                 bottom: 8
               ),
               child: Container(
                
                padding: const EdgeInsets.all(8),
child: const Center(
  child:   Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text('ادارة القصيم ') , 

Text('القصيم- بريدة حي النفل') , 
    
  ],
),
Spacer() ,
Text("غدد الموظفين: 54")
      
    ],
  ),
),


               ),
             )
         ,  
              Card(
               elevation: 2, margin: const EdgeInsets.only(
                 bottom: 8
               ),
               child: Container(
                
                padding: const EdgeInsets.all(8),
child: const Center(
  child:   Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text('ادارة القصيم ') , 

Text('القصيم- بريدة حي النفل') , 
    
  ],
),
Spacer() ,
Text("غدد الموظفين: 54")
      
    ],
  ),
),


               ),
             )
           
             ,  
              Card(
               elevation: 2, margin: const EdgeInsets.only(
                 bottom: 8
               ),
               child: Container(
                
                padding: const EdgeInsets.all(8),
child: const Center(
  child:   Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
Text('ادارة القصيم ') , 

Text('القصيم- بريدة حي النفل') , 
    
  ],
),
Spacer() ,
Text("غدد الموظفين: 54")
      
    ],
  ),
),


               ),
             )
           
           
           ],
         ),
       ),
     ),
    );
  }
}