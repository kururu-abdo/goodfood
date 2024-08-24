import 'dart:developer';

import 'package:package_info_plus/package_info_plus.dart';

class GoodfoodsPackageInfo {
  late String version;

  Future<void> initialize() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    log("PACKAGE INFO PACKGE ${packageInfo.version}\+${packageInfo.buildNumber}");
    version = packageInfo.version;
  }

   Future<String> getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;


    return "${packageInfo.version}\+${packageInfo.buildNumber}";
  }
}