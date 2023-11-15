
import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/services/document_service.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class OrderRecords extends StatefulWidget {
  final String? orderId;
  const OrderRecords({ Key? key, this.orderId }) : super(key: key);

  @override
  _OrderRecordsState createState() => _OrderRecordsState();
}

class _OrderRecordsState extends State<OrderRecords> {

@override
void initState() { 
  super.initState();
  context.read<MaintenanceController>().getOrderRecord(context,
   widget.orderId!);
}













  @override
  Widget build(BuildContext context) {

var locale = AppLocalizations.of(context);
    var controller = Provider.of<MaintenanceController>(context);
  
  
  
    return RefreshIndicator(
      onRefresh: ()async{
        controller.getOrderRecord(context,
   widget.orderId!);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*3/4,
            child: 
          
          Builder(
    
    
            builder: (context) {
    
    if (controller.orderRecorders!.status==Status.LOADING) {
      return Center(child: mProgress(context , fromPage: true),);
    }else if (controller.orderRecorders!.status==Status.ERROR){
    
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    Text(controller.orderRecorders!.message!),
    const SizedBox(height: 10,) ,
    IconButton(onPressed: (){
      controller.getOrderRecord(context , widget.orderId.toString());
    }, icon:  Icon(
      Icons.refresh ,color: Theme.of(context).primaryColor,
    ))
          ],
      ),
    );
    
    }
    
    
    
      else  {
    
       return ListView(
                children: 
                
                controller.orderRecorders!
                .data!.map((e) => 
                
                
                
                e.fileUrl!= null?



                   Center(
                    child: Container(
                      margin: const EdgeInsets.only(
          bottom: 10 , left: 10 ,right: 10,
          top: 10
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8 ,horizontal: 15
        ),
                      decoration: const BoxDecoration(
color: Colors.white,

                          boxShadow: [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.0, 3.0),
      )
      ],
                      ),
                    width: 316,
                    // height: 108,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
    
    
                         Text(
                           '${e.name}',
                           style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 0,
                           ),
                         )
                          
                          ,
    
                            Text(
    
                          getMaintenanceFormattedDate(e.createdAt!,
                          
                          locale!.locale.languageCode=="ar"?
                          "ar":"en_US"
                          )
                          // 'Monday 20/10'
                          ,
                          style: const TextStyle(
                    color: Color(0xFF7A7979),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                          ),
                        ),
    
                        
                          
                          ],
                        ),
    const SizedBox(height: 10,),
    
                         SizedBox(
                           width: 309,
                          //  height: 84,
                           child: Text(
                    '${e.des}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    style: const TextStyle(
                      color: Colors.black,
                      
                      
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
    
                      height: 0,
                    ),
                           ),
                         ),




                (  getFileExtenstion(e.fileUrl!)==".png"
                
||                  getFileExtenstion(e.fileUrl!)==".jpg"||
                                  getFileExtenstion(e.fileUrl!)==".jpeg"
                                  ||
  getFileExtenstion(e.fileUrl!)==".PNG"
  ||
  getFileExtenstion(e.fileUrl!)==".JPEG"
  ||
  getFileExtenstion(e.fileUrl!)==".JPG"
                )?
               Image.network(
              
                
                 "https://goodfoodsa.co${  e.fileUrl!}"
                ,
                  // 'assets/images/logo.png',
                  width: 50,
                  height: 50,
                ).onTap(
                             
                             ()async{
                                  log("OPEN");
                                 await DocumentService().initPlatformState(e.fileUrl);
                             }
                           )
                :
                  Image.asset(
                getFileIocn(e.fileUrl!),
                  // 'assets/images/logo.png',
                  width: 50,
                  height: 50,
                ).onTap(
                             
                             ()async{
                                  log("OPEN");
                                 await DocumentService().initPlatformState(e.fileUrl);
                             }
                           )
                



                      ],
                    ),
                  ),
                  )
              :


                   Center(
                    child:Container(  margin: const EdgeInsets.only(
          bottom: 10 , left: 10 ,right: 10,
          top: 10
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8 ,horizontal: 15
        ),
                      decoration: const BoxDecoration(
color: Colors.white,
                          boxShadow: [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.0, 3.0),
      )
      ],
                      ),
                      
                    width: 316,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
    
    
                         Text(
                           '${e.name}',
                           style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    height: 0,
                           ),
                         )
                          
                          ,
    
                            Text(
    
                          getMaintenanceFormattedDate(e.createdAt!,
                          
                          locale!.locale.languageCode=="ar"?
                          "ar":"en_US"
                          )
                          // 'Monday 20/10'
                          ,
                          style: const TextStyle(
                    color: Color(0xFF7A7979),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                          ),
                        ),
    
                        
                          
                          ],
                        ),
    const SizedBox(height: 10,),
    
                         SizedBox(
                           width: 309,
                          //  height: 84,
                           child: Text(
                    '${e.des}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                      
                      
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
    
                      height: 0,
                    ),
                           ),
                         ),
                      ],
                    ),
                  ),
                  )
              
                
                )
                .toList()
                
    
    
      //           const [
                  
      
      
      //             Center(
      //               child: SizedBox(
      //               width: 316,
      //               height: 108,
      //               child: Stack(
      //                 children: [
      //                   Positioned(
      //                     left: 234,
      //                     top: 3,
      //                     child: Text(
      //                       'Monday 20/10',
      //                       style: TextStyle(
      //               color: Color(0xFF7A7979),
      //               fontSize: 12,
      //               fontWeight: FontWeight.w400,
      //               height: 0,
      //                       ),
      //                     ),
      //                   ),
      //                   Positioned(
      //                     left: 3,
      //                     top: 0,
      //                     child: Text(
      //                       'Kururu',
      //                       style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 12,
      //               fontWeight: FontWeight.w700,
      //               height: 0,
      //                       ),
      //                     ),
      //                   ),
      //                   Positioned(
      //                     left: 0,
      //                     top: 24,
      //                     child: SizedBox(
      //                       width: 309,
      //                       height: 84,
      //                       child: Text(
      //               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five',
      //               style: TextStyle(
      //                 color: Colors.black,
      //                 fontSize: 12,
      //                 fontWeight: FontWeight.w400,
      //                 height: 0,
      //               ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             )
              
              
      // ,
      //             Center(
      //               child: SizedBox(
      //               width: 316,
      //               height: 108,
      //               child: Stack(
      //                 children: [
      //                   Positioned(
      //                     left: 234,
      //                     top: 3,
      //                     child: Text(
      //                       'Monday 20/10',
      //                       style: TextStyle(
      //               color: Color(0xFF7A7979),
      //               fontSize: 12,
      //               fontWeight: FontWeight.w400,
      //               height: 0,
      //                       ),
      //                     ),
      //                   ),
      //                   Positioned(
      //                     left: 3,
      //                     top: 0,
      //                     child: Text(
      //                       'Kururu',
      //                       style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 12,
      //               fontWeight: FontWeight.w700,
      //               height: 0,
      //                       ),
      //                     ),
      //                   ),
      //                   Positioned(
      //                     left: 0,
      //                     top: 24,
      //                     child: SizedBox(
      //                       width: 309,
      //                       height: 84,
      //                       child: Text(
      //               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five',
      //               style: TextStyle(
      //                 color: Colors.black,
      //                 fontSize: 12,
      //                 fontWeight: FontWeight.w400,
      //                 height: 0,
      //               ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             )
              
              
              
      //           ],
              
              
              
              );
        
    
    
    
    
    
      }
      
        
        
            }
          )
          )
      ,
          
      
         
        ],
      ),
    );
  }
}