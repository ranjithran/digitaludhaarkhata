import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }
  Future<dynamic> navigateToWithArguments(String routeName,arguments) {
    print(arguments);
    return navigatorKey.currentState.pushNamed(routeName,arguments: arguments);
  }
  bool goBack() {
    return navigatorKey.currentState.pop();
  }
}