import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/home_dashboard.dart';
import 'package:goodfoods/app/success/view/widgets/empty_section.dart';
import 'package:goodfoods/app/success/view/widgets/subtitle.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             EmptySection(
              emptyImg: 'assets/images/success.gif',
              emptyMsg: 
              
                currentLang(context)=="ar"?
                "نجحت العملية":
              'Successful !!',
            ),
             SubTitle(
              subTitleText: 
              
              currentLang(context)=="ar"?
              "تم ارسال الطلب بنجاح":
              'Your Request  was done successfully',
            ),
                const SizedBox(height: 20,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {
        
      
        const  HomeDashboard().launch(context, isNewTask: true);
        
                      },
                      child:  Text(
                        
                        currentLang(context)=="ar"?
                        "الرجوع إلى الشاشة الرئيسية":
                        'Go to Home'))
              
          ],
        ),
      ),
    );
  }
}