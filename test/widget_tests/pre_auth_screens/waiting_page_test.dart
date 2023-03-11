// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart' as path;
import 'package:talawa/constants/custom_theme.dart';
// import 'package:talawa/models/organization/org_info.dart';
// import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/pre_auth_screens/waiting_to_join_private_org.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createWaitingScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
    MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      key: const Key('Root'),
      themeMode: themeMode,
      theme: TalawaTheme.lightTheme,
      home: const WaitingPage(key: Key('WaitingPage')),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
    );

Widget createWaitingScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
    MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      key: const Key('Root'),
      themeMode: themeMode,
      theme: TalawaTheme.darkTheme,
      home: const WaitingPage(key: Key('WaitingPage')),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
    );

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // const testMockStorage = './test/fixtures/core';
  // const channel = MethodChannel(
  //   'plugins.flutter.io/path_provider',
  // );
  // channel.setMockMethodCallHandler((MethodCall methodCall) async {
  //   return testMockStorage;
  // }); //initializing Hive
  // final Directory dir = await path.getApplicationDocumentsDirectory();
  // Hive
  //   ..init(dir.path)
  //   ..registerAdapter(UserAdapter())
  //   ..registerAdapter(OrgInfoAdapter());
  // // opening Hive Boxes
  // await Hive.openBox<User>('currentUser');
  // await Hive.openBox<OrgInfo>('currentOrg');
  // await Hive.openBox('url');
  setUp(() {
    registerServices();
    registerViewModels();
    locator<SizeConfig>().test();
  });
  tearDown(() {
    unregisterServices();
    unregisterViewModels();
  });

  group('Waiting Screen Widget Test in light mode', () {
    testWidgets("Testing if Select Language Screen shows up", (tester) async {
      await tester.pumpWidget(createWaitingScreenLight());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('WaitingPageScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
    });
  });
  group('Waiting Screen Widget Test in dark mode', () {
    testWidgets("Testing if Select Language Screen shows up", (tester) async {
      await tester.pumpWidget(createWaitingScreenDark());
      await tester.pumpAndSettle();
      // finding scaffold is present
      final screenScaffoldWidget = find.byKey(
        const Key('WaitingPageScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
    });
  });
  group('Testing for greeting text', () {
    testWidgets("Testing if greeting text shows up", (tester) async {
      await tester.pumpWidget(createWaitingScreenLight());
      await tester.pumpAndSettle();
      //initializing the custom rich text widget Finder
      final customRichTextWidget = find.byKey(
        const Key('WaitingPageText'),
      );

      //initializing the greeting text
      final greeting = [
        {
          'text': "Please wait",
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall
        },
        {
          'text': " Test ",
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 24)
        },
        {
          'text': "for organisation(s) to accept your invitation.",
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall
        },
      ];

      //finding the custom rich text widget
      expect(customRichTextWidget, findsOneWidget);

      //testing greeting text
      expect(
        (tester.firstWidget(customRichTextWidget) as CustomRichText).words,
        greeting,
      );
    });
  });
  group('Testing for pending request list', () {
    testWidgets("Testing pending membership request list", (tester) async {
      await tester.pumpWidget(createWaitingScreenLight());
      await tester.pumpAndSettle();
      //initializing the custom rich text widget Finder
      final pendingRequestList = find.byKey(
        const Key('PendingRequestList'),
      );
      //initializing the custom rich text widget Finder
      final pendingItem = find.byKey(
        const Key('WaitingJoin'),
      );

      //finding the custom rich text widget
      expect(pendingRequestList, findsOneWidget);

      //testing greeting text
      expect(pendingItem, findsNWidgets(2));
      await tester.tap(pendingRequestList);
      await tester.pumpAndSettle();
    });
  });
  group('Testing for join org button', () {
    testWidgets("Testing Join org button", (tester) async {
      await tester.pumpWidget(createWaitingScreenLight());
      await tester.pumpAndSettle();
      //initializing the join org button widget Finder
      final joinOrgButton = find.byKey(
        const Key('JoinOrg'),
      );

      //finding the join org button widget
      expect(joinOrgButton, findsOneWidget);

      //testing greeting text
      final RaisedRoundedButton joinButton =
          tester.firstWidget(joinOrgButton) as RaisedRoundedButton;
      await tester.pump(const Duration(milliseconds: 100));
      expect(joinButton.buttonLabel, "Join Organisation");
    });
  });
}
