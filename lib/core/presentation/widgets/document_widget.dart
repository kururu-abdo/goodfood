import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DocumentWidget extends StatelessWidget {
  final String? title;
  final String? docDate;
  final String? fileLink;
  const DocumentWidget({ Key? key, this.title, this.docDate, this.fileLink }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(margin: const EdgeInsets.only(
              bottom: 10 , left: 5 ,right: 5
        ),
      child: Container(
        padding: const EdgeInsets.symmetric(

         vertical: 10 , horizontal: 15

        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/7,
      
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [

Row(
  mainAxisSize: MainAxisSize.min,
  children: [
 SizedBox(
child: Text(title! ,


maxLines: 2,
overflow: TextOverflow.ellipsis,
), 


) ,
const SizedBox(
  width: 10,
) ,
const SizedBox.shrink()


  ],
)

 ,
5.height ,


Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text("التاريخ: "), 


) ,
const SizedBox(
  width: 10,
) ,

Text(
docDate!
)


  ],
)

 ,
5.height ,

Row(
  mainAxisSize: MainAxisSize.min,
  children: [
const SizedBox(width: 100,
child: Text("الملف: "), 


) ,
const SizedBox(
  width: 10,
) ,

Container(
  width: 100,
  height: 30,
  decoration: BoxDecoration(
    color: Theme.of(context).primaryColor , 
    borderRadius: BorderRadius.circular(50)
  ),
  child: const Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageIcon(
          AssetImage('assets/icons/file.png' )
        ),
        SizedBox(width: 10,) ,
        Text('مستند')
      ],
    ),
  ),
)


  ],
)

 ,
5.height ,




        ],
      ),
      )
    );
  }
}