import 'package:flutter/material.dart';
import 'package:goodfoods/core/controllers/chat_controller.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class LoadMore extends StatelessWidget {
  final Function()? onLoad;
  
  const LoadMore({ Key? key, this.onLoad }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      var chatController = Provider.of<ChatController>(context);
    return Center(
      child:
      
      chatController.moreLoading?
      
      
      
      
      
       AnimatedContainer(
        duration: const Duration(microseconds: 50),
        width:40,
        height: 40,  
        padding: const EdgeInsets.all(10),
    
    decoration: BoxDecoration(
      shape: BoxShape.circle ,
     
      color: Theme.of(context).primaryColor
    ),
        child:
        chatController.moreLoading?
        const Center(child: CircularProgressIndicator(color: Colors.white,),):
        
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentLang(context)=="ar"?"تحميل المزيد":"Load more" ,
              style: const TextStyle(
                color: Colors.white,
              ),
              
            ),

            const Icon(Icons.arrow_upward_outlined,color: Colors.white,) ,
    
            const SizedBox()
          ],
        ),
      ).onTap((){
        // onLoad!();
      })
      
      :
      
      AnimatedContainer(
        duration: const Duration(microseconds: 50),
        width:120,
        height: 40,  
        padding: const EdgeInsets.all(10),
    
    decoration: BoxDecoration(
      borderRadius:
    
       BorderRadius.circular(10),
      color: Theme.of(context).primaryColor
    ),
        child:
      
  
        
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentLang(context)=="ar"?"تحميل المزيد":"Load more" ,
              style: const TextStyle(
                color: Colors.white,
              ),
              
            ),

            const Icon(Icons.arrow_upward_outlined,color: Colors.white,) ,
    
            const SizedBox()
          ],
        
 )     ).onTap((){
        onLoad!();
      })
      
      
      
    
    
    
    
    
    );
  }
}