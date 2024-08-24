import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/home_new.dart';
import 'package:goodfoods/app/admin/pages/settings_page.dart';
import 'package:goodfoods/core/presentation/notifications_page.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';

class Dashboard extends StatefulWidget {
  final bool? isLauchByNotificaion;
  const Dashboard({ Key? key , this.isLauchByNotificaion }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

    int _currentTab =0;



@override
void initState() { 
  super.initState();

  // if (widget.isLauchByNotificaion??false) {
  //    NotificationApi.initMessage();
  // }
}
  @override
  Widget build(BuildContext context) {

    List screens = [
      // const Home(),
      const HomeNew(),
      // const StatsPage(),
      const NotificationPage(
        fromDashboard: true,
      ),
      const AdminSettings(
        fromDashboard: true,
      )
    ];
    return Scaffold(
      extendBody: true,
      body: screens[_currentTab],





bottomNavigationBar: 

      
       AnimatedContainer(
         duration: const Duration(milliseconds: 100),
        height: 60,
         width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        // width: 400,
        decoration: BoxDecoration(
          color: 
          
          _currentTab==0?
          Colors.white.withOpacity(.10):
          Theme.of(context).primaryColor.withOpacity(.60) ,
          borderRadius: BorderRadius.circular(50)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        
        
            MaterialButton(onPressed: (){
        _currentTab=0;
         
         setState(() {
        
        });
            } ,  
            child:   ImageIcon(
        const AssetImage('assets/icons/home.png'),
         size:25 ,  
            
            color: 
            _currentTab ==0? 
            
            // Colors.white
            Theme.of(context).primaryColor
            :Colors.black
        
            ,),
            
            )
          
          
          ,
        
        
        
        //       MaterialButton(onPressed: (){
        //  _currentTab=1;
        // setState(() {
        
        // });
        
         
        //       } ,  
        //       child:  ImageIcon(
        //   const AssetImage('assets/icons/stats.png')
        // ,
        //   size:25 ,  
            
        //       color:  _currentTab ==1? 
        //     Theme.of(context).primaryColor
        //       :Colors.grey
        
        
        
        
        //       ),
            
        //       )
        
        
        
        
        
         MaterialButton(onPressed: (){
         _currentTab=1;
        // sharedPrefs.notificationCount=0;
        setState(() {
        
        });
         
            } ,  
            child:  Builder(
              builder: (context) {
                if (sharedPrefs.notificationCount>0) {
              return 
              
                  SizedBox(
                    height: 50,
                    width: 40,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                    
                    ImageIcon(
                          const AssetImage('assets/icons/bell.png')
                          ,
                          size:25 ,  
                                    
                                    color:  _currentTab ==1? 
                            
                            //  Colors.white

                                        Theme.of(context).primaryColor

                                    :Colors.black
                            
                            // Theme.of(context).primaryColor
                            //   :Colors.grey
                          
                          
                          
                          
                                    ), 
                    
                                    Positioned(
                    
                    top: 0,
                    right: 0,
                    child: 
                                    Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red 
                    ),
                    child: Center(
                      child: Text(sharedPrefs.notificationCount.toString() ,
                      
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 12
                      ),
                      ),
                    ),
                                    )
                                    
                                    )
                    
                    ],),
                  );
               
               
                }
                return ImageIcon(
                        const AssetImage('assets/icons/bell.png')
                        ,
                        size:25 ,  
                
                color:  _currentTab ==1? 
                          
                          //  Colors.white
                                      Theme.of(context).primaryColor

                :Colors.black
                          
                          // Theme.of(context).primaryColor
                          //   :Colors.grey
                        
                        
                        
                        
                );
              }
            ),
            
            )
        
        
        
        ,
        
        
        
            MaterialButton(onPressed: (){
         _currentTab=2;
        
        setState(() {
        
        });
        
            } ,  
            child:  ImageIcon(
        const AssetImage('assets/icons/settings.png')
        ,
        size:25 ,  
            
            color:  _currentTab ==2? 
         Colors.white
            :Colors.black
        
        
        
            ),
            
            )
        
        
        
        
          ],
        ),
      ),
    




// floatingActionButton: const FloatingActionButton(
  
//             backgroundColor: Theme.of(context).primaryColor,

//   onPressed: 


// (){} , 

// child: Center(
//   child:  MaterialButton(onPressed: (){

//       } ,  
//       child:  Icon(Icons.home , color: Theme.of(context).colorScheme.onErrorContainer,),
      
//       ),
// ),
// ), 

// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


// bottomNavigationBar: BottomAppBar(
//   shape: const CircularNotchedRectangle() ,
// // color: Colors.purple,
//   notchMargin: 10,
//   child: SizedBox(
//     // color: Colors.grey,
//     height: 60 ,
//     child:  Row(
      
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [

//       MaterialButton(onPressed: (){
//  _currentTab =0;
//  setState(() {
   
//  });
//       } ,  
//       child:   ImageIcon(
//         const AssetImage('assets/icons/home.png'),
//          size:25 ,  
      
//       color: _currentTab ==0? Theme.of(context).primaryColor:Colors.grey

//       ,),
      
//       )
    
    
//     ,
    
//       MaterialButton(onPressed: (){
//  _currentTab =1;
//  setState(() {
   
//  });
//       } ,  
//       child:  ImageIcon(
//         const AssetImage('assets/icons/office.png')
// ,
//   size:25 ,  
      
//       color: _currentTab ==1? Theme.of(context).primaryColor:Colors.grey




//       ),
      
//       )
//     ,
    
//       MaterialButton(onPressed: (){
//  _currentTab =2;
//  setState(() {
   
//  });
//       } ,  
//       child:  ImageIcon(
//         const AssetImage('assets/icons/report.png'),
//   size:25 ,  
      
//       color: _currentTab ==2? Theme.of(context).primaryColor:Colors.grey



//       ),
      
//       )
//     ,
    
//       MaterialButton(onPressed: (){
//  _currentTab =3;
//  setState(() {
   
//  });
//       } ,  
//       child: ImageIcon(
//         const AssetImage('assets/icons/settings.png'),
//   size:25 ,  
      
//       color: _currentTab ==3? Theme.of(context).primaryColor:Colors.grey



//       ),
//       )
      
//     ],),
//   ),

// ),
 


      
    );
  }
}