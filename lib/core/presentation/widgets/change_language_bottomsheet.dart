import 'package:flutter/material.dart';
import 'package:goodfoods/common/controllers/langauage_controller.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({ Key? key }) : super(key: key);

  @override
  _ChangeLanguageBottomSheetState createState() => _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
   var  langController  = Provider.of<LanguageProvier>(context);    


    return Container(
      height: MediaQuery.of(context).size.height/4, 
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15), 
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
WidgetLangContainer(

translate(context,langController.langs[0].languageCode!)!

 , langController.langs[0].languageCode!, langController.langs[0].flag!) ,


WidgetLangContainer(

translate(context,langController.langs[1].languageCode!)!

 , langController.langs[1].languageCode!, langController.langs[1].flag!) ,

 

  ],
),
    );
  }

 Widget WidgetLangContainer(String Local , String code , String icon ){
var  langController  = Provider.of<LanguageProvier>(context);    
return Container(
  padding: const EdgeInsets.symmetric(
    vertical: 10 ,horizontal: 5
  ),
  
  child: Row(

  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center
  
  
,
  children: [

    Text(Local,style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),

  
 

    Row(
      mainAxisSize: MainAxisSize.min,
      children: [


langController.appLocal!.languageCode==code?
    const Icon(
    
     
     Icons.check_circle ,color: Colors.green ,size: 30,):const SizedBox.shrink(),


Image.asset(icon ,width: 50,height: 40,  )



      ],
    )
   
  ],
),).onTap((){
  langController.changeLanguage(Locale(code));
  Navigator.pop(context);
});
  }
}
