// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

Future<Box> setUpUserInfoHive() async {
  Hive
    ..init("./temporaryPath")
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());

  final userBox = await Hive.openBox('userInfo');
  return userBox;
}

Future<Box> setUpURLHive() async {
  Hive.init('test/fixtures/core');
  final urlBox = await Hive.openBox('url');
  return urlBox;
}

Future<Box> setUpCurrentUserHive() async {
  Hive
    ..init('test/fixtures/core')
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());
  final user = await Hive.openBox<User>('currentUser');
  return user;
}
