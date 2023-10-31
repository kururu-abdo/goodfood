import 'package:flutter/material.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class NextPageButton extends StatelessWidget {
  final Function()? onTap;
  final bool? isLaoding;
  const NextPageButton({ Key? key, this.onTap, this.isLaoding=false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    
AnimatedCrossFade(firstChild: 

   AnimatedContainer(  margin: const EdgeInsets.only(
          bottom: 10 , left: 10 ,right: 10,
          top: 10
        ),
       duration: const Duration(milliseconds:  250),
      width:MediaQuery.of(context).size.width,
      height: 40,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10) ,
  color: Theme.of(context).primaryColor
),
      child:  Center(
        child: Text(
          currentLang(context)=="ar"? "الصفحة التالية":"Next Page" ,

          style: const TextStyle(
            color: Colors.white ,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ).onTap((){
      onTap!();
    })

, secondChild: 


   Center(
     child: AnimatedContainer(  margin: const EdgeInsets.only(
            bottom: 10 , left: 10 ,right: 10,
            top: 10
          ),
         duration: const Duration(milliseconds:  250),
        width:50,
        height: 50,
   decoration: BoxDecoration(
     shape: BoxShape.circle,
    //  borderRadius: BorderRadius.circular(10) ,
     color: Theme.of(context).primaryColor
   ),
        child:  const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          )
        ),
      ),
   )


, crossFadeState: isLaoding!?CrossFadeState.showSecond:CrossFadeState.showFirst, 
duration: const Duration(milliseconds:  250))



  
    
    ;
  }
}