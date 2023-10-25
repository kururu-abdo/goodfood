import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/widgets/dashboard_item.dart';
import 'package:goodfoods/core/colors.dart';
import 'package:goodfoods/core/presentation/widgets/app_bar.dart';
import 'package:goodfoods/core/services/app_localization.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({ Key? key }) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
        var locals = AppLocalizations.of(context);
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: mLightAppBar(context, ''),
       body:
    
     SizedBox.expand(
       child: Stack(
         alignment: Alignment.center,
     
     children: [
     
     
     
     Container(
       height: MediaQuery.of(context).size.height,
       decoration:   BoxDecoration(
         // color: Colors.white ,  
       boxShadow: [ 
     
         BoxShadow(
            offset: const Offset(0, 3) , 
            color: kcScaffoldBackgroundColor.withOpacity(.5) , 
     
            blurRadius: 10 ,spreadRadius: 5
         )
       ]
     
       ),
       child: GridView.count(crossAxisCount: 2, 
       mainAxisSpacing: 10 ,crossAxisSpacing: 10,
       
       children:  [
         DasboardItem(
            title: locals!.translate('orders')! , count: 4,
            themeColor: Colors.purple,
         ) , 
     
     
            DasboardItem(
            title: locals.translate('branches')! , count: 4,
            themeColor: Colors.purple,
         ) ,
            DasboardItem(
            title: locals.translate('machines')!, count: 4,
            themeColor: Colors.purple,
         ) ,
            DasboardItem(
            title:locals.translate('employees')! , count: 4,
            themeColor: Colors.purple,
         )
       ],
       
       ),
     )
      
      
     ,

        //  mLightBottomNav(context)
     ],
     
       ),
     )
    );
  }
}