
class UploadFile {
  String? path;
  String? fileBase64;
  String? extension;

String? hasId;
  UploadFile({
    this.path,
    this.fileBase64 , this.extension ,
    
  }){
    this.hasId=
    this.hashCode.toString();
  }

}