import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/hive_manager.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  WidgetController.hitTestWarningShouldBeFatal = true;
  final Directory dir = await Directory.systemTemp.createTemp('talawa_test');
  // Hive.init(dir.path);
  await HiveManager.initializeHive(dir: dir);
  AppConnectivity.isOnline = true;
  // await setUpHive();
  await testMain();
}
