import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/home.dart';
import 'package:goodfoods/app/success/view/widgets/empty_section.dart';
import 'package:goodfoods/app/success/view/widgets/subtitle.dart';
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
            const EmptySection(
              emptyImg: 'assets/images/success.gif',
              emptyMsg: 'Successful !!',
            ),
            const SubTitle(
              subTitleText: 'Your Request  was done successfully',
            ),
                const SizedBox(height: 20,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () {
        
      
        const Home().launch(context, isNewTask: true);
        
                      },
                      child: const Text('OK'))
              
          ],
        ),
      ),
    );
  }
}