import 'package:flutter/material.dart';
import 'package:talawa/services/navigation_service.dart';

import '../locator.dart';

class SnackBarService {
  final _navigationService = locator<NavigationService>();

  void showSnackBar(String message,
      {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(_navigationService.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(duration: duration, content: Text(message)));
  }
}
