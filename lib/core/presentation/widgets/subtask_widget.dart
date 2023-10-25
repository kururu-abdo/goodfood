import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SubtaskWidget extends StatelessWidget {
  final String? employee;
  final String? branch;
  final String? image;
final int? taskStaus;
  const SubtaskWidget({ Key? key, this.employee, this.branch, this.image, this.taskStaus }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(
          8
        ),
       width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/6,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.center,
children: [

Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
   Text(employee!.toString()) , 

Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text(" فرع: "), 


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

const Row(
  mainAxisSize: MainAxisSize.min,
  children: [
SizedBox(width: 100,
child: Text(" الناريخ: "), 


) ,
SizedBox(
  width: 10,
) ,

Text(
"12/12/2013"
)
 

  ],
)

 ,
5.height ,


  ],
) , 




//image
 Placeholder(
  fallbackWidth: 120,
  fallbackHeight: MediaQuery.of(context).size.height/7 ,
)
   
],
        )
      )
      
    );
  }
}