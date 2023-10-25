import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/app/documents/controllers/document_controller.dart';
import 'package:goodfoods/app/documents/models/document_model.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:open_document/my_files/init.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/permission_services.dart';
class OpenDocumentPage extends StatefulWidget {
  final bool? needLoadfromUrl;
  final String? url;
  final DocumentModel? documentModel;
  final bool? fromNotitications;
  final String? docID;
  const OpenDocumentPage({ Key? key, this.documentModel, 
  this.needLoadfromUrl=true,
  
  this.fromNotitications=false, this.docID, this.url }) : super(key: key);

  @override
  _OpenDocumentPageState createState() => _OpenDocumentPageState();
}

class _OpenDocumentPageState extends State<OpenDocumentPage> {

Dio dio = Dio();


 String _platformVersion = 'Unknown';




@override
  void initState() {
    // Wakelock.enable();
    super.initState();
    if (!Platform.isMacOS) initCheckPermission();

if (widget.needLoadfromUrl!) {
  context.read<DocumentController>().showDocument(context ,widget.docID);

}else {
initPlatformState(
  
 widget.url
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

    setState(() {
      _platformVersion = filePath;
    });
  }
 
 
 
   void initCheckPermission() async {
    final handler = PermissionsService();
    await handler.requestPermission(
      Permission.storage,
      onPermissionDenied: () => setState(
        () => debugPrint("Error: "),
      ),
    );
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
        setState(() {
          _platformVersion = "${((count / total) * 100).toStringAsFixed(0)}%";
        });
      },
    );

    return filePath;
  }

  _pushScreen() async {
    String name = await OpenDocument.getNameFolder();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyFilesScreen(filePath: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<DocumentController>(context);
    return Scaffold(
    // floatingActionButton: FloatingActionButton(onPressed: (){

    //   _pushScreen();
    // }
    // ,
    // child: const SizedBox(
      
    //   width: 120,
    //   child: Text("show all files")),
    
    // ),
      body:  Builder(builder: (_){
          if (!widget.needLoadfromUrl!) {
            return Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(controller.showDoc!.message!),
          const SizedBox(height: 10,) ,
          IconButton(onPressed: (){
           initPlatformState(
  
  widget.url
  );
          }, icon:  Icon(
            Icons.refresh ,color: Theme.of(context).primaryColor,
          ))
            ],
            ),
          );
          }
          
          if (controller.showDoc!.status==Status.LOADING) {
            return Center(
            child: mProgress(context ,fromPage: true),
            );
          } 
          else if( controller.showDoc!.status==Status.ERROR){
          return Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(controller.showDoc!.message!),
          const SizedBox(height: 10,) ,
          IconButton(onPressed: (){
            controller.showDocument(context , widget.docID );
          }, icon:  Icon(
            Icons.refresh ,color: Theme.of(context).primaryColor,
          ))
            ],
            ),
          );
          }
          else {  
            controller.showDoc!.data!.files!.isNotEmpty?
initPlatformState(
  
  "${controller.showDoc!.data!.files!.first!}"
  ):const SizedBox();
            return Container(
              child: Center(
                child: IconButton(onPressed: (){
                  setState(() {
                    
                  });
                }, icon: Icon(Icons.refresh ,color: Theme.of(context).primaryColor,)),
              ),
            );
          }
          
      }   
      ),
      
    );
  }
}