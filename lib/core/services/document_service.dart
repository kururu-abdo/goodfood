import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/core/services/permission_services.dart';
import 'package:open_document/my_files/init.dart';
import 'package:open_document/open_document.dart';
import 'package:open_document/open_document_exception.dart';
import 'package:permission_handler/permission_handler.dart';

class DocumentService {


static initCHeckPermission(){
  
}

   
   void initCheckPermission() async {
     if   (!Platform.isMacOS) {
        
    final handler = PermissionsService();
    await handler.requestPermission(
      Permission.storage,
      onPermissionDenied:(){

      }
    );
     }
       
    
  }
    

   

  
Future<void> initPlatformState(String? url) async {
    String filePath;
    // final url =
    //     "https://fase.org.br/wp-content/uploads/2014/05/exemplo-de-pdf.pdf";
    //final url = "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-zip-file.zip";
    //
    // Platform messages may fail, so we use a try/catch PlatformException.
    //"https://file-examples-com.github.io/uploads/2017/02/file_example_XLS_5000.xls";
    //"https://file-examples-com.github.io/uploads/2017/02/file_example_XLS_5000.xls";
    //"https://file-examples-com.github.io/uploads/2017/02/zip_10MB.zip";

    final name = await OpenDocument.getNameFile(url: url!);

    final path = await OpenDocument.getPathDocument();

    filePath = "$path/$name";

    final isCheck = await OpenDocument.checkDocument(filePath: filePath);

    log("Exist: $isCheck \nPath: $filePath");
    log("https://goodfoodsa.co$url");
    try {
      if (!isCheck) {
        filePath = await downloadFile(filePath: filePath, url:"https://goodfoodsa.co$url");
      }
      await OpenDocument.openDocument(
        filePath: filePath,
      );
    } on OpenDocumentException catch (e) {
      log("ERROR: ${e.errorMessage}");
      filePath = 'Failed to get platform version.';
    }

    // setState(() {
    //   _platformVersion = filePath;
    // });
  }
 
 


  Future<String> downloadFile(
      {required String filePath, required String url}) async {
    // CancelToken cancelToken = CancelToken();
    Dio dio = Dio();
    await dio.download(
      url,
      filePath,
      onReceiveProgress: (count, total) {
        debugPrint('---Download----Rec: $count, Total: $total');
        // setState(() {
        //   _platformVersion = "${((count / total) * 100).toStringAsFixed(0)}%";
        // });
      },
    );

    return filePath;
  }

  
}