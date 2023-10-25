import 'package:flutter/material.dart';

class EmployeeWidget extends StatelessWidget {
  final String? name;
  final String? position;
  final String? branch;

  const EmployeeWidget({ Key? key, this.name, this.position, this.branch }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
       width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/5,
        child: Column(
          children: [

            Text(name!.toString()) , 
            Row(
              children: [

Text(position!)  ,  

Text(branch!.toString())

              ],
            )
          ],
        ),
      ),
    );
  }
}