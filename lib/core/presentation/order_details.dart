import 'package:flutter/material.dart';
import 'package:goodfoods/app/maintenance/model/details_mapper.dart';
import 'package:goodfoods/app/order/view/pages/reject_page.dart';
import 'package:goodfoods/app/order/view/widgets/order_records.dart';
import 'package:goodfoods/core/box_text.dart';
import 'package:goodfoods/core/colors.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/data/network/api_response.dart';
import 'package:goodfoods/core/presentation/widgets/no_items.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/services/document_service.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  final bool? isAdmin;
  final bool? isFromNotificaiton;
  final String? orderId;
  final int? confirmed;
  final String? task;
  final String? from;
  final String? to;
  final String?  date;
  final List? file;
final String? status;
  const OrderDetails({ Key? key, 
  this.isFromNotificaiton=false,
   this.orderId, this.task, this.status,
    this.isAdmin= true, this.file, this.from, this.to, this.date, this.confirmed }) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
int selectedTab=0;
 bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
int? _confirmed;
int? _status;

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();


@override
void initState() { 
  super.initState();



  if (widget.isFromNotificaiton!) {
    context.read<MaintenanceController>().getOrderDetails(
      widget.isAdmin!, widget.orderId!);
  }else {
      _confirmed =widget.confirmed!;
  _status = int.parse(widget.status!);
  }
}
  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context);


    var controller = Provider.of<MaintenanceController>(context);
  
  if (widget.isFromNotificaiton!) {
    

return Scaffold(
         resizeToAvoidBottomInset: false,
     appBar:   AppBar(
          elevation: 0,
          actions:  [
//        !widget.isAdmin!?
// TextButton(onPressed: (){
// controller.confirmOrder(context, widget.orderId!).then((value) {


//   _confirmed=1;
//   setState(() {
    
//   });
// });
// }, child: Text(translation!.translate("confirm")!)).visible(_confirmed==0)
// :const SizedBox.shrink(),
      




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
    context.read<MaintenanceController>().getOrderDetails(widget.isAdmin!, widget.orderId!);
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
   return Center(
        child: mProgress(context ,fromPage: true),
  );
}
else if(controller.orderDetailsMapper!.status==Status.ERROR) {
  return Center(
  child:   IconButton(onPressed: (){
    context.read<MaintenanceController>().getOrderDetails(widget.isAdmin!, widget.orderId!);
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
        
        
        
        SizedBox.expand(
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
  context.read<MaintenanceController>().getOrderDetails(widget.isAdmin!, widget.orderId!);
}, icon:  Icon(
  Icons.refresh ,color: Theme.of(context).primaryColor,
))
        ],
  ),
);
}
            
    return        Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [





 Row(
  mainAxisAlignment:MainAxisAlignment.spaceBetween,
  children: [
widget.isAdmin!?
Text.rich(
  TextSpan(
    text: '${translation!.translate("to")}: '  ,
    children: [
      TextSpan(
        text: controller.orderDetailsMapper!.data!.to
      )
    ]
  )
):
Text.rich(
  TextSpan(
    text: '${translation!.translate("from")}: '  ,
    children: [
      TextSpan(
        text: controller.orderDetailsMapper!.data!.from
      )
    ]
  )
)

  ,



 Text.rich(
  TextSpan(
    text: '${translation.translate("date")}: '  ,
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
                              child: Row(
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

 _controller.text).then((value) {

   _controller.clear();
 });

                                          }
                                        
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           :
        widget.isAdmin!?
          Container(
        width: 120 ,height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(translation!.translate("closing")! ,
          style: const TextStyle(
            color: Colors.white
          ),
          
          
          ),
        ),
        ).visible(widget.status==1.toString())
        .onTap((){
///TODO: change order status
          //make it closed
controller.changeOrderStatus(context, widget.orderId!, 2.toString());
        })
        
        :

        
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [



                Container(
        width: 120 ,height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(translation!.translate("accept")! ,
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
  controller.updateOrderStatus(context, widget.orderId!, null, 1.toString());
        }),



                
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

RejectPage(orderId: widget.orderId,).launch(context);
        }),


              ],
            ).visible(widget.status==0.toString())
        
        
        ,
   
   
   
    );

  }

else {
    return Scaffold(
         resizeToAvoidBottomInset: false,
     appBar:   AppBar(
          elevation: 0,
          actions:  [
      //  !widget.isAdmin!?
// TextButton(onPressed: (){
// controller.confirmOrder(context, widget.orderId!).then((value) {


//   _confirmed=1;
//   setState(() {
    
//   });
// });
// }, child: Text(translation!.translate("confirm")!)).visible(_confirmed==0)
// :const SizedBox.shrink(),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
 Text(
   getStatusName(
     context,
     int.parse(widget.status!))!
   
   
  //  "${translation!.translate("new_order")}" 
   
   ,


style: const TextStyle(
  color: Colors.black
),
) ,
10.width,
Container(height: 10,width: 10,

decoration:  BoxDecoration(
  shape: BoxShape.circle,
  color: getOrderColor(widget.status!)
),
)

,

            ],
          ).paddingAll(5)
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
          
          
          title:    BoxText.subheading(
            '${translation!.translate("order")} #${widget.orderId}'
          )
            

          ,

        
          
        ),


        body:  SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [





 Row(
  mainAxisAlignment:MainAxisAlignment.spaceBetween,
  children: [
widget.isAdmin!?
Text.rich(
  TextSpan(
    text: '${translation.translate("to")}: '  ,
    children: [
      TextSpan(
        text: widget.to
      )
    ]
  )
):
Text.rich(
  TextSpan(
    text: '${translation.translate("from")}: '  ,
    children: [
      TextSpan(
        text: widget.from
      )
    ]
  )
)

  ,



 Text.rich(
  TextSpan(
    text: '${translation.translate("date")}: '  ,
    children: [
      TextSpan(
        text: getMaintenanceFormattedDate(widget.date!,
        translation.locale.languageCode=="ar"?
        "ar":"en_US"
        
        )
      )
    ]
  )
)
  ,
  

  ],
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
    return OrderRecords(orderId: widget.orderId,);
  }
  
    return _details(context);
  }
  ),
)






              ],
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
                              child: Row(
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
                                        
                                          hintText:  translation.translate("type_a_comment")!,
                                          hintStyle: const TextStyle(color: Colors.grey),
                                         
                                        
                                          contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 10 ,vertical: 5
                                          ),
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

 _controller.text).then((value) {

   _controller.clear();
 });

                                          }
                                        
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           
                           :
        widget.isAdmin!?
          Container(
        width: 120 ,height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(translation.translate("closing")! ,
          style: const TextStyle(
            color: Colors.white
          ),
          
          
          ),
        ),
        ).visible(widget.status==1.toString())
        .onTap((){
///TODO: change order status
          //make it closed
controller.changeOrderStatus(context, widget.orderId!, 2.toString());
        })
        
        :



            Row(
              mainAxisSize: MainAxisSize.min,
              children: [



                Container(
        width: 120 ,height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(translation.translate("accept")! ,
          style: const TextStyle(
                color: Colors.white
          ),
          
          
          ),
        ),
        )
        .onTap((){
          ///TODO: change order status

//make it clsoing   = 1

  controller.updateOrderStatus(context, widget.orderId!, null, 2.toString());
        //  controller.updateOrderStatus(context, widget.orderId!, null, 2.toString());

        }),



                
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

RejectPage(orderId: widget.orderId,).launch(context);
        }),


              ],
            ).visible(widget.status==0.toString())
        
        
        
        ,
   
   
   
    );
  }



  }

  _details(BuildContext context,{OrderDetailMapper? detailMapper}){
    var translation = AppLocalizations.of(context);

return 


Builder(
  builder: (context) {

    if (detailMapper!=null) {
      return 


         Column(     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
    
    
    
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
          detailMapper.task! ,
         
           
          
          textAlign: TextAlign.justify,
          overflow: TextOverflow.fade,
          ),
      ),
     )
    ,
    20.height ,
    
     BoxText.body('${translation.translate("attachments")}: ')
     
     
      , 
    10.height ,
    
       Expanded(
        // height: MediaQuery.of(context).size.height/4,
        child:
        detailMapper.file ==null 
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
      return Container(
        child: 
        
        Image.network(
            "https://goodfoodsa.co$e",
                  width: 300,
                  height: 300,
                ),
        
      ).onTap((){
        // OpenDocumentPage(needLoadfromUrl: false,url: e,);

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
  
    }

    else {
      return     Column(     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
    
    
    
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
          widget.task! ,
         
           
          
          textAlign: TextAlign.justify,
          overflow: TextOverflow.fade,
          ),
      ),
     )
    ,
    20.height ,
    
     BoxText.body('${translation.translate("attachments")}: ')
     
     
      , 
    10.height ,
    
       Expanded(
        // height: MediaQuery.of(context).size.height/4,
        child:
         widget.file==null 
        ?
     Center(child: NoContent(
    
    
      translation.translate("no_files")
    ),):
        
         GridView.count(
      shrinkWrap: true,
      crossAxisCount:3,
      childAspectRatio: 1,
        children:
         widget.file ==null?
         []:
         widget.file!.map((e) {
    if (e.toString().contains("png")|| 
    
    e.toString().contains("jpeg")|| 
    e.toString().contains("jpg") ) {
      return Container(
        child: 
        
        Image.network(
            "https://goodfoodsa.co$e",
                  width: 300,
                  height: 300,
                ),
        
      ).onTap(()async{
       await DocumentService().initPlatformState(e);
      });
    }else {
        return Container(
        child: Image.asset(
        
        getFileIocn(e)
          ,
                  width: 300,
                  height: 300,
        ),
        ).onTap(()async{
        await   DocumentService().initPlatformState(e);
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
    }
  
  
  }
);

  }
}