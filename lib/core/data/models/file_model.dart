class FileModel {
  final String? fileName;
  final String? path;
   String? icon;
   String? base64;
String? extension;
  FileModel({required this.fileName, required this.path, });
  


  setBase64(String data){
  base64= data;
  }
  setExtension(String ext){
    extension= ext;

    if(extension!.contains('png')){
icon= 'assets/icons/png.png';
    }
if(extension!.contains('jpg')  || extension!.contains('jpeg')){
icon= 'assets/icons/jpg.png';

    }


 if(extension!.contains('pdf')){
icon= 'assets/icons/pdf.png';

    }

  }
}