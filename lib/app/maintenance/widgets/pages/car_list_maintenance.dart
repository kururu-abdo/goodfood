import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/new_maintance_order.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class CartListMeintance extends StatefulWidget {
  const CartListMeintance({ Key? key }) : super(key: key);

  @override
  _CartListMeintanceState createState() => _CartListMeintanceState();
}

class _CartListMeintanceState extends State<CartListMeintance> {



    @override
  void initState() {
    // TODO: implement initState
    super.initState();

     WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<MaintenanceController>().getCars(context);

     });
  }

  @override
  Widget build(BuildContext context) {

  var controller = Provider.of<MaintenanceController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mLightAppBar(context, translate(context, 'cars') ,
      
      
      IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back ,
      
      // color: Colors.white,
      ))

,


      ),
    
    
    
    body:
    
     Stack(
       alignment: Alignment.center,
       children: [

         
         Builder(builder: (_){


if (controller.cars!.status==Status.LOADING) {
  return Center(
    child: mProgress(context, fromPage: true),
  );
} 
else if( controller.cars!.status==Status.ERROR){
return Center(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
Text(controller.cars!.message!),
const SizedBox(height: 10,) ,
IconButton(onPressed: (){
  controller.getCars(context);
}, icon:  Icon(
  Icons.refresh ,color: Theme.of(context).primaryColor,
))
    ],
  ),
);
}
else {

return
controller.cars!.data!.isEmpty?
Center(child: NoContent(translate(context, "no_cars")),):

 ListView.builder(
  itemCount: controller.cars!.data!.length,
  itemBuilder: (BuildContext context, int index) {
    var carData = controller.cars!.data![index];
    var files = jsonDecode(carData.files!) as List;
    return
    
       Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/8,


          margin: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
 padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          decoration: BoxDecoration(

borderRadius: BorderRadius.circular(5) ,
color: Colors.white,
 boxShadow: const [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 2.0,
      offset: Offset(0.0, 3.0),
      )
      ],

          ),


    child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


Transform.rotate(
  angle: 0,
  child: 
  !files.isNotEmpty?
  Image.network('https://goodfoodsa.co${files.first}' ,
  // color: Colors.white,
  width: 50,

  ):
  
  
    Image.asset('assets/icons/car.png' ,
    // color: Colors.white,
  width: 50,

  ),
),

const SizedBox(width: 8,),
Expanded(
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
              Text(
          currentLang(context)=="ar"?
              "نوع السيارة:  ${carData.carType! }"  :
              "Car type:  ${carData.carType! }"  
            ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // color: Colors.white ,
              fontSize: 15
            ), 
             ),
const SizedBox(height: 8,),
              Text(
                currentLang(context)=="ar"?   
                    "رقم الهيكل:  ${carData.bordNumber!}"  :
            "Board Number:  ${carData.bordNumber!}"  ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
               fontSize: 12
            ), 
            
             ),
    ],
  ),
)
,const SizedBox(width: 8,),

TextButton(onPressed: (){
 MaintenanceOrder(
          modelId: carData.id.toString(),
          modelType: 'Car',
        ).launch(context);
}, child: Text(
  currentLang(context)=="ar"? "طلب صيانة":"Add order"

))
          ],
    ),
    ).onTap(
      

      (){


        MaintenanceOrder(
          modelId: carData.id.toString(),
          modelType: 'Car',
        ).launch(context);
      }
    );
  },
);


}




    }),
     
     
       
    // mLightBottomNav(context)
       ],
     ),
    
    );
 
 
  }
}