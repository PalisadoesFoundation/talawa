import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/main.dart' as realmain;
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';

import 'flutter_test_config.dart';
import 'helpers/test_helpers.dart';
import 'helpers/test_locator.dart';

void main() async {
  group('test my app', () {
    // test('test main page', () async {
    //    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
    //       .setMockMethodCallHandler(
    //           const MethodChannel('plugins.flutter.io/path_provider'),
    //           (methodCall) async {
    //     return Directory.systemTemp.path;
    //   });
    //   await realMain.main();
    // });
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();

      testSetupLocator();
      await setUpHive();
    });
    testWidgets('MyApp', (tester) async {
      // await realMain.main();
      getAndRegisterUserConfig();

      when(userConfig.userLoggedIn()).thenAnswer((_) => Future.value(false));
      graphqlConfig.httpLink = HttpLink('test/link');

      await tester.pumpWidget(realmain.MyApp());

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
  });
}
