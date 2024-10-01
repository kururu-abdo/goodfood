import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/edit_maintanance_order.dart';
import 'package:goodfoods/app/maintenance/model/asset_info.dart';
import 'package:goodfoods/app/maintenance/model/details_mapper.dart';
import 'package:goodfoods/app/order/view/pages/reject_page.dart';
import 'package:goodfoods/app/order/view/widgets/order_records.dart';
import 'package:goodfoods/core/box_text.dart';
import 'package:goodfoods/core/colors.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/close_order_page.dart';
import 'package:goodfoods/core/presentation/record_with_media.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/services/document_service.dart';
import 'package:goodfoods/core/utils/global.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {

  final bool? isMaintain;
  // final bool? isAdmin;
  final bool? isFromNotificaiton;
  final String? orderId;
//        final int? subnittedOrder;
// final String? modelType;
//   final int? maintainStatus;
//     final int? OrderStatus;
     
//     final int? orderUserId;
//   final int? confirmed;
//   final String? task;
//   final String? from;
//   final String? to;
//   final String?  date;
//   final List? file;
// final String? status;
  const OrderDetails({ Key? key, 
  this.isFromNotificaiton=false,
   this.orderId,
   this.isMaintain,
    // this.task, this.status,
    // this.isAdmin= true,
    //  this.file, this.from, this.to, this.date,
    //   this.confirmed, this.subnittedOrder, this.modelType, 
    //   this.maintainStatus, this.OrderStatus, this.orderUserId
       }) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
int selectedTab=0;
 bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
// int? _confirmed;
// int? _status;

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();


@override
void initState() { 
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {

  // if (widget.isFromNotificaiton!) {
    context.read<MaintenanceController>().getOrderDetails(

      !widget.isMaintain!, widget.orderId!);

  });
  // }else {
  // //     _confirmed =widget.confirmed!;
  // // _status = int.parse(widget.status!);
  // }
}
  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context);


    var controller = Provider.of<MaintenanceController>(context);
  
  // if (widget.isFromNotificaiton!) {
    

return Scaffold(
         resizeToAvoidBottomInset: false,


        
     appBar:   AppBar(
          elevation: 0,
          actions:  [

sharedPrefs.isSuper?
const SizedBox.shrink():
 Builder(
   builder: (context) {

if (controller.orderDetailsMapper!.status==Status.LOADING) {
    return const SizedBox.shrink();

   return Center(
        child: mProgress(context ,fromPage: true),
  );
}
else if(controller.orderDetailsMapper!.status==Status.ERROR) {
  return const SizedBox.shrink();
  return Center(
  child:   IconButton(onPressed: (){
    context.read<MaintenanceController>().getOrderDetails(!widget.isMaintain!, widget.orderId!);
  }, icon:  Icon(
    Icons.refresh ,color: Theme.of(context).primaryColor,
  )),
);
}

   else  
   {
     return  
     sharedPrefs.isMaintain&&
  sharedPrefs.user_id == 
  controller.orderDetailsMapper!.data!.orderUserId.toString()?

 controller.changeStatusState!.status==Status.LOADING?

 Center(
        child: mProgress(context ,fromPage: true),
  )
:
  TextButton(onPressed: (){

    CloseOrderPage(
      orderId: controller.orderDetailsMapper!.data!.submittedOrder.toString(),
    ).launch(context);
// controller.confirmOrder(context, widget.orderId!).then((value) {


//   _confirmed=1;
//   setState(() {
    
//   });
// });
}, child: Text( currentLang(context)=="ar"?"اغلاق":"Close" ,
style: const TextStyle(color: Colors.red , fontWeight: FontWeight.bold),
)

).visible(controller.orderDetailsMapper!.data!.orderStatus.toString()=='3')


:  

controller.orderDetailsMapper!.data!.orderStatus.toString()=="1"?
controller.changeStatusState!.status==Status.LOADING?
 Center(
        child: mProgress(context ,fromPage: true),
  ):

TextButton(onPressed: (){
controller.changeOrderStatus(context,

 controller.orderDetailsMapper!.data!.submittedOrder.toString()
 
 
 , 2.toString(),
 
 []
 ).then((value) {
    context.read<MaintenanceController>().getStatusData(context,null);

 
});
}, child: Text( currentLang(context)=="ar"?"تأكيد الاغلاق":"Confirm Close"

 ,
style: const TextStyle(color: Colors.red , fontWeight: FontWeight.bold),
)

).visible(
  !sharedPrefs.isMaintain&&
  controller.orderDetailsMapper!.data!.orderStatus.toString()==1.toString())
: 


const SizedBox.shrink();

   }
  


   }
 ) 




,
// :
// const SizedBox.shrink(),
      




 Builder(
   builder: (context) {

if (controller.orderDetailsMapper!.status==Status.LOADING) {
   return Center(
        child: mProgress(context ,fromPage: true),
  );
}
else if(controller.orderDetailsMapper!.status==Status.ERROR) {
  return Center(
  child:   IconButton(onPressed: (){
    context.read<MaintenanceController>().getOrderDetails(!widget.isMaintain!, widget.orderId!);
  }, icon:  Icon(
    Icons.refresh ,color: Theme.of(context).primaryColor,
  )),
);
}

   else  
   
  return     Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
   
     Text(
       getStatusName(
         context,
         int.parse(controller.orderDetailsMapper!.data!.status!))!
       
       
      //  "${translation!.translate("new_order")}" 
       
       ,


style: const TextStyle(
      color: Colors.black
)

,
)
,
10.width,
Container(height: 10,width: 10,

decoration:  BoxDecoration(
  shape: BoxShape.circle,
  color: getOrderColor( int.parse(controller.orderDetailsMapper!.data!.status!))
),
)

,

            ],
          ).paddingAll(5);

   }
 ) 



,



          ],
          backgroundColor: Colors.white,
          titleSpacing: 0,
          
          // leading:  const SizedBox()
          
          //  widget.fromDashboard!?const SizedBox()
          //  : 

          //  ,
    
    
    //       IconButton(onPressed: (){
    // Navigator.pop(context);
    //       }, icon: const Icon(Icons.arrow_back))
          
          
          title: 
          
          
           Builder(
   builder: (context) {

if (controller.orderDetailsMapper!.status==Status.LOADING) {
    return const SizedBox.shrink();

   return Center(
        child: mProgress(context ,fromPage: true),
  );
}
else if(controller.orderDetailsMapper!.status==Status.ERROR) {
    return const SizedBox.shrink();

  return Center(
  child:   IconButton(onPressed: (){
    context.read<MaintenanceController>().getOrderDetails(!widget.isMaintain!, widget.orderId!);
  }, icon:  Icon(
    Icons.refresh ,color: Theme.of(context).primaryColor,
  )),
);
}
     else return        BoxText.subheading(
            '${translation!.translate("order")} #${controller.orderDetailsMapper!.data!.orderId}'
          );
            
   })
          ,

        
          
        ),


        body:  
        
        
        
        RefreshIndicator(
          onRefresh: ()async{
context.read<MaintenanceController>().getOrderDetails(

      !widget.isMaintain!, widget.orderId!);
          },
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: 
              
                      Builder(builder: (_){
        
        
        if (controller.orderDetailsMapper!.status==Status.LOADING) {
          return Center(
          child: mProgress(context ,fromPage: true),
          );
        } 
        else if( controller.orderDetailsMapper!.status==Status.ERROR){
        return Center(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(controller.orderDetailsMapper!.message!),
        const SizedBox(height: 10,) ,
        IconButton(onPressed: (){
          context.read<MaintenanceController>().getOrderDetails(!widget.isMaintain!, widget.orderId!);
        }, icon:  Icon(
          Icons.refresh ,color: Theme.of(context).primaryColor,
        ))
          ],
          ),
        );
        }
              else
            return        Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
        
        
        
        
         SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
           Text.rich(
            TextSpan(
              text:
               
              sharedPrefs.isMaintain?
               currentLang(context)=="ar"?" من: ":"From : ":
               currentLang(context)=="ar"?" مرسل إلى: ":"to : "
               
                 ,
              children: [
          TextSpan(
            text: 
             sharedPrefs.isMaintain?
             controller.orderDetailsMapper!.data!.from:
             controller.orderDetailsMapper!.data!.to
            // getModelName(context ,       controller.orderDetailsMapper!.data!.modelType)


            
         
          )
              ]
            )
         )
         
         // :
         // Text.rich(
         //   TextSpan(
         //     text: widget.modelType  ,
         //     children: [
         //       TextSpan(
         //         text: widget.from
         //       )
         //     ]
         //   )
         // )
         
            ,
         
         5.width,
         
            
         
         
         
           Text.rich(
            TextSpan(
              text: '${translation!.translate("date")}: '  ,
              children: [
          TextSpan(
            text: getMaintenanceFormattedDate(controller.orderDetailsMapper!.data!.date!,
            translation.locale.languageCode=="ar"?
            "ar":"en_US"
            
            )
          )
              ]
            )
         )
            ,
            
         
            ],
         ),
         )  ,
        20.height ,
        
        
           // Figma Flutter Generator Rectangle2Widget - RECTANGLE
             
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
        
             // Figma Flutter Generator TabbtnWidget - GROUP
             AnimatedContainer(
               duration: const Duration(milliseconds: 300),
          width: 119,
          height: 29,
          decoration: 
          
               
           BoxDecoration(
            borderRadius : selectedTab==0? const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ): BorderRadius.circular(0)
            
            ,
            color:  selectedTab==0?
              Theme.of(context).primaryColor.withOpacity(.40):
              Colors.transparent
           ),
              child: 
              
              Center(
               child: 
               Text('${translation.translate("details")}', textAlign: TextAlign.left, style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 16,
          fontWeight: FontWeight.normal,
              ),)
               ,
             )
            )
        
        .onTap((){
          selectedTab=0;
          setState(() {
            
          });
        })
        ,
        
            const SizedBox(width: 10,),
             AnimatedContainer(
          width: 119,
          height: 29,
        
          duration: const Duration(
            milliseconds: 300
          ),
          decoration: 
          
          
           BoxDecoration(
            borderRadius :  selectedTab==1?const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ):BorderRadius.circular(0),
              color :
              selectedTab==1?
              Theme.of(context).primaryColor.withOpacity(.40):
              
              Colors.transparent
              ,
          ),
              child: 
              
              Center(
               child: 
               Text('${translation.translate("comments")}', textAlign: TextAlign.left, style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 16,
          fontWeight: FontWeight.normal,
              ),)
               ,
             )
            )
        
        .onTap((){
          selectedTab=1;
          setState(() {
            
          });
        })
        
        
        
               ],
             )
        
        ,
        10.height,
        
        
        
        Expanded(
          child:   Builder(builder: 
          
          (_){
          if (selectedTab==1) {
            return
            
            
             OrderRecords(orderId: 
            controller.orderDetailsMapper!.data!.orderId,);
          }
          
            return
          
            
             _details(context,
             detailMapper: controller.orderDetailsMapper!.data!);
          }
          ),
        )
        
        
        
        
        
        
                ],);
              
            
            
                      })
            ),
          ),
        ),

floatingActionButtonLocation:
  selectedTab==1?
 FloatingActionButtonLocation.centerDocked
 
 :  
 FloatingActionButtonLocation.endFloat

 ,
        floatingActionButton:       
        
        
        selectedTab==1?
        
                            Padding(
                              padding:   EdgeInsets.only(
                              

bottom: 


MediaQuery.of(context).viewInsets.bottom

                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [


                                  sharedPrefs.isSuper?const SizedBox():

                                          !sharedPrefs.isMaintain?
                           controller.orderDetailsMapper!.data!.status.toString()=="0"?
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child: FloatingActionButton(
    
    backgroundColor: Theme.of(context).primaryColor,
    onPressed: 
  
  (){
    //open edit page
    EditMaintenanceOrder(
      orderId:controller.orderDetailsMapper!.data!.orderId ,

images: controller.orderDetailsMapper!.data!.file!,
// category: controller.orderDetailsMapper!.data.,
// maintain_type: controller.orderDetailsMapper!.data.maintainanceAsset.,
// modelId: controller.orderDetailsMapper!.data!.maintainanceAsset!,
task: controller.orderDetailsMapper!.data!.task,
// urgent: controller.orderDetailsMapper!.data!.,

    ).launch(context).then((value){

//refresh details

 context.read<MaintenanceController>().getOrderDetails(

      !widget.isMaintain!, widget.orderId!);

    


    });
  },
  child: const Icon(Icons.edit ,),
  ),
)

                       :
                           const SizedBox.shrink()     
:
                           const SizedBox.shrink() 
                           ,
const SizedBox(height: 8,),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width - 60,
                                        child: Card(
                                          margin: const EdgeInsets.only(
                                              left: 5, right: 5, bottom: 8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          child
                                          : 
                                          
                                          TextFormField(
                                            controller: _controller,
                                            focusNode: focusNode,
                                            textAlignVertical: TextAlignVertical.center,
                                            keyboardType: TextInputType.multiline,
                                            maxLines: 5,
                                            minLines: 1,
                                  
                                  
                                  
                                  
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                setState(() {
                                                  // sendButton = true; 
                                                });
                                              } else {
                                                setState(() {
                                                  // sendButton = false;
                                                });
                                              }
                                            },
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            
                                              hintText:  translation!.translate("type_a_comment")!,
                                              hintStyle: const TextStyle(color: Colors.grey),
                                             
                                            
                                              contentPadding: const EdgeInsets.symmetric(
                                                horizontal: 10 ,vertical: 5
                                              ),
                                  
                                  
                                              suffixIcon: IconButton(onPressed: (){
                                  Navigator.of(context)  
                                  .push(
                                    
                                    MaterialPageRoute(builder: (_)=> RecordWithMediaPage(
                                      orderId: widget.orderId,
                                    ))
                                  );
                                  
                                              }, icon: const Icon(Icons.image))
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 8,
                                          right: 2,
                                          left: 2,
                                        ),
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: kcPrimaryColor,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.send ,
                                              color: Colors.white,
                                            ),
                                            onPressed: ()async {
                                       
                                  controller.addRecord(context, widget.orderId!,
                                  
                                   _controller.text,null, null).then((value) {
                                  
                                     _controller.clear();
                                   });
                                  
                                              }
                                            
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           :

                            controller.orderDetailsMapper!.data==null?
                            const SizedBox.shrink():
                            !sharedPrefs.isMaintain?
                           controller.orderDetailsMapper!.data!.status.toString()=="0"?
FloatingActionButton(
  
  backgroundColor: Theme.of(context).primaryColor,
  onPressed: 

(){
  //open edit page
  EditMaintenanceOrder(
images: controller.orderDetailsMapper!.data!.file!,
// modelId: controller.orderDetailsMapper!.data!.maintainanceAsset!,
task: controller.orderDetailsMapper!.data!.task,
// urgent: controller.orderDetailsMapper!.data!.,
orderId:controller.orderDetailsMapper!.data!.orderId ,
    )
    
    .launch(context).then((value){

//refresh details


 context.read<MaintenanceController>().getOrderDetails(

      !widget.isMaintain!, widget.orderId!);


    });
},
child: const Icon(Icons.edit ,),
)

                       :
                           const SizedBox.shrink()     

                           :
                           const SizedBox.shrink()

        
        
        ,
   
   
   
    );





  }

  _details(BuildContext context,{OrderDetailMapper? detailMapper}){
    var translation = AppLocalizations.of(context);

return 


Builder(
  builder: (context) {

    // if (detailMapper!=null) {
      return 


         Column(     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
    
    



BoxText.body(currentLang(context)=="ar"?"معلومات ${ getModelName(context ,       detailMapper!.modelType) }: ":"${ getModelName(context ,       detailMapper!.modelType) } Info:  ") ,

getAssetInfo( detailMapper.maintainanceAsset,
currentLang(context)=="ar"?
detailMapper.model_name_ar.toString():detailMapper.model_name_en.toString()
),
// Text( detailMapper.model_name_ar.toString(),),

10.height,



    
     BoxText.body('${translation!.translate("note")}: ') ,
    10.height ,
       
    
    
    
    
    
    Container( 
    // height: MediaQuery.of(context).size.height/3,
    width:MediaQuery.of(context).size.width ,
    padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.white,
        
          //      gradient: const LinearGradient(
          //   stops:  [0.05, 0.02],
          //   colors: [Colors.red, Colors.white]
          // ),
               borderRadius: BorderRadius.all(
          Radius.circular(10),
          ),
          boxShadow: [
          BoxShadow(
          color: Color(0xffDDDDDD),
          blurRadius: 6.0,
          spreadRadius: 2.0,
          offset: Offset(0.0, 0.0),
          )
          ],
        
      ),
      child:  SingleChildScrollView(
        child: Text(
          detailMapper.task!,
         
           maxLines: 10, 
           
          
          textAlign: TextAlign.justify,
          overflow: TextOverflow.fade,
          ),
      ),
     )
    ,
    10.height,
  BoxText.body(
    currentLang(context)=="ar"?
    "سبب الرفض":"Reject reason: " , 
    // color: Colors.red,
  ).visible(detailMapper.reject_resion!=null) ,
    10.height ,
       
    
    
    
    
    
    Container( 
    // height: MediaQuery.of(context).size.height/3,
    width:MediaQuery.of(context).size.width ,
    padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.white,
        
          //      gradient: const LinearGradient(
          //   stops:  [0.05, 0.02],
          //   colors: [Colors.red, Colors.white]
          // ),
               borderRadius: BorderRadius.all(
          Radius.circular(10),
          ),
          boxShadow: [
          BoxShadow(
          color: Color(0xffDDDDDD),
          blurRadius: 6.0,
          spreadRadius: 2.0,
          offset: Offset(0.0, 0.0),
          )
          ],
        
      ),
      child:  SingleChildScrollView(
        child: Text(
          detailMapper.reject_resion.toString(),
         
           maxLines: 10, 
           style: const TextStyle(
            color: Colors.red
           ),
          
          textAlign: TextAlign.justify,
          overflow: TextOverflow.fade,
          ),
      ),
     ).visible(detailMapper.reject_resion!=null)
    ,

10.height,
sharedPrefs.isSuper?const SizedBox():

(
  
  sharedPrefs.isMaintain
  // detailMapper!.orderUserId==sharedPrefs.user_id
&& detailMapper.confirmed.toString()=="0"

)?


     Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [


Container(
            width: 120 ,height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: 
               context.read<MaintenanceController>(). updateOrder!.status==Status.LOADING
             
              ?
             const CircularProgressIndicator(
               
               strokeWidth: 1,color: Colors.white,

              
             ):
              Text(translation.translate("accept")! ,
              style: const TextStyle(
        color: Colors.white
              ),
              
              
              ),
            ),
            ).onTap((){



  context.read<MaintenanceController>().updateOrderStatus(context,
   detailMapper.orderId!.toString(),null, 1.toString());
  

context.read<MaintenanceController>()
.refreshOrderDetails(!sharedPrefs.isMaintain, detailMapper.orderId.toString());



            }) , 



        Container(
        width: 120 ,height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(translation.translate("reject")! ,
          style: const TextStyle(
                    color: Colors.white
          ),
          
          
          ),
        ),
        )
        .onTap((){
          ///TODO: change order status

//make it clsoing   = 1

// controller.changeOrderStatus(context, widget.orderId!, 1.toString());
RejectPage(orderId:detailMapper.orderId!.toString() ,).launch(context);
        })


      ],
     )


      
    
    
  :const SizedBox()
,


    20.height ,
    
     BoxText.body('${translation.translate("attachments")}: ')
     
     
      , 
    10.height ,
    
       Expanded(
        // height: MediaQuery.of(context).size.height/4,
        child:
        detailMapper.file ==null ||  detailMapper.file!.isEmpty
        ?
     Center(child: NoContent(
    
    
      translation.translate("no_files")
    ),):
        
         GridView.count(
      shrinkWrap: true,
      crossAxisCount:3,
      childAspectRatio: 1,
        children:
          detailMapper.file ==null?
         []:
          detailMapper.file!.map((e) {
    if (e.toString().contains("png")|| 
    
    e.toString().contains("jpeg")|| 
    e.toString().contains("jpg") ) {
      return 


      Padding(
        padding: const EdgeInsets.all(3.0),
        child: CachedNetworkImage(
         imageUrl: "https://goodfoodsa.co$e",
         fit: BoxFit.cover,
        
           width: 300,
                    height: 300,
         progressIndicatorBuilder: (context, url, downloadProgress) => 
                 Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
         errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
      ).onTap((){


   DocumentService().initPlatformState(e);

      });
      
      
    }else {
        return Container(
        child: Image.asset(
        
         getFileIocn(e)
          ,
                  width: 300,
                  height: 300,
        ),
        ).onTap((){

        // OpenDocumentPage(needLoadfromUrl: false,url: e,);
//download file 
DocumentService().initPlatformState(e);
//open file



      });
    }
    
    
         }).toList()
    
    
    //      List.generate(5, (index) {
    
    //  return Card(
    //         clipBehavior: Clip.antiAlias,
    //         child: Stack(
    //           children: <Widget>[
    //            Image.asset(
    //               'assets/images/logo.png',
    //               width: 300,
    //               height: 300,
    //             ),
    
    //             // Positioned(
    //             //   right: 5,
    //             //   top: 5,
    //             //   child: InkWell(
    //             //     child: const Icon(
    //             //       Icons.remove_circle,
    //             //       size: 20,
    //             //       color: Colors.red,
    //             //     ),
    //             //     onTap: () {
                     
    //             //     },
    //             //   ),
    //             // ),
              
    //           ],
    //         ));
    //     })
        
        )
      
      
        ),
      
      ],
    );
  
    // }

    // else {
    //   return     Column(     crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    
    
    
    
    //  BoxText.body('${translation!.translate("note")}: ') ,
    // 10.height ,
       
    
    
    
    
    
    // Container( 
    // // height: MediaQuery.of(context).size.height/3,
    // width:MediaQuery.of(context).size.width ,
    // padding: const EdgeInsets.all(15),
    //   decoration: const BoxDecoration(
    //       color: Colors.white,
        
    //       //      gradient: const LinearGradient(
    //       //   stops:  [0.05, 0.02],
    //       //   colors: [Colors.red, Colors.white]
    //       // ),
    //            borderRadius: BorderRadius.all(
    //       Radius.circular(10),
    //       ),
    //       boxShadow: [
    //       BoxShadow(
    //       color: Color(0xffDDDDDD),
    //       blurRadius: 6.0,
    //       spreadRadius: 2.0,
    //       offset: Offset(0.0, 0.0),
    //       )
    //       ],
        
    //   ),
    //   child:  SingleChildScrollView(
    //     child: Text(
    //       "${widget.task!} "
    //       ,
         
           
          
    //       textAlign: TextAlign.justify,
    //       overflow: TextOverflow.fade,
    //       ),
    //   ),
    //  )
    // ,
    // 20.height ,
    
    //  BoxText.body('${translation.translate("attachments")}: ')
     
     
    //   , 
    // 10.height ,
    
    //    Expanded(
    //     // height: MediaQuery.of(context).size.height/4,
    //     child:
    //      widget.file==null 
    //     ?
    //  Center(child: NoContent(
    
    
    //   translation.translate("no_files")
    // ),):
        
    //      GridView.count(
    //   shrinkWrap: true,
    //   crossAxisCount:3,
    //   childAspectRatio: 1,
    //     children:
    //      widget.file ==null?
    //      []:
    //      widget.file!.map((e) {
    // if (e.toString().contains("png")|| 
    
    // e.toString().contains("jpeg")|| 
    // e.toString().contains("jpg") ) {
    //   return Container(
    //     child: 
        
    //     Image.network(
    //         "https://goodfoodsa.co$e",
    //               width: 300,
    //               height: 300,
    //             ),
        
    //   ).onTap(()async{
    //    await DocumentService().initPlatformState(e);
    //   });
    // }else {
    //     return Container(
    //     child: Image.asset(
        
    //     getFileIocn(e)
    //       ,
    //               width: 300,
    //               height: 300,
    //     ),
    //     ).onTap(()async{
    //     await   DocumentService().initPlatformState(e);
    //     });
    // }
    
    
    //      }).toList()
    
    
    // //      List.generate(5, (index) {
    
    // //  return Card(
    // //         clipBehavior: Clip.antiAlias,
    // //         child: Stack(
    // //           children: <Widget>[
    // //            Image.asset(
    // //               'assets/images/logo.png',
    // //               width: 300,
    // //               height: 300,
    // //             ),
    
    // //             // Positioned(
    // //             //   right: 5,
    // //             //   top: 5,
    // //             //   child: InkWell(
    // //             //     child: const Icon(
    // //             //       Icons.remove_circle,
    // //             //       size: 20,
    // //             //       color: Colors.red,
    // //             //     ),
    // //             //     onTap: () {
                     
    // //             //     },
    // //             //   ),
    // //             // ),
              
    // //           ],
    // //         ));
    // //     })
        
    //     )
      
      
    //     ),
      
    //   ],
    // );
    // }
  
  
  }
);

  }

  getModelName(BuildContext context , model){
    switch (model.toString().toLowerCase()) {
      case 'car':
      return
        currentLang(context)=="ar"?"سيارة":"Car";
       case 'department':
      return
        currentLang(context)=="ar"?"ادارة":"Department"; 

        case 'asset':
      return
        currentLang(context)=="ar"?"معدات":"Asset";
        case 'otherasset':
      return
        currentLang(context)=="ar"?"اصول اخرى":"Other Asset";
        case 'branch':
      return
        currentLang(context)=="ar"?"فرع":"Branch";
        
 case 'skin':
      return
        currentLang(context)=="ar"?"سكنات":"Houses";
      default:
     currentLang(context)=="ar"?"اصول اخرى":"Other Asset"; {}
    }

  }


 Widget getAssetInfo(MaintainanceAsset? maintainanceAsset, String name) {
 DefaultMaintenanceAsset defaultMaintenanceAsset =
    (maintainanceAsset as DefaultMaintenanceAsset);
   return Container(

 width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/8,


          // margin: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
 padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          decoration: BoxDecoration(

borderRadius: BorderRadius.circular(5) ,
color: Colors.white,
 boxShadow: const [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 2.0,
      offset: Offset(0.0, 3.0),
      )
      ],

          ),






child: 

   Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
              Text(
          currentLang(context)=="ar"?
              "النوع :  ${getModelName(context, defaultMaintenanceAsset.modelType) }"  :
              " type:  ${getModelName(context, defaultMaintenanceAsset.modelType)}"  
            ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // color: Colors.white ,
              fontSize: 15
            ), 
             ),
const SizedBox(height: 8,),
              Text(
                currentLang(context)=="ar"?   
                    "الاسم :  $name"  :
            "Name :  $name"  ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
               fontSize: 12
            ), 
            
             ),
    ],
  ),






  );
/*

if (maintainanceAsset is CarMaintenanceAsset) {
  CarMaintenanceAsset carData =maintainanceAsset;

  return 
  
  
       Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/8,


          // margin: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
 padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          decoration: BoxDecoration(

borderRadius: BorderRadius.circular(5) ,
color: Colors.white,
 boxShadow: const [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 2.0,
      offset: Offset(0.0, 3.0),
      )
      ],

          ),


    child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


Transform.rotate(
  angle: 0,
  child: 
  !carData.files!.isNotEmpty?
  Image.network('https://goodfoodsa.co${carData.files!.first}' ,
  // color: Colors.white,
  width: 50,

  ):
  
  
    Image.asset('assets/icons/car.png' ,
    // color: Colors.white,
  width: 50,

  ),
),

const SizedBox(width: 8,),
Expanded(
  child:  
  
   Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
              Text(
          currentLang(context)=="ar"?
              "نوع السيارة:  ${carData.carType! }"  :
              "Car type:  ${carData.carType! }"  
            ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // color: Colors.white ,
              fontSize: 15
            ), 
             ),
const SizedBox(height: 8,),
              Text(
                currentLang(context)=="ar"?   
                    "رقم الهيكل:  ${carData.bordNumber!}"  :
            "Board Number:  ${carData.bordNumber!}"  ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
               fontSize: 12
            ), 
            
             ),
    ],
  ),


)

          ],
    ),
    );
      

  
  
  
  
  
  
  
  
  
  
  Container();
}else {
    DefaultMaintenanceAsset defaultMaintenanceAsset =
    (maintainanceAsset as DefaultMaintenanceAsset);

  return Container(

 width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/8,


          // margin: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
 padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          decoration: BoxDecoration(

borderRadius: BorderRadius.circular(5) ,
color: Colors.white,
 boxShadow: const [
      BoxShadow(
      color: Color(0xffDDDDDD),
      blurRadius: 2.0,
      spreadRadius: 2.0,
      offset: Offset(0.0, 3.0),
      )
      ],

          ),






child: 

   Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
              Text(
          currentLang(context)=="ar"?
              "النوع :  ${getModelName(context, defaultMaintenanceAsset.modelType) }"  :
              " type:  ${getModelName(context, defaultMaintenanceAsset.modelType)}"  
            ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // color: Colors.white ,
              fontSize: 15
            ), 
             ),
const SizedBox(height: 8,),
              Text(
                currentLang(context)=="ar"?   
                    "الاسم :  ${defaultMaintenanceAsset.nameAr}"  :
            "Name :  ${defaultMaintenanceAsset.nameEn}"  ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
               fontSize: 12
            ), 
            
             ),
    ],
  ),






  );


}
*/
}

}

