import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class GoodfoodsFirebaseRemoteConfig {
  final remoteConfig = FirebaseRemoteConfig.instance;
GoodfoodsFirebaseRemoteConfig(): _remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initialize() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    // Set configuration
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    // These will be used before the values are fetched from Firebase Remote Config.
    await remoteConfig.setDefaults(const {
      'version': '1.0.0+3',
    });

    // Fetch the values from Firebase Remote Config
    await remoteConfig.fetchAndActivate();
  
    // Optional: listen for and activate changes to the Firebase Remote Config values
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
    });
    

  
  }
  String getString(String key) => _remoteConfig!.getString(key); // NEW
 final FirebaseRemoteConfig? _remoteConfig;



  String getCurrentCompetition() {
    log("PACKAGE INFO  FIREBASE${remoteConfig.getAll()}");
    return remoteConfig.getString('version');
  }

  // Helper methods to simplify using the values in other parts of the code
  String getRequiredMinimumVersion() =>
    remoteConfig.getString('version');

  String getRecommendedMinimumVersion() =>
    remoteConfig.getString('version');
}