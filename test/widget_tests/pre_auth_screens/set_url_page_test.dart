import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/pre_auth_screens/set_url.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

Widget createSetUrlScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguage>(
            create: (_) => AppLanguage(isTest: true)),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        key: const Key('Root'),
        themeMode: themeMode,
        theme: TalawaTheme.lightTheme,
        home: const SetUrl(
          key: Key('SetUrl'),
          uri: 'null',
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      ),
    );

Widget createSetUrlScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguage>(
            create: (_) => AppLanguage(isTest: true)),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        key: const Key('Root'),
        themeMode: themeMode,
        darkTheme: TalawaTheme.darkTheme,
        home: const SetUrl(
          key: Key('SetUrl'),
          uri: 'null',
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      ),
    );

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const testMockStorage = './test/fixtures/core';
  const channel = MethodChannel(
    'plugins.flutter.io/path_provider',
  );
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return testMockStorage;
  }); //initializing Hive
  final Directory dir = await path.getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());
  //opening Hive Boxes
  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');
  await Hive.openBox('url');
  //setting up MVVM
  setupLocator();
  //initializing test functions
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  //Testing in light mode/normal mode
  group('Select Language Screen Widget Test in light mode', () {
    testWidgets("Testing if Select Language Screen shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the screenScaffold Finder
      final screenScaffoldWidget =
          find.byKey(const Key('SetUrlScreenScaffold'));

      //finding the scaffold
      expect(screenScaffoldWidget, findsOneWidget);
      //testing scaffold color
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
    });

    testWidgets("Testing if icon button shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the logo Finder
      final iconButton = find.byIcon(Icons.qr_code_scanner);

      //finding the logo
      expect(iconButton, findsOneWidget);
      //testing logo size
      expect((tester.firstWidget(iconButton) as Icon).semanticLabel,
          'Join Organisation with QR');

      expect((tester.firstWidget(iconButton) as Icon).size, 30);
    });
    testWidgets("Testing if app logo shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the logo Finder
      final logoWidget = find.byKey(const Key('LogoPainter'));

      //finding the logo
      expect(logoWidget, findsOneWidget);
      //testing logo size
      expect(
          (tester.firstWidget(logoWidget) as CustomPaint).size,
          Size(SizeConfig.screenWidth! * 0.6,
              (SizeConfig.screenWidth! * 0.6).toDouble()));
    });

    testWidgets("Testing if custom rich text shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the custom rich text widget Finder
      final customRichTextWidget = find.byKey(const Key('UrlPageText'));
      //initializing the greeting text
      final greeting = [
        {
          'text': 'Join ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline6!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
        },
        {
          'text': 'and ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
        {
          'text': 'Collaborate ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline6!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
        },
        {
          'text': 'with your ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
        {
          'text': 'Organizations',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5!
              .copyWith(fontSize: 24, color: const Color(0xFF4285F4))
        },
      ];

      //finding the custom rich text widget
      expect(customRichTextWidget, findsOneWidget);

      //testing greeting text
      expect((tester.firstWidget(customRichTextWidget) as CustomRichText).words,
          greeting);
    });
    testWidgets("Testing the Url Input text form field", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the url input field widget Finder
      final urlInputFieldWidget = find.byKey(const Key('UrlInputField'));
      //initializing the text field suffix button widget Finder
      final findVerifyButton = find.byKey(const Key('VerifyButton'));
      //initializing the nullUrlSubmission widget Finder
      final nullErrorUrlSubmission = find.text('Please verify URL first');
      //initializing the invalidUrlSubmission widget Finder
      final invalidUrlSubmission = find.text('Enter a valid URL');

      //finding the url input text field
      expect(urlInputFieldWidget, findsOneWidget);
      //finding the verify suffix button in text form field
      expect(findVerifyButton, findsOneWidget);

      /*//submitting the field with null url
      await tester.tap(findVerifyButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the nullErrorUrlSubmission widget appears
      expect(nullErrorUrlSubmission, findsOneWidget);*/

      //inputting a non url text in the field
      await tester.enterText(urlInputFieldWidget, 'non-url text');
      //submitting the field with non url input
      await tester.tap(findVerifyButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the invalidUrlSubmission widget appears
      expect(invalidUrlSubmission, findsOneWidget);

      //inputting an existing url text in the field
      await tester.enterText(urlInputFieldWidget,
          'https://talawa-graphql-api.herokuapp.com/graphql');
      //submitting the field with a existing url
      await tester.tap(findVerifyButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing nullErrorUrlSubmission is not found
      expect(nullErrorUrlSubmission, findsNothing);
      //testing invalidUrlSubmission is not found
      expect(invalidUrlSubmission, findsNothing);
    });
    testWidgets("Testing change language button", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the change language widget Finder
      final changeLanguageWidget = find.byKey(const Key('ChangeLanguage'));
      //initializing the screen scaffold
      final screenScaffoldWidget =
          find.byKey(const Key('SelectLanguageScreenScaffold'));
      //initializing the center offset of changeLanguageWidget
      final offset = tester.getCenter(changeLanguageWidget);
      //finding the change language widget appears
      expect(changeLanguageWidget, findsOneWidget);

      //taping the change language button
      await tester.tapAt(offset);
      await tester.pumpAndSettle();
      //testing that the scaffold is no more visible
      expect(screenScaffoldWidget, findsNothing);
    });
    testWidgets("Testing if login button works", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the login button Finder
      final loginButtonWidget = find.byKey(const Key('LoginButton'));

      //finding the login button
      expect(loginButtonWidget, findsOneWidget);
      //testing the login button widget
      expect(
        (tester.firstWidget(loginButtonWidget) as RaisedRoundedButton)
            .backgroundColor,
        TalawaTheme.lightTheme.colorScheme.secondaryVariant,
      );
      expect(
        (tester.firstWidget(loginButtonWidget) as RaisedRoundedButton)
            .textColor,
        TalawaTheme
            .lightTheme.inputDecorationTheme.focusedBorder!.borderSide.color,
      );
      expect(
        (tester.firstWidget(loginButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Login',
      );
    });
    testWidgets("Testing if signup button works", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the signup button Finder
      final signupButtonWidget = find.byKey(const Key('SignUpButton'));

      //finding the signup button
      expect(signupButtonWidget, findsOneWidget);
      //testing the signup button widget
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .backgroundColor,
        TalawaTheme
            .lightTheme.inputDecorationTheme.focusedBorder!.borderSide.color,
      );
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .textColor,
        TalawaTheme.lightTheme.colorScheme.secondaryVariant,
      );
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Sign Up',
      );
    });
  });

  //Testing in dark mode
  group('Select Language Screen Widget Test in dark mode', () {
    testWidgets("Testing if Select Language Screen shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      //initializing the screenScaffold Finder
      final screenScaffoldWidget =
          find.byKey(const Key('SetUrlScreenScaffold'));

      //finding the scaffold
      expect(screenScaffoldWidget, findsOneWidget);
      //testing scaffold color
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .darkTheme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
    });

    testWidgets("Testing if icon button shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      //initializing the logo Finder
      final iconButton = find.byIcon(Icons.qr_code_scanner);

      //finding the logo
      expect(iconButton, findsOneWidget);
      //testing logo size
      expect((tester.firstWidget(iconButton) as Icon).semanticLabel,
          'Join Organisation with QR');

      expect((tester.firstWidget(iconButton) as Icon).size, 30);
    });
    testWidgets("Testing if app logo shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      //initializing the logo Finder
      final logoWidget = find.byKey(const Key('LogoPainter'));

      //finding the logo
      expect(logoWidget, findsOneWidget);
      //testing logo size
      expect(
          (tester.firstWidget(logoWidget) as CustomPaint).size,
          Size(SizeConfig.screenWidth! * 0.6,
              (SizeConfig.screenWidth! * 0.6).toDouble()));
    });
    testWidgets("Testing if custom rich text shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      //initializing the custom rich text widget Finder
      final customRichTextWidget = find.byKey(const Key('UrlPageText'));
      //initializing the greeting text
      final greeting = [
        {
          'text': 'Join ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline6!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
        },
        {
          'text': 'and ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
        {
          'text': 'Collaborate ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline6!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
        },
        {
          'text': 'with your ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
        {
          'text': 'Organizations',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5!
              .copyWith(fontSize: 24, color: const Color(0xFF4285F4))
        },
      ];

      //finding the custom rich text widget
      expect(customRichTextWidget, findsOneWidget);

      //testing greeting text
      expect((tester.firstWidget(customRichTextWidget) as CustomRichText).words,
          greeting);
    });
    testWidgets("Testing the Url Input text form field", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      //initializing the url input field widget Finder
      final urlInputFieldWidget = find.byKey(const Key('UrlInputField'));
      //initializing the text field suffix button widget Finder
      final findVerifyButton = find.byKey(const Key('VerifyButton'));
      //initializing the nullUrlSubmission widget Finder
      final nullErrorUrlSubmission = find.text('Please verify URL first');
      //initializing the invalidUrlSubmission widget Finder
      final invalidUrlSubmission = find.text('Enter a valid URL');

      //finding the url input text field
      expect(urlInputFieldWidget, findsOneWidget);
      //finding the verify suffix button in text form field
      expect(findVerifyButton, findsOneWidget);

      /* //submitting the field with null url
      await tester.tap(findVerifyButton);
      await tester.pumpAndSettle();
      //testing the nullErrorUrlSubmission widget appears
      expect(nullErrorUrlSubmission, findsOneWidget);*/

      //inputting a non url text in the field
      await tester.enterText(urlInputFieldWidget, 'non-url text');
      //submitting the field with non url input
      await tester.tap(findVerifyButton);
      await tester.pumpAndSettle();
      //testing the invalidUrlSubmission widget appears
      expect(invalidUrlSubmission, findsOneWidget);

      //inputting an existing url text in the field
      await tester.enterText(urlInputFieldWidget,
          'https://talawa-graphql-api.herokuapp.com/graphql');
      //submitting the field with a existing url
      await tester.tap(findVerifyButton);
      await tester.pumpAndSettle();
      //testing nullErrorUrlSubmission is not found
      expect(nullErrorUrlSubmission, findsNothing);
      //testing invalidUrlSubmission is not found
      expect(invalidUrlSubmission, findsNothing);
    });
    testWidgets("Testing change language button", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      //initializing the change language widget Finder
      final changeLanguageWidget = find.byKey(const Key('ChangeLanguage'));
      //initializing the screen scaffold
      final screenScaffoldWidget =
          find.byKey(const Key('SelectLanguageScreenScaffold'));
      //initializing the center offset of changeLanguageWidget
      final offset = tester.getCenter(changeLanguageWidget);
      //finding the change language widget appears
      expect(changeLanguageWidget, findsOneWidget);

      //taping the change language button
      await tester.tapAt(offset);
      await tester.pumpAndSettle();
      //testing that the scaffold is no more visible
      expect(screenScaffoldWidget, findsNothing);
    });
    testWidgets("Testing if login button works", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      //initializing the login button Finder
      final loginButtonWidget = find.byKey(const Key('LoginButton'));

      //finding the login button
      expect(loginButtonWidget, findsOneWidget);
      //testing the login button widget
      expect(
        (tester.firstWidget(loginButtonWidget) as RaisedRoundedButton)
            .backgroundColor,
        TalawaTheme.darkTheme.colorScheme.secondaryVariant,
      );
      expect(
        (tester.firstWidget(loginButtonWidget) as RaisedRoundedButton)
            .textColor,
        TalawaTheme
            .darkTheme.inputDecorationTheme.focusedBorder!.borderSide.color,
      );
      expect(
        (tester.firstWidget(loginButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Login',
      );
    });
    testWidgets("Testing if signup button works", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      //initializing the signup button Finder
      final signupButtonWidget = find.byKey(const Key('SignUpButton'));

      //finding the signup button
      expect(signupButtonWidget, findsOneWidget);
      //testing the signup button widget
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .backgroundColor,
        TalawaTheme
            .darkTheme.inputDecorationTheme.focusedBorder!.borderSide.color,
      );
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .textColor,
        TalawaTheme.darkTheme.colorScheme.secondaryVariant,
      );
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Sign Up',
      );
    });
  });
}
