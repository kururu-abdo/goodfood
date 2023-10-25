import 'package:flutter/material.dart';

class BrandWidget extends StatelessWidget {

  //Name of the brand
  final String? brandName;
  //List of Branches belong to brand
  final List<String> branches;
  const BrandWidget({ Key? key, this.brandName, required this.branches }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child:SizedBox(
        height: MediaQuery.of(context).size.height*.18 , 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Row(
           mainAxisSize: MainAxisSize.min,
           children: [
             const Text("اسم العلامة: ") , 
             const SizedBox(width: 10,),
             Text(brandName!)
           ],
         ) ,
         Expanded(child: 
         
         
         Wrap(
           children: branches.map((e) => Container(
  padding: const EdgeInsets.symmetric(vertical:5 , horizontal: 10),
  
  decoration: BoxDecoration(
borderRadius: BorderRadius.circular(50),
    color: Colors.blue.shade100
  ),
  child:  Text(e),
)
 ,).toList(),
         )
         )



          ],
        ),
      ) ,
    );
  }
}