import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/asymetric_keys/asymetric_keys.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  WidgetController.hitTestWarningShouldBeFatal = true;
  final Directory dir = await Directory.systemTemp.createTemp('talawa_test');
  Hive.init(dir.path);
  AppConnectivity.isOnline = true;
  // await setUpHive();
  await testMain();
}

Future<void> setUpHive() async {
  final Directory dir = await Directory.systemTemp.createTemp('talawa_test');
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter())
    ..registerAdapter(AsymetricKeysAdapter());

  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');
  await Hive.openBox<AsymetricKeys>('user_keys');
  await Hive.openBox('pluginBox');
  await Hive.openBox('url');
}

Future<void> tearDownHive() async {
  // Close all opened Hive boxes
  await Hive.box<User>('currentUser').close();
  await Hive.box<OrgInfo>('currentOrg').close();
  await Hive.box<AsymetricKeys>('user_keys').close();
  await Hive.box('pluginBox').close();
  await Hive.box('url').close();

  // Close Hive
  await Hive.close();

  // Clean up the temporary directory
  final Directory dir = Directory.systemTemp
      .listSync()
      .firstWhere((dir) => dir.path.contains('talawa_test')) as Directory;
  await dir.delete(recursive: true);
}
