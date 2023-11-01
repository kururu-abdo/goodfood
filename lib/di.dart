import 'package:get_it/get_it.dart';
import 'package:goodfoods/app/documents/controllers/document_controller.dart';
import 'package:goodfoods/app/help/controller/help_controller.dart';
import 'package:goodfoods/app/managment_orders/controllers/requests_controller.dart';
import 'package:goodfoods/app/notifications/controllers/notification_controller.dart';
import 'package:goodfoods/app/report/controllers/report_controller.dart';
import 'package:goodfoods/core/controllers/admin_home_controller.dart';
import 'package:goodfoods/core/controllers/auth_controller.dart';
import 'package:goodfoods/core/controllers/chat_controller.dart';
import 'package:goodfoods/core/controllers/maintenance_controller.dart';
import 'package:goodfoods/core/controllers/splash_controller.dart';

final sl = GetIt.instance;
Future<void> init() async {

  // Core


    // Repository


      // Provider
  sl.registerFactory(() => AuthController());
  sl.registerFactory(() => ChatController());
  sl.registerFactory(() => SplashController());
  sl.registerFactory(() => AdminHomeController());
  sl.registerFactory(() => MaintenanceController());
    sl.registerFactory(() => NotificationController());
    sl.registerFactory(() => ReportController());
    sl.registerFactory(() => RequestController());
    sl.registerFactory(() => DocumentController());
    sl.registerFactory(() => HelpController());


 // External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => Dio());
  // sl.registerLazySingleton(() => LoggingInterceptor());
  // sl.registerLazySingleton(() => Connectivity());

}