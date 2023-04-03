// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
// import 'package:path_provider/path_provider.dart' as path;
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/pre_auth_screens/set_url.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../helpers/test_helpers.dart';

Widget createSetUrlScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguage>(
          create: (_) => AppLanguage(isTest: true),
        ),
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
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: router.generateRoute,
      ),
    );

Widget createSetUrlScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguage>(
          create: (_) => AppLanguage(isTest: true),
        ),
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
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: router.generateRoute,
      ),
    );

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const testMockStorage = 'test/fixtures/core';
  Hive
    ..init(testMockStorage)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());
  //opening Hive Boxes
  // await Hive.openBox<User>('currentUser');
  // await Hive.openBox<OrgInfo>('currentOrg');
  await Hive.openBox('url');
  //setting up MVVM
  setupLocator();
  //initializing test functions
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();
  setUp(() async {
    registerServices();
  });

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
      expect(
        (tester.firstWidget(iconButton) as Icon).semanticLabel,
        'Join Organisation with QR',
      );

      expect((tester.firstWidget(iconButton) as Icon).size, 30);
      await tester.tap(iconButton);
      await tester.pumpAndSettle();
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
        Size(
          SizeConfig.screenWidth! * 0.6,
          SizeConfig.screenWidth! * 0.6,
        ),
      );
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
              .titleLarge!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
        },
        {
          'text': 'and ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall
        },
        {
          'text': 'Collaborate ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
        },
        {
          'text': 'with your ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall
        },
        {
          'text': 'Organizations',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 24, color: const Color(0xFF4285F4))
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
      await tester.enterText(
        urlInputFieldWidget,
        'https://<org_url_here>/graphql',
      );
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
      await tester.tap(changeLanguageWidget, warnIfMissed: false);
      await tester.pumpAndSettle();
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
        TalawaTheme.lightTheme.colorScheme.secondaryContainer,
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
      await tester.tap(loginButtonWidget);
      await tester.pumpAndSettle();
    });

    testWidgets("Check navigation to Login page when Login button is pressed.",
        (tester) async {
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pump();
      expect(find.byKey(const Key('SetUrlScreenScaffold')), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key('UrlInputField')),
        'https://<org_url_here>/graphql',
      );
      await tester.tap(find.byKey(const Key('LoginButton')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('UrlPageText')), findsOneWidget);
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
        TalawaTheme.lightTheme.colorScheme.secondaryContainer,
      );
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Sign Up',
      );
      await tester.tap(signupButtonWidget, warnIfMissed: false);
      await tester.pumpAndSettle();
    });
    testWidgets(
        "Testing onFieldSubmitted in TextFormField by simulating keyboard hits",
        (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      final formFinder = find.ancestor(
        of: find.byKey(const Key('UrlInputField')),
        matching: find.byType(Form),
      );
      final formWidget = tester.firstWidget(formFinder) as Form;
      (formWidget.key! as GlobalKey<FormState>).currentState!.save();

      final textFinder = find.byKey(const Key('UrlInputField'));
      await tester.tap(textFinder);
      await tester.pump();
      await tester.showKeyboard(textFinder);
      await tester.testTextInput.receiveAction(TextInputAction.done);
    });
    testWidgets("Testing onTap in sign up button", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      final btnFinder = find.byKey(const Key('SignUpButton'));

      await tester.dragUntilVisible(
        btnFinder.first,
        find.byType(SingleChildScrollView).first,
        const Offset(100, 0),
      );
      await tester.tap(btnFinder.first);
      await tester.pump();
    });
    testWidgets("Testing onTap in Change Language Gesture Detector",
        (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenLight());
      await tester.pumpAndSettle();

      final gestureDetectorFinder = find.byKey(const Key('ChangeLanguage'));

      await tester.dragUntilVisible(
        gestureDetectorFinder.first,
        find.byType(SingleChildScrollView).first,
        const Offset(100, 0),
      );

      final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

      when(navigationService.navigatorKey).thenAnswer((_) => navigator);
      when(navigationService.pop()).thenAnswer((_) async => 1);

      await tester.tap(gestureDetectorFinder.first);
      await tester.pump();

      verify(navigationService.pop());
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
      expect(
        (tester.firstWidget(iconButton) as Icon).semanticLabel,
        'Join Organisation with QR',
      );

      expect((tester.firstWidget(iconButton) as Icon).size, 30);
      await tester.tap(iconButton);
      await tester.pumpAndSettle();
    });
    testWidgets("Check if QR button works", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      final iconButton = find.byIcon(Icons.qr_code_scanner);

      // tapping the qr button
      await tester.tap(iconButton);
      await tester.pumpAndSettle();

      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(QRView), findsOneWidget);
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
        Size(
          SizeConfig.screenWidth! * 0.6,
          SizeConfig.screenWidth! * 0.6,
        ),
      );
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
              .titleLarge!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
        },
        {
          'text': 'and ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall
        },
        {
          'text': 'Collaborate ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
        },
        {
          'text': 'with your ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall
        },
        {
          'text': 'Organizations',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 24, color: const Color(0xFF4285F4))
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
      await tester.enterText(
        urlInputFieldWidget,
        'https://<org_url_here>/graphql',
      );
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
      await tester.tap(changeLanguageWidget, warnIfMissed: false);
      await tester.pumpAndSettle();
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
        TalawaTheme.darkTheme.colorScheme.secondaryContainer,
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
      await tester.tap(loginButtonWidget);
      await tester.pumpAndSettle();
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
        TalawaTheme.darkTheme.colorScheme.secondaryContainer,
      );
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Sign Up',
      );
      await tester.tap(signupButtonWidget, warnIfMissed: false);
      await tester.pumpAndSettle();
    });
    testWidgets(
        "Testing onFieldSubmitted in TextFormField by simulating keyboard hits",
        (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      final formFinder = find.ancestor(
        of: find.byKey(const Key('UrlInputField')),
        matching: find.byType(Form),
      );
      final formWidget = tester.firstWidget(formFinder) as Form;
      (formWidget.key! as GlobalKey<FormState>).currentState!.save();

      final textFinder = find.byKey(const Key('UrlInputField'));
      await tester.tap(textFinder);
      await tester.pump();
      await tester.showKeyboard(textFinder);
      await tester.testTextInput.receiveAction(TextInputAction.done);
    });
    testWidgets("Testing onTap in sign up button", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      final btnFinder = find.byKey(const Key('SignUpButton'));

      await tester.dragUntilVisible(
        btnFinder.first,
        find.byType(SingleChildScrollView).first,
        const Offset(100, 0),
      );
      await tester.tap(btnFinder.first);
      await tester.pump();
    });
    testWidgets("Testing onTap in Change Language Gesture Detector",
        (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createSetUrlScreenDark());
      await tester.pumpAndSettle();

      final gestureDetectorFinder = find.byKey(const Key('ChangeLanguage'));

      await tester.dragUntilVisible(
        gestureDetectorFinder.first,
        find.byType(SingleChildScrollView).first,
        const Offset(100, 0),
      );

      final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

      when(navigationService.navigatorKey).thenAnswer((_) => navigator);
      when(navigationService.pop()).thenAnswer((_) async => 1);

      await tester.tap(gestureDetectorFinder.first);
      await tester.pump();

      verify(navigationService.pop());
    });
  });
}
