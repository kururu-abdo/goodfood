import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goodfoods/app/report/models/report_details_model.dart';
import 'package:goodfoods/app/user/repond_to_task.dart';
import 'package:goodfoods/core/presentation/widgets/subtask_widget.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:nb_utils/nb_utils.dart';

class TaskWidget extends StatefulWidget {
  final selectedIndex;
  final int? index;
  final String? branch;
  final bool? isAdmin;
  final Function()? onNotifiy;
  final Tasks? tasks;
  final String? regionId;
  final String? branchId;
  final Brand? brand;
  const TaskWidget({ Key? key,
  
  this.isAdmin=false,
   this.branch, this.onNotifiy, this.selectedIndex, this.index, this.tasks, this.regionId, this.branchId, this.brand }) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool _showSubTasks=false;
  int? activeMeterIndex; // Expansion Panel
  final StreamController activeMeterIndexStreamControl =
      StreamController.broadcast();
  Stream get onUpdateActiveIndex => activeMeterIndexStreamControl.stream;
  void updateExpansionTile() =>
      activeMeterIndexStreamControl.sink.add(activeMeterIndex);
final List<Map<String, dynamic>> _items = List.generate(
    10,
        (index) => {
      'id': index,
      'title': 'Item $index',
      'description':
      'This is the description of the item $index. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'isExpanded': false
    });
  @override
  Widget build(BuildContext context) {
        var locale = AppLocalizations.of(context);

    return

  !widget.isAdmin!? 
  Container(
       decoration:    BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.20),
        blurRadius: 5.0, // soften the shadow
        spreadRadius: 3.0, //extend the shadow
        offset: const Offset(
          3.0, // Move to right 5  horizontally
          3.0, // Move to bottom 5 Vertically
        ),
      )
    ],
) ,
       margin: const EdgeInsets.symmetric(
vertical: 6 ,
       ),
       child: Container(
         padding: const EdgeInsets.all(15),
         child:
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
                  locale!.locale.languageCode=="ar"?
widget.tasks!.taskAr!:
               widget.tasks!.taskEn!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              5.height,
Text(
                  locale.locale.languageCode=="ar"?

widget.tasks!.senderDesAr!:
               widget.tasks!.senderDesEn!,
               maxLines: 5,
               overflow: TextOverflow.ellipsis,
                style:  TextStyle(fontSize: 15, color: Colors.grey[700]!,)
              ),

           ],
         ),
       )

       ).onTap((){
          RespondToTask(
            tasks: widget.tasks,
            brand: widget.brand,
          ).launch(context);
       }):
   

SizedBox(
  height: _showSubTasks?  MediaQuery.of(context).size.height/2:80,
  child:   
  
  AnimatedCrossFade(firstChild:
   
   
    Container(
      height: 80,
         decoration:    BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.20),
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 3.0, //extend the shadow
          offset: const Offset(
            3.0, // Move to right 5  horizontally
            3.0, // Move to bottom 5 Vertically
          ),
        )
      ],
  ) ,
         margin: const EdgeInsets.symmetric(
  vertical: 6 ,
         ),
        child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  Row(
    children: [
          Text(widget.branch!) , 
          const SizedBox(
            width: 20,
          ) , 
          Container(
            height: 30 , width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1 ,  color: Theme.of(context).primaryColor
              )
            ),
            child: const Center(
              child: Text('Notify Manger branch'),
            ),
          )
    ],
  ) , 
  
  
  IconButton(onPressed: (){
  _showSubTasks=   !_showSubTasks;
  setState(() {
    
  });
  }, icon: Icon(Icons.add ,   color: Theme.of(context).primaryColor  ))
  
  
  
    ],
  ),
          
           
         
         
         
         ),
   
   
   
   secondChild:  SizedBox(
     height: MediaQuery.of(context).size.height/2,
     child: Column(
       children: [
   Container(
         decoration:    BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.20),
          blurRadius: 5.0, // soften the shadow
          spreadRadius: 3.0, //extend the shadow
          offset: const Offset(
            3.0, // Move to right 5  horizontally
            3.0, // Move to bottom 5 Vertically
          ),
        )
      ],
   ) ,
         margin: const EdgeInsets.symmetric(
   vertical: 6 ,
         ),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
   Row(
      children: [
          Text(widget.branch!) , 
          const SizedBox(
            width: 20,
          ) , 
          Container(
            height: 30 , width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1 ,  color: Theme.of(context).primaryColor
              )
            ),
            child: const Center(
              child: Text('Notify Manger branch'),
            ),
          )
      ],
   ) , 
   
   
   IconButton(onPressed: (){
   _showSubTasks=   !_showSubTasks;
   setState(() {
      
   });
   }, icon: Icon(Icons.remove ,   color: Theme.of(context).primaryColor  ))
   
   
   
      ],
   ),
          
           
         
         
         
         ),
     10.height , 
     
   Expanded(child: 
   ListView(
      children:  [
                SubtaskWidget(
             branch: widget.branch,
                image: 'a.png',
                taskStaus: 0,
                employee: 'حسام',
                
                )  , 
                
                SubtaskWidget(
             branch: widget.branch,
                image: 'a.png',
                taskStaus: 0,
                employee: 'حسام',
                
                )
              ],
   )
   
   )
     
   
       ],
     ),
   ),
    crossFadeState: !_showSubTasks?
    CrossFadeState.showFirst:CrossFadeState.showSecond
    , 
    duration: const Duration(
  
  milliseconds: 300
    )),



);



     Container(
       decoration:    BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.20),
        blurRadius: 5.0, // soften the shadow
        spreadRadius: 3.0, //extend the shadow
        offset: const Offset(
          3.0, // Move to right 5  horizontally
          3.0, // Move to bottom 5 Vertically
        ),
      )
    ],
) ,
       margin: const EdgeInsets.symmetric(
vertical: 6 ,
       ),
       child:
       
       
       
       
       
        Container(
         padding: const EdgeInsets.all(8),
         child: ExpansionTile(
        
            onExpansionChanged: (bool isExpanded) {
         
          
               },
          // leading: Icon(list.icon),
               //     subtitle:  Container(
               //   height: 30 , width: 150,
               //   decoration: BoxDecoration(
               //     border: Border.all(
               //       width: 1 ,  color: Theme.of(context).primaryColor
               //     )
               //   ),
               //   child: const Center(
               //     child: Text('Notify Manger branch'),
               //   ),
               // ),
          title: const Text(
           "fix the design and code",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          children: [
            SubtaskWidget(
         branch: widget.branch,
            image: 'a.png',
            taskStaus: 0,
            employee: 'حسام',
            
            )  , 
            
            SubtaskWidget(
         branch: widget.branch,
            image: 'a.png',
            taskStaus: 0,
            employee: 'حسام',
            
            )
          ],
           ),
       ),
     
     
     
     
     );
    
    
    
    
     Column(
      children: [
        Card(
          elevation: 3,
          child:Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10 ,vertical: 8
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/7,

child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
Row(
  children: [
        Text(widget.branch!) , 
        const SizedBox(
          width: 20,
        ) , 
        Container(
          height: 30 , width: 150,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1 ,  color: Theme.of(context).primaryColor
            )
          ),
          child: const Center(
            child: Text('Notify Manger branch'),
          ),
        )
  ],
) , 


IconButton(onPressed: (){
_showSubTasks= !_showSubTasks;
setState(() {
  
});
}, icon: Icon(Icons.add ,   color: Theme.of(context).primaryColor  ))



  ],
),
        
        
        
        
          )
        ),
      
      Visibility(
        visible: _showSubTasks,
        
        child: 
      Expanded(child: 
      
      Column(

        children: [
          8.height ,
          Expanded(child: 
          ListView(

            
          )
          
          )
        ],
      )
      
      )
      
      
      )
      
      
      ],
    );
  }
}