import 'package:flutter/material.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';

class DocumentWidget extends StatelessWidget {
  final Function(String)? onView;
  final String? id;
  final String? documentDate;
  final String? docTitle;
  final String? icon;
  const DocumentWidget({Key? key, this.onView, this.id, this.documentDate, this.docTitle, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appLocale =  AppLocalizations.of(context);
    return Container(
 margin: const EdgeInsets.only(
          bottom: 10 , left: 10 ,right: 10,
          top: 10
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8 ,horizontal: 15
        ),
        width: MediaQuery.of(context).size.width,
        height: 
        // to.length<5?
        MediaQuery.of(context).size.height/8 
        // :
        // MediaQuery.of(context).size.height/3
        
        ,


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
    
         
      



       
       
        ),
      



      
child: Row(

mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [


Row(
  crossAxisAlignment: CrossAxisAlignment.center,

  children: [
    SizedBox(
  height:
    MediaQuery.of(context).size.height/8,
  child:   Image.asset(icon! , 
  width: 50,
  height:
    MediaQuery.of(context).size.height/8 ,
    color: Theme.of(context).primaryColor,
  ),
) , 
const SizedBox(width: 10,),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

Text(docTitle!  ,  
maxLines: 2
 ,  style: const TextStyle(
  fontSize: 18 , fontWeight: FontWeight.bold , 


),) ,


 Text(getMaintenanceFormattedDate(documentDate! , 
 
 
 currentLang(context)=="ar"?"ar":"en_US"
 )  
   ,  style: const TextStyle(
    fontSize: 14 , color: Colors.grey


  ),),

  ],
) , 


  ],
),
TextButton(onPressed: (){
onView!(id!);
}, child: 

 Text(
   
appLocale!.translate("view")!


 ))



  ],
)  ,
    );
  }
}