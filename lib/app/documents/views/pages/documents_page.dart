import 'package:flutter/material.dart';
import 'package:goodfoods/app/documents/controllers/document_controller.dart';
import 'package:goodfoods/app/documents/views/pages/open_document_page.dart';
import 'package:goodfoods/app/documents/views/widgets/doucment_widget.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({ Key? key }) : super(key: key);

  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {

  @override
  void initState() { 
    super.initState();

     WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<DocumentController>().getMyDocuments(context);

     });
  }
  @override
  Widget build(BuildContext context) {

      var controller = Provider.of<DocumentController>(context);
    var appLocale =  AppLocalizations.of(context);

    return Scaffold(
      

appBar: mLightAppBar(context, translate(context, "manage_documents") ,
      
      
      IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: const Icon(Icons.arrow_back 
      // color: Colors.white
      ,))

,


      ),
    
      body: 
      
        RefreshIndicator(
          onRefresh: ()async{

          },
          child: SizedBox.expand(
            child: 
            
            Builder(builder: (_){
          
          
          if (controller.documents!.status==Status.LOADING) {
            return Center(
            child: mProgress(context ,fromPage: true),
            );
          } 
          else if( controller.documents!.status==Status.ERROR){
          return Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(controller.documents!.message!),
          const SizedBox(height: 10,) ,
          IconButton(onPressed: (){
            controller.getMyDocuments(context );
          }, icon:  Icon(
            Icons.refresh ,color: Theme.of(context).primaryColor,
          ))
            ],
            ),
          );
          }
          else {
          
          return 
          controller.documents!.data!.isEmpty?
          Center(child: NoContent(translate(context, "no_docs")),):
          ListView.builder(
            itemCount: controller.documents!.data!.length,
            itemBuilder: (BuildContext context, int index) {
            var documentData = controller.documents!.data![index];
            
            return  
DocumentWidget(
id: documentData.id.toString(),
docTitle: documentData.nameAr,

documentDate: documentData.createdAt,
icon: "assets/icons/document.png",
onView: (id){


  //go to view document page



OpenDocumentPage(docID: id,).launch(context);
},

);
             
          
            },
          );
          
          
          }
          
          
          
          
            }),
          ),
        ),
    
    
      
      
      
    );
  }
}