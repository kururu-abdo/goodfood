import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/new_maintance_order.dart';
import 'package:goodfoods/app/maintenance/widgets/pages/car_list_maintenance.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/presentation/widgets/input_field.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class CarMaintainanceType extends StatefulWidget {
  final String? modelId;
final bool? fromAssetsPage;
  
  const CarMaintainanceType({ Key? key, this.fromAssetsPage= false, this.modelId }) : super(key: key);

  @override
  _CarMaintainanceTypeState createState() => _CarMaintainanceTypeState();
}

class _CarMaintainanceTypeState extends State<CarMaintainanceType> {
TextEditingController commentController = TextEditingController();
var formKey = GlobalKey<FormState>();
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
  if (widget.fromAssetsPage!) {
      MaintenanceOrder(
          modelId: widget.modelId,
          modelType: 'Car',
          maintain_type: 1.toString(),
        ).launch(context);
  }
  else {
CartListMeintance(
maintain_type: 1.toString(),
).launch(context);

  }


             
                 }),
             
       
             
             
             ],
       
             ),
         
         const SizedBox(height: 8,),

         Expanded(
           child: Builder(
             builder: (context) {
               return Visibility(
                   maintainAnimation: true,
     maintainState: true,
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


             //if opetiion is oile 
             //add text field 
             return
             Container(
padding: const EdgeInsets.all(8),
margin: const EdgeInsets.only(bottom: 5),
decoration: const BoxDecoration(
  color: Colors.white,

   boxShadow: [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.0, 3.0),
      )
      ],

),
child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
  
  children: [

Row(
  mainAxisSize: MainAxisSize.min,
  children: [
Checkbox( 
   side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
  ),
  activeColor: Theme.of(context).primaryColor,
  // fillColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
  value:maintaincenaceController.selectedOption==index ,
  
  onChanged: (value){
if (value!) {
  maintaincenaceController.setSelectedOption(index);
}
},),
const SizedBox(width: 8,),

Text(currentLang(context)=="ar"?
               option['ar']:
                option['en']
               
               
               ),

  ],
),




maintaincenaceController.selectedOption==0 && index==0?
Form(
  key: formKey,
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(currentLang(context)=="ar"?"الممشى: ":"Walkway: ") ,
      const SizedBox(height: 8,),
  BoxInputField(controller: 
  
  commentController ,
  textInputType: TextInputType.number,
  isInputAea: false, 
  placeholder: 'walkay',
  validator: (str){

    if (str!.isEmpty) {
      return currentLang(context)=="ar"?"الحقل مطلوب":"this field is required";
    }
   else  if(int.parse(str.toString()) <=0){
       return 
       currentLang(context)=="ar"?"الرجاء اختيار رقم اكبر من ال 0":"please select number bigger than 0";
    }




    

    return null;
  },
  )
    ],
  ),
)

:const SizedBox.shrink()

],),

             );
            //  CheckboxListTile(
               
            //    title: Text(currentLang(context)=="ar"?
            //    option['ar']:
            //     option['en']
               
               
            //    ),
            //    subtitle: maintaincenaceController.selectedOption==0? TextField():Size,
            //    value:maintaincenaceController.selectedOption==index , onChanged: (value){
         
         
            //  } ,
             
           
             
             
            //  )
             
            //   ;
           },
         ),

         
         ) ,

         BoxButton(
           
           onTap: (){


//if selected cat==0


//else 
if (maintaincenaceController.selectedOption ==null) {
  showToast(currentLang(context)=="ar"?"الرجاء اختيار خيار":"please select an option", true);
  
}else {


  if (maintaincenaceController.selectedOption==0) {
  if (formKey.currentState!.validate()) {
    //
    log('VALIDATEED');
 if (widget.fromAssetsPage!) {
      MaintenanceOrder(
          modelId: widget.modelId,
          modelType: 'Car',
          maintain_type: 2.toString(),
          walkway: commentController.text.trim(),
category:(maintaincenaceController.selectedOption!+1).toString() ,
        ).launch(context);
  }else {
    CartListMeintance(
maintain_type: 2.toString(),
walkway: commentController.text.trim(),
category:(maintaincenaceController.selectedOption!+1).toString() ,
).launch(context);

  }









  }
} else {



  if (widget.fromAssetsPage!) {
      MaintenanceOrder(
          modelId: widget.modelId,
          modelType: 'Car',
          maintain_type: 2.toString(),
          // walkway: commentController.text.trim(),
category:(maintaincenaceController.selectedOption!+1).toString() ,
        ).launch(context);
  }else {
 CartListMeintance(
maintain_type: 2.toString(),
// walkway: commentController.text.trim(),
category:(maintaincenaceController.selectedOption!+1).toString() ,
).launch(context);
  }
}

}




           },
           
           title: currentLang(context)=="ar"?"التالي":"Next")
         
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