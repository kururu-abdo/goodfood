import 'package:flutter/material.dart';

class DocumentFileWidget extends StatelessWidget {
  final String? fileLink;
  const DocumentFileWidget({ Key? key, this.fileLink }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
Container(
  width: 100,
  height: 30,
  padding: const EdgeInsets.all(6),
  decoration: BoxDecoration(
    color: Theme.of(context).primaryColor , 
    borderRadius: BorderRadius.circular(50)
  ),
  child: const Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageIcon(
          AssetImage('assets/icons/file.png' ) ,
          color: Colors.white,
        ),
        SizedBox(width: 10,),
        Text('مستند' , style: TextStyle(color: Colors.white),)
      ],
    ),
  ),
)
;
  }
}