import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class OtherAssetWidget extends StatelessWidget {
final String? assetName;
final String? branch;
final String? fileLink;
final String? buyDate;


  const OtherAssetWidget({ Key? key, this.assetName, this.branch, this.fileLink, this.buyDate, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
        bottom: 10 , left: 5 ,right: 5 ,top: 5
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
    width: MediaQuery.of(context).size.width ,
      padding: const EdgeInsets.symmetric(
        vertical: 8 ,horizontal: 15
      ),
      
      height: MediaQuery.of(context).size.height/7, 
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
  assetName!
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
child: Text("الملف"), 


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
      SizedBox(width: 10,),
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
    );
  }
}