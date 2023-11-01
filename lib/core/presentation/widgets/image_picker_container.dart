import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/core/presentation/widgets/upload_btn.dart';
import 'package:goodfoods/core/presentation/widgets/upload_buttton_rounded.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

class ImagePickerContainer extends StatelessWidget {
  final bool? showFiles;
  final bool? showRounded;
  final Function(File? , bool?)? onSelect;
  const ImagePickerContainer({ Key? key, 
  
  this.showFiles=true,
  this.onSelect, this.showRounded=false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
         var locale = AppLocalizations.of(context);
    return 
    
    Center(
      child: 
    showRounded!?
    UploadButtonRounded(
      onTap: (){
    _settingModalBottomSheet(context);
},
    ):  
      
      UploadButton(
onTap: (){
    _settingModalBottomSheet(context);
},
      ),
    );
    
    Container(
      //  padding: const EdgeInsets.all(20), //padding of outer Container
           child: DottedBorder(
              color: Theme.of(context).primaryColor,//color of dotted/dash line
              strokeWidth: 3, //thickness of dash/dots
              dashPattern: const [10,6], 
              //dash patterns, 10 is dash width, 6 is space width
              child: Container(  //inner container
                 height:180, //height of inner container
                 width: double.infinity, //width to 100% match to parent container.
                 color:Colors.white //background color of inner container
             ,
            child: Center(

child: Text.rich(TextSpan(

  text: 'Please select an '  ,
  children: [
    TextSpan(
      text: 'Image' , 

      recognizer: TapGestureRecognizer()
      ..onTap =() {
        log('open studio');
      }
      
      ,
      style: TextStyle(
        color: Theme.of(context).primaryColor , 

      
      )
    )
  ]
)),
            ),
            
            
            
              ),
          )
    ).onTap((){
      _settingModalBottomSheet(context);
    });
  }

_pickFile(BuildContext context)async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
   allowedExtensions: [
     'pdf' ,'doc','docx','ppt','xls'
   ]
  );

if (result != null) {
  File file = File(result.files.single.path!);
  //convert file to base 64

  //add to files
onSelect!(file , false);
Navigator.pop(context);

} else {
  // User canceled the picker
}

}


_openGallery(BuildContext context)async{


try {
  
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.gallery);
if(file!=null){

  File fileToUpload = File(file.path);
  //convert file to base 64
onSelect!(fileToUpload , true);
Navigator.pop(context);
  //add to files

}





} catch (e) {
}
}

_openCamera(BuildContext context)async{

try {
  
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera);

if(file!=null){
    File fileToUpload = File(file.path);
  //convert file to base 64
 //convert file to base 64
onSelect!(fileToUpload ,  true);
Navigator.pop(context);
  //add to files
  //add to files
}






} catch (e) {
}
}

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)
        )
      ),
      builder: (BuildContext bc){
          return Container(
       padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

Container(
  height:100,
  width: 100, 
  decoration:  BoxDecoration(

    borderRadius: BorderRadius.circular(15),
  border: Border.all(width: .5)
  // image: DecorationImage(
    
    
  //   image: AssetImage('assets/icons/pick_image.png',
    
  
  //   ),
  
  // fit: BoxFit.fill,
  
  // )
  ),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
  
      children: [
        Image.asset('assets/icons/pick_image.png',
        
        width: 65,height: 65,
        color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 5,),
   Text(
    
    currentLang(context)=="ar"?"المعرض":
    "Pick Image")
      ],
    ),
  ),
).onTap((){


  _openGallery(context);
})

,

Container(
  height:100,
  width: 100, 
  decoration:  BoxDecoration(

    borderRadius: BorderRadius.circular(15),
  border: Border.all(width: .5)
  // image: DecorationImage(
    
    
  //   image: AssetImage('assets/icons/pick_image.png',
    
  
  //   ),
  
  // fit: BoxFit.fill,
  
  // )
  ),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
  
      children: [
        Image.asset('assets/icons/take_image.png',
        
        width: 65,height: 65,
        color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 5,),
   Text(
    
    currentLang(context)=="ar"?"الكاميرا":
    "Open camera")
      ],
    ),
  ),
)
.onTap((){


  _openCamera(context);
})
,



if (showFiles!) 

Container(
  height:100,
  width: 100, 
  decoration:  BoxDecoration(

    borderRadius: BorderRadius.circular(15),
  border: Border.all(width: .5)
  // image: DecorationImage(
    
    
  //   image: AssetImage('assets/icons/pick_image.png',
    
  
  //   ),
  
  // fit: BoxFit.fill,
  
  // )
  ),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
  
      children: [
        Image.asset('assets/icons/pick_file.png',
        
        width: 65,height: 65,
        color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 5,),
   Text(
    currentLang(context)=="ar"?"اختر ملف":
    "Select file")
      ],
    ),
  ),
).onTap((){

  _pickFile(context);
})












            ],
          ),
          );
      }
    );
}
}

class AddUserButton extends StatelessWidget {
  final bool? showFiles;
  final Function(File?)? onSelect;


  const AddUserButton({Key? key, 
  
  this.showFiles=true,
  this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
   _settingModalBottomSheet(context);
        
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,

        ),
        child: const Icon(Icons.add, 
        size: 30,
        color:Colors.white)
        
      ),
    );
  }

_pickFile(BuildContext context)async{
  FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
  File file = File(result.files.single.path!);
  //convert file to base 64

  //add to files
onSelect!(file);
Navigator.pop(context);

} else {
  // User canceled the picker
}

}

_openGallery(BuildContext context)async{


try {
  
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.gallery);
if(file!=null){

  File fileToUpload = File(file.path);
  //convert file to base 64
onSelect!(fileToUpload);
Navigator.pop(context);
  //add to files

}





} catch (e) {
}
}

_openCamera(BuildContext context)async{

try {
  
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera);

if(file!=null){
    File fileToUpload = File(file.path);
  //convert file to base 64
 //convert file to base 64
onSelect!(fileToUpload);
Navigator.pop(context);
  //add to files
  //add to files
}






} catch (e) {
}
}

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20)
        )
      ),
      builder: (BuildContext bc){
          return Container(
       padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

Container(
  height:100,
  width: 100, 
  decoration:  BoxDecoration(

    borderRadius: BorderRadius.circular(15),
  border: Border.all(width: .5)
  // image: DecorationImage(
    
    
  //   image: AssetImage('assets/icons/pick_image.png',
    
  
  //   ),
  
  // fit: BoxFit.fill,
  
  // )
  ),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
  
      children: [
        Image.asset('assets/icons/pick_image.png',
        
        width: 65,height: 65,
        color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 5,),
  const Text("Pick Image")
      ],
    ),
  ),
).onTap((){


  _openGallery(context);
})

,

Container(
  height:100,
  width: 100, 
  decoration:  BoxDecoration(

    borderRadius: BorderRadius.circular(15),
  border: Border.all(width: .5)
  // image: DecorationImage(
    
    
  //   image: AssetImage('assets/icons/pick_image.png',
    
  
  //   ),
  
  // fit: BoxFit.fill,
  
  // )
  ),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
  
      children: [
        Image.asset('assets/icons/take_image.png',
        
        width: 65,height: 65,
        color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 5,),
  const Text("Open camera")
      ],
    ),
  ),
)
.onTap((){


  _openCamera(context);
})
,



if (showFiles!) 

Container(
  height:100,
  width: 100, 
  decoration:  BoxDecoration(

    borderRadius: BorderRadius.circular(15),
  border: Border.all(width: .5)
  // image: DecorationImage(
    
    
  //   image: AssetImage('assets/icons/pick_image.png',
    
  
  //   ),
  
  // fit: BoxFit.fill,
  
  // )
  ),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
  
      children: [
        Image.asset('assets/icons/pick_file.png',
        
        width: 65,height: 65,
        color: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 5,),
  const Text("Select file")
      ],
    ),
  ),
).onTap((){

  _pickFile(context);
})












            ],
          ),
          );
      }
    );
}
}
