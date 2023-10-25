import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MachineWidget extends StatelessWidget {
final String? machineName;
final String? branch;
final String? machineCode;
final String? buyDate;
final String? lastMaintenanceDate;
final int? numOfMaintenances;

  const MachineWidget({ Key? key, this.machineName, this.branch, this.machineCode, this.buyDate, this.lastMaintenanceDate, this.numOfMaintenances,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
            bottom: 10 , left: 5 ,right: 5
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8 ,horizontal: 15
      ),
     decoration: const BoxDecoration(
        color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0xffDDDDDD),
        blurRadius: 6.0,
        spreadRadius: 2.0,
        offset: Offset(0.0, 0.0),
      )
    ],
     ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/4, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text("الاسم: "), 


) ,
const SizedBox(
  width: 10,
) ,

Text(
  machineName!
)


  ],
)

 ,
5.height ,

Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text("الفرع: "), 


) ,
const SizedBox(
  width: 10,
) ,

Text(
  branch!
)


  ],
)

 ,
5.height ,


Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text("كود الماكينة: "), 


) ,
const SizedBox(
  width: 10,
) ,

Text(
   machineCode!
)


  ],
)

 ,
5.height ,
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text("تاريخ الشراء: "), 


) ,
const SizedBox(
  width: 10,
) ,

Text(
buyDate!
)


  ],
)

 ,
5.height ,
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text("عدد الصيانات: "), 


) ,
const SizedBox(
  width: 10,
) ,

Text(
  numOfMaintenances!.toString()
)


  ],
)

 ,
5.height ,
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text("تاريخ اخر صيانة:"), 


) ,
const SizedBox(
  width: 10,
) ,

Text(
  lastMaintenanceDate!
)


  ],
)

 ,
5.height ,


        ],
      ), 
    );
  }
}