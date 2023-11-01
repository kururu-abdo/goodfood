import 'package:flutter/material.dart';
import 'package:goodfoods/common/widgets/box_button.dart';
import 'package:goodfoods/core/utils/utils.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({ Key? key }) : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.5, 
padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

children: [


Center(child: Text(currentLang(context)=="ar"?"فلترة":"Filters" ,  style: const TextStyle(

  fontSize: 20 , fontWeight: FontWeight.bold
),) , 


) ,

const SizedBox(height: 15,) , 

Row(
  mainAxisSize: MainAxisSize.min,
  children: [
        Text(currentLang(context)=="ar"?"الحالة: ":"Status: " ,  style: const TextStyle(
    
      fontSize: 15 , fontWeight: FontWeight.bold
    ),),

    const SizedBox(width: 5,),


Container(
  width: 120 ,
  height: 30,
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey ,width: .5
    )

  ),
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('Status'),
      Icon(Icons.keyboard_arrow_down_outlined )
    ],
  ),
)


  ],
),


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
)

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


Container(
  width: 120 ,
  height: 30,
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey ,width: .5
    )

  ),
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('Status'),
      Icon(Icons.keyboard_arrow_down_outlined )
    ],
  ),
)


  ],
),




const Spacer(),

BoxButton(title: 

currentLang(context)=="ar"? "فلترة":"Filter"
)

],
      ),
    );
  }
}