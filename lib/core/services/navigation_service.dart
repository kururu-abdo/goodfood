import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

final NavigationService navService = NavigationService();

class NavigationService<T, U> {
  // static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<Future<T?>> pushNamed(String routeName, {Object? args}) async =>
      navigatorKey.currentState!.pushNamed<T>(
        routeName,
        arguments: args,
      );

  Future<Future<T?>> push(Route<T> route) async =>
      navigatorKey.currentState!.push<T>(route);

  Future<T?> pushReplacementNamed(String routeName, {Object? args}) async =>
      navigatorKey.currentState!.pushReplacementNamed<T, U>(
        routeName,
        arguments: args,
      );

  Future<T?> pushNamedAndRemoveUntil(
    String routeName, {
    Object? args,
    bool keepPreviousPages = false,
  }) async =>
      navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
        routeName,
        (Route<dynamic> route) => keepPreviousPages,
        arguments: args,
      );

  Future<T?> pushAndRemoveUntil(
    Route<T> route, {
    bool keepPreviousPages = false,
  }) async =>
      navigatorKey.currentState!.pushAndRemoveUntil<T>(
        route,
        (Route<dynamic> route) => keepPreviousPages,
      );

  Future<bool> maybePop([Object? args]) async =>
      navigatorKey.currentState!.maybePop<Object>(args);

  bool canPop() => navigatorKey.currentState!.canPop();

  void goBack({T? result}) => navigatorKey.currentState!.pop<T>(result);
}
