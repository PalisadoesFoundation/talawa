import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/main_screen.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  call();
}

Widget createMainScreen() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return BaseView<AppTheme>(
        onModelReady: (model) => model.initialize(),
        builder: (context, themeModel, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: [
              const AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            key: const Key('Root'),
            theme: Provider.of<AppTheme>(context, listen: true).isdarkTheme
                ? TalawaTheme.darkTheme
                : TalawaTheme.lightTheme,
            home: MainScreen(
              mainScreenArgs: MainScreenArgs(
                fromSignUp: false,
                mainScreenIndex: 0,
              ),
            ),
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: router.generateRoute,
          );
        },
      );
    },
  );
}

void main() async {
  testSetupLocator();

  TestWidgetsFlutterBinding.ensureInitialized();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  final Directory dir = Directory('temporaryPath');
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());

  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');

  await Hive.openBox('pluginBox');
  await Hive.openBox('url');

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group("Test for main_screen.dart", () {
    testWidgets("Check if MainScreen shows up", (tester) async {
      await tester.pumpWidget(createMainScreen());
      await tester.pumpAndSettle();
      // await tester.pump();

      expect(find.byType(MainScreen), findsOneWidget);
    });
  });
}
