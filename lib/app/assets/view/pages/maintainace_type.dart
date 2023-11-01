import 'package:flutter/material.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class CarMaintainanceType extends StatefulWidget {

  
  const CarMaintainanceType({ Key? key }) : super(key: key);

  @override
  _CarMaintainanceTypeState createState() => _CarMaintainanceTypeState();
}

class _CarMaintainanceTypeState extends State<CarMaintainanceType> {

  bool isPeriodic= false;

  @override
  Widget build(BuildContext context) {

    var maintaincenaceController = Provider.of<MaintenanceController>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,

        title: Text(
          currentLang(context)=="ar"?"اختار نوع الصيانة":"Select Maintainance Type"
        ),
      ),
      body: 
      
      
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             GridView.count(
               crossAxisCount: 2,
             scrollDirection: Axis.vertical,           //default
             reverse: false,                           //default
             controller: ScrollController(),
             primary: false,
             childAspectRatio: 6/5,
             physics:const ScrollPhysics() ,
             shrinkWrap: true,
             padding: const EdgeInsets.all(5.0),
             children:  [
             Container(  
                 padding: const EdgeInsets.all(5),
margin: const EdgeInsets.all(5),
        height: 150, 
        width: 200,
  decoration: const BoxDecoration(
       color: Colors.white,
        // color: Colors.white.withOpacity(.10)  ,
      boxShadow:  [ BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.0, 3.0),
      )
      ],
        
  ),
              child:  Center(
                child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Image.asset("assets/icons/deadline.png"
                   ,
                  //  color: Colors.white,
                   
                   height: 50,width: 50,
                   
                   ),
                    Text(
                      currentLang(context)=="ar"?"صيانة دورية ":
                      "Periodic Maintainance",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        
                        // color: Colors.white,
                        fontSize: 15.0),
                    ),
                  ],
                ),
              ),
                 ).onTap((){
       
  isPeriodic = true;
  setState(() {
    
  });       
                 }),
       
       
             Container(  
                 padding: const EdgeInsets.all(5),
margin: const EdgeInsets.all(5),
        height: 150, 
        width: 200,
  decoration: const BoxDecoration(
    color: Colors.white,
        // color: Colors.white.withOpacity(.10)  ,
      boxShadow:  [ BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.0, 3.0),
      )
      ],
        
  ),
              child:  Center(
                child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Image.asset("assets/icons/solution.png"
                   ,
                  //  color: Colors.white,
                   
                   height: 50,width: 50,
                   
                   ),
                    Text(
                      currentLang(context)=="ar"?"صيانة عادية ":
                      "Normal Maintainance",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        
                        // color: Colors.white,
                        fontSize: 15.0),
                    ),
                  ],
                ),
              ),
                 ).onTap((){
       isPeriodic = false;
  setState(() {
    
  });  



             
                 }),
             
       
             
             
             ],
       
             ),
         
         const SizedBox(height: 8,),

         Expanded(
           child: Builder(
             builder: (context) {
               return Visibility(
                 
                 visible: isPeriodic ,
                 child: Column(
         
         crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
         
         Text(currentLang(context)=="ar"?"اختار خيار :":"Select Option: " , 
         
         
         style: const TextStyle(
           fontSize: 18 , fontWeight: FontWeight.bold
         ),
         ),
         const SizedBox(height: 5,) ,
         Expanded(child: 
         ListView.builder(
           itemCount: maintaincenaceController.perioicList.length,
           itemBuilder: (BuildContext context, int index) {
         
             var option = maintaincenaceController.perioicList[index];
             return
             
             CheckboxListTile(
               
               title: Text(currentLang(context)=="ar"?
               option['ar']:
                option['en']
               
               
               ),
               value: false, onChanged: (value){
         
         
             } ,
             
           
             
             
             )
             
              ;
           },
         ),

         
         ) ,

         BoxButton(title: currentLang(context)=="ar"?"التالي":"Next")
         
                   ],
                 )
                 );
             }
           ),
         )
           ],
         ),
       )
       
      
      ,
    );
  }
}