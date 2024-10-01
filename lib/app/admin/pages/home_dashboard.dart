import 'package:flutter/material.dart';
import 'package:goodfoods/app/admin/pages/home_new.dart';
import 'package:goodfoods/app/admin/pages/select_area.dart';
import 'package:goodfoods/core/services/firebase_notifications.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key,}): super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_){
     FirebaseService.requrestFirebaseNotificaton();
       });
  }

  
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_){

if (sharedPrefs.isSuper) {
  return const SelectAreaPage();
}else {
  return const HomeNew();
}

    });
  }
}