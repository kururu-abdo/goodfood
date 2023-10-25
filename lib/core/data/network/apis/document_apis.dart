
import 'package:goodfoods/app/documents/models/document_model.dart';
import 'package:goodfoods/core/data/network/api_base_helper.dart';

class DocumentsApis {
  
        final ApiBaseHelper _helper = ApiBaseHelper();


 Future<List<DocumentModel>> getDocuments(
   ) async {

     List<DocumentModel> docs=[];
    final response = await _helper.get("docx/get_docx" ,
    
    
    );
Iterable I =response['data'];
docs = I.map((e) => DocumentModel.fromJson(e)).toList();





    return docs;
  }






Future<DocumentModel> viewDocument(
    String? docID  ,
    // String reply
  
   ) async {
     //
    final response = await _helper.get(
      
      "docx/show/$docID" ,
    
   
    
    );
   DocumentModel documentModel = DocumentModel.fromJson(response['data']);

   
    return documentModel;
  }

}