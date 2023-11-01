import 'package:flutter/material.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class UploadButton extends StatelessWidget {
  final Function()? onTap;
  const UploadButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

      width: MediaQuery.of(context).size.width ,
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).primaryColor
      ),
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
          children: [
      const Icon(Icons.drive_folder_upload_outlined ,
      
      size: 30,
       color: Colors.white,),
      Text(
        
        currentLang(context)=="ar"?
        "تحميل ملف":
        "Upload File"
       ,

       style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold 
       , fontSize: 20),
      ),
      
      const SizedBox()
          ],
        ),
      ),
    ).onTap(
      (){
        onTap!();
      }
    );
  }
}