import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/core/presentation/widgets/document_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class DocumentsPage extends StatefulWidget {
  final bool? fromDashboard;
  const DocumentsPage({ Key? key, this.fromDashboard = false }) : super(key: key);

  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: 
        
        AppBar(
          elevation: 0,
          actions: [
            IconButton(onPressed: (){
    const ChagePage().launch(context);
            }, icon: const ImageIcon(AssetImage('assets/icons/headset.png')))
          ,
            IconButton(onPressed: (){
    
            }, icon: const ImageIcon(AssetImage('assets/icons/bell.png')))
          
          
          
          ],
          backgroundColor: Colors.white,
          titleSpacing: 0,
          
          leading: widget.fromDashboard!?const SizedBox(): 
    
    
          IconButton(onPressed: (){
    Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          title: Image.asset('assets/images/logo.png' ,
          width: 150,
          
          ),
        ),
       
   body: ListView(

     children: const [
       DocumentWidget(
title: '2023 Budget new',
fileLink: 'a.com',
docDate: '12-12-2024',

       )

     ],
   ),
   
   
   
   
    );
  }
}