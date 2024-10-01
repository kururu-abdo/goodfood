import 'package:flutter/material.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class FilterBottomSheet extends StatefulWidget {
  final bool? isMaintain;
  final int? status;
  const FilterBottomSheet({ Key? key, this.isMaintain = false, this.status }) : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> 

{





@override
void initState() { 
  super.initState();

}

@override
  void dispose() {
    
    // TODO: implement dispose
    super.dispose();
  }
DateTime selectedDate = DateTime.now();
DateTime? _startDate;
DateTime? _endDate;

  Future<DateTime?> _selectDate(BuildContext context , DateTime beginDate ,DateTime initDate  ) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: beginDate,
        lastDate: DateTime(2101));
    return  picked;
  }















  @override
  Widget build(BuildContext context) {
    var maintenanceController = Provider.of<MaintenanceController>(context);
    return Container(
      height: MediaQuery.of(context).size.height/2.5, 
padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

children: [


Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const SizedBox(),
        Text(currentLang(context)=="ar"?"فلترة":"Filters" ,  style: const TextStyle(
    
      fontSize: 20 , fontWeight: FontWeight.bold
    ),),

    TextButton(onPressed: 
    (){
      maintenanceController.clearFilter();
    }, child: Text(
      
      currentLang(context)=="ar"?'مسح الفلتر':"clear filter"
    ))
  ],
) ,

// const SizedBox(height: 15,) , 

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//         Text(currentLang(context)=="ar"?"الحالة: ":"Status: " ,  style: const TextStyle(
    
//       fontSize: 15 , fontWeight: FontWeight.bold
//     ),),

//     const SizedBox(width: 5,),

// PopupMenuButton(
//           onSelected: (value) {
//             // your logic
//             maintenanceController.setselectedStatus(value);
//           },
//           itemBuilder: (BuildContext bc) {
//             return 
//             maintenanceController.statusList.map((e) =>   PopupMenuItem(
//                 value: e['value'],
//                 child:Text(currentLang(context)=="ar"?e['ar']:e['en']),
//               )).toList();
            
            
//             const [
//               PopupMenuItem(
//                 value: '/hello',
//                 child: Text("Hello"),
//               ),
//               PopupMenuItem(
//                 value: '/about',
//                 child: Text("About"),
//               ),
//               PopupMenuItem(
//                 value: '/contact',
//                 child: Text("Contact"),
//               )
//             ];
//           },
// child:        
// Container(
//   width: 120 ,
//   height: 30,
//   decoration: BoxDecoration(
//     border: Border.all(
//       color: Colors.grey ,width: .5
//     )

//   ),
//   child:  Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       Text( maintenanceController.getSelectedStatusObject()!=null?
//         currentLang(context)=="ar"?maintenanceController.getSelectedStatusObject()!['ar']: 
//         maintenanceController.getSelectedStatusObject()!['en']
//         // maintenanceController.selectedModel!
//         :
//          currentLang(context)=="ar"?'اختار':'select'),
//       const Icon(Icons.keyboard_arrow_down_outlined )
//     ],
//   ),
// )
// ,
//         ),
 

//   ],
// ),


const SizedBox(height: 20,) ,



Text(currentLang(context)=="ar"?"التاريخ: ":"Date: " ,  style: const TextStyle(

  fontSize: 15 , fontWeight: FontWeight.bold
),),
const SizedBox(height: 12,) , 

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

Row(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [

Text(currentLang(context)=="ar"?"من: ":"From: " ,  style: const TextStyle(

  fontSize: 15 , fontWeight: FontWeight.bold
) ,
) ,
const SizedBox(width: 5,) ,


Container(
  width: 120 ,
  height: 30,
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey ,width: .5
    )

  ),
   child: Center(child: Text(
     maintenanceController.startDate!=null
  
     ?
   
     getUsaualDate(maintenanceController.startDate!.toString())
     
     :''
     
     
     ),),
).onTap(()async{

var date =  await _selectDate(context, DateTime(2023,10) ,DateTime.now()   );

if (date!=null) {
 _endDate=null;
 _startDate=date;
maintenanceController.setStartDate( date.toString());
  maintenanceController.setEndDate(null);

}
setState(() {
  
});

})

  ],
)



,


Row(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [

Text(currentLang(context)=="ar"?"إلى: ":"To: " ,  style: const TextStyle(

  fontSize: 15 , fontWeight: FontWeight.bold
) ,
) ,
const SizedBox(width: 5,) ,
Container(
  width: 120 ,
  height: 30,

  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey ,width: .5
    )

  ),
  child: Center(child: Text(
   maintenanceController. endDate!=null?
   getUsaualDate(maintenanceController.endDate!.toString()):''),),
).onTap(
  
  ()async{
    var date =  await _selectDate(context , 
    maintenanceController.startDate!=null?
    DateTime.parse(maintenanceController.startDate!):_startDate!,
 maintenanceController.startDate!=null?
    DateTime.parse(maintenanceController.startDate!):_startDate!,);

if (date!=null) {
 _endDate= date;
  maintenanceController.setEndDate(date.toString());
}

setState(() {
  
});
  }
)

  ],
)


,













  ],
)
,

const SizedBox(height: 20,) ,


Row(
  mainAxisSize: MainAxisSize.min,
  children: [
        Text(currentLang(context)=="ar"?"تصنيف الصيانة: ":"Model type: " ,  style: const TextStyle(
    
      fontSize: 15 , fontWeight: FontWeight.bold
    ),),

    const SizedBox(width: 5,),

PopupMenuButton(
          onSelected: (value) {
            // your logic
            maintenanceController.setFilterModelType(value );
            log(value.toString());
          },
          itemBuilder: (BuildContext bc) {
            return 
            maintenanceController.modelTypes.map((e) => PopupMenuItem(
                value: e['value'],
                child: Text(currentLang(context)=="ar"?e['ar']:e['en']),
              )).toList();
            
            const [
              PopupMenuItem(
                value: '/hello',
                child: Text("Hello"),
              ),
              PopupMenuItem(
                value: '/about',
                child: Text("About"),
              ),
              PopupMenuItem(
                value: '/contact',
                child: Text("Contact"),
              ) ,
              PopupMenuItem(
                value: '/hello',
                child: Text("Hello"),
              ),
              PopupMenuItem(
                value: '/about',
                child: Text("About"),
              ),
              PopupMenuItem(
                value: '/contact',
                child: Text("Contact"),
              ),
              PopupMenuItem(
                value: '/hello',
                child: Text("Hello"),
              ),
              PopupMenuItem(
                value: '/about',
                child: Text("About"),
              ),
              PopupMenuItem(
                value: '/contact',
                child: Text("Contact"),
              ) ,
              PopupMenuItem(
                value: '/hello',
                child: Text("Hello"),
              ),
              PopupMenuItem(
                value: '/about',
                child: Text("About"),
              ),
              PopupMenuItem(
                value: '/contact',
                child: Text("Contact"),
              )
            ];
          },
          child:      
Container(
  width: 120 ,
  height: 30,
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey ,width: .5
    )

  ),
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      
      Text(
        maintenanceController.getSelectedModelObject()!=null?
        currentLang(context)=="ar"?maintenanceController.getSelectedModelObject()!['ar']: 
        maintenanceController.getSelectedModelObject()!['en']
        // maintenanceController.selectedModel!
        :
         currentLang(context)=="ar"?'اختار':'select'
        
        ,
        
        // 'Status'
        
        ),
      const Icon(Icons.keyboard_arrow_down_outlined )
    ],
  ),
)
,
        )

   

  ],
),




const Spacer(),

BoxButton(title: 

currentLang(context)=="ar"? "فلترة":"Filter" ,
onTap: (){
maintenanceController.setFilterLink(
  context,
  widget.isMaintain!?
  "maintain":"admin",  widget.status.toString());
Navigator.of(context).pop();

},
)

],
      ),
    );
  }
}