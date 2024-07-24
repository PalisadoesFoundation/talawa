import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/main.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';

import 'helpers/test_helpers.dart';
import 'helpers/test_locator.dart';

void main() async {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    testSetupLocator();

    getAndRegisterUserConfig();

    final Directory dir = Directory('test/fixtures/core');

    Hive
      ..init(dir.path)
      ..registerAdapter(UserAdapter())
      ..registerAdapter(OrgInfoAdapter());
    await Hive.openBox<User>('currentUser');
    await Hive.openBox<OrgInfo>('currentOrg');
    await Hive.openBox('pluginBox');
    await Hive.openBox('url');
  });

  testWidgets('MyApp', (tester) async {
    when(userConfig.userLoggedIn()).thenAnswer((_) => Future.value(false));
    graphqlConfig.httpLink = HttpLink('test/link');

    await tester.pumpWidget(MyApp());

    final model = locator<AppTheme>();

    model.initialize();

    expect(find.byType(BaseView<AppLanguage>), findsOne);
    expect(find.byType(BaseView<AppConnectivity>), findsOne);
    expect(find.byType(BaseView<AppTheme>), findsOne);
    expect(find.byType(MaterialApp), findsOne);

    model.switchTheme(isOn: false);

    await tester.pumpAndSettle();

    expect(model.isdarkTheme, false);
  });
}
