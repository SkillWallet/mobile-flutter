// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacement(MaterialPageRoute pageRoute) {
    return navigatorKey.currentState!.pushReplacement(pageRoute);
  }

  Future<dynamic> navigatePush(MaterialPageRoute pageRoute) {
    return navigatorKey.currentState!.push(pageRoute);
  }

  Future<dynamic> navigatePushWithResult(MaterialPageRoute pageRoute) async {
    return await navigatorKey.currentState!.push(pageRoute);
  }
}
