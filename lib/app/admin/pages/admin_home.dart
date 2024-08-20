import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/chat_page.dart';
import 'package:goodfoods/app/admin/widgets/branch_widget.dart';
import 'package:goodfoods/app/admin/widgets/dashboard_item.dart';
import 'package:goodfoods/app/help/view/pages/help_page.dart';
import 'package:goodfoods/core/colors.dart';
import 'package:goodfoods/core/controllers/admin_home_controller.dart';
import 'package:goodfoods/core/presentation/widgets/progress.dart';
import 'package:goodfoods/core/services/app_localization.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  final bool? fromDashboard;
  const AdminHome({ Key? key, this.fromDashboard = false }) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<AdminHomeController>().getBranches(context);
  });
  }
  @override
  Widget build(BuildContext context) {
    var adminHomeController= Provider.of<AdminHomeController>(context);

    var locals = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: 
      
      AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
// const ChagePage().launch(context);
HelpPage().launch(context);
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
     
     
     
      body: 
      
      
      Stack(

        children: [

          Container(
          // 'assets/images/background.jpg', // Replace with your image path
          // fit: BoxFit.cover, 
          color: Colors.white,
          // Cover the entire screen
          width: double.infinity,
          height: double.infinity,
        ),
          Column(children: [


Container(
  height: MediaQuery.of(context).size.height/2,
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
 
 
 
 ,const SizedBox(
  height: 20,
)
,
Expanded(child: 
Container(
  padding: const EdgeInsets.symmetric(
    vertical: 10 , horizontal: 10
  ),
decoration:    BoxDecoration(
    // color: Colors.white,
    boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.20),
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
    ],
) , 
child: Column(
  children: [
     Row(
          children: [
Text('الفروع'  ,style: Theme.of(context).textTheme.titleMedium,)

          ],
    ) ,
    10.height,
            Expanded(
              child: Builder(
                builder: (context) {
                    if ( adminHomeController.isLaoding) {
                    return Center(
                      child: mProgress(context ,
                      
                      fromPage: true
                      )
                    );
                  }
                else   if ( adminHomeController.isError) {
                    return Center(
                      child: Text(adminHomeController.error),
                    );
                  }
                  else {
                    return ListView(
                      children:  
                    //   const [
                    //      BranchWidget(
                    //   branceName: 'فرع البخاري',
                    // address: 'القصيم',
                    // )
                    //   ]
                      
                      adminHomeController.branches!.data
                      !.map((e) =>  BranchWidget(
                      branceName:
                      locals.locale.languageCode=="ar"?
                      
                       e.nameAr: e.nameEn  ,
                    address: e.cityId.toString(),
                    )).toList()
                      
                     

                    );
                  }
                }
              ),
            ),
  ],
),


)
.visible(sharedPrefs.authList.contains('branch'))
)







          ],),
        ],
      ),
   
   
   
   
    );
  }
}