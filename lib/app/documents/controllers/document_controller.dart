import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/documents/models/document_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/data/network/apis/document_apis.dart';

class DocumentController extends ChangeNotifier {
ApiResponse<List<DocumentModel>>?  documents = ApiResponse.completed([]);

ApiResponse<DocumentModel>?  showDoc = ApiResponse.completed(null);

Future<void> getMyDocuments(BuildContext context)async{
   documents = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await DocumentsApis().getDocuments();



    documents=ApiResponse.completed(response);
  } catch (e) {
       documents = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}





Future<void> showDocument(BuildContext context ,

String? id ,

)async{
   showDoc = ApiResponse.loading('loading');

notifyListeners();

  try {
    var  response = await DocumentsApis().viewDocument(id);
    
showDoc =  ApiResponse.completed(response);

notifyListeners();
  } catch (e) {
    log(e.toString());
       showDoc = ApiResponse.error('$e');
notifyListeners();

  }finally{
     notifyListeners(); 
  }
}







}