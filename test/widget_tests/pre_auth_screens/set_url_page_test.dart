import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/pre_auth_screens/set_url.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../helpers/test_helpers.dart';

/// Returns the SetUrlScreen widget.
///
/// **params**:
/// * `themeMode`: ThemeMode of the app.
/// * `theme`: ThemeData of the app.
///
/// **returns**:
/// * `Widget`: SetUrlScreen widget.
Widget createSetUrlScreen({
  ThemeMode themeMode = ThemeMode.light,
  ThemeData? theme,
}) =>
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
        theme: theme ?? TalawaTheme.lightTheme,
        darkTheme: TalawaTheme.darkTheme,
        home: const SetUrl(
          key: Key('SetUrl'),
        ),
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: router.generateRoute,
      ),
    );

Future<void> main() async {
  //opening Hive Boxes
  // await Hive.openBox<User>('currentUser');
  // await Hive.openBox<OrgInfo>('currentOrg');
  //setting up MVVM
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    registerServices();

    //initializing test functions
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
  });
  setUp(() {
    dotenv.loadFromString(envString: '''API_URL=http://<IPv4>:4000/graphql''');
  });

  //Testing in light mode/normal mode
  group('Select Language Screen Widget Test in light mode', () {
    testWidgets("Testing if Select Language Screen shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
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

    testWidgets("Testing if app logo shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
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
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();

      //initializing the custom rich text widget Finder
      final customRichTextWidget = find.byKey(const Key('UrlPageText'));
      //initializing the greeting text
      final greeting = [
        {
          'text': 'Join',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
        },
        {
          'text': ' ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': 'and',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': ' ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': 'Collaborate',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
        },
        {
          'text': ' ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': 'with your',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': ' ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': 'Organizations',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 24, color: const Color(0xFF4285F4)),
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
    testWidgets("Testing change language button", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
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
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();

      //initializing the login button Finder
      final loginButtonWidget = find.byKey(const Key('LoginButton'));

      //finding the login button
      expect(loginButtonWidget, findsOneWidget);

      expect(
        (tester.firstWidget(loginButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Login',
      );
      await tester.ensureVisible(loginButtonWidget);
      await tester.tap(loginButtonWidget);
      await tester.pumpAndSettle();
    });

    testWidgets("Check navigation to Login page when Login button is pressed.",
        (tester) async {
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pump();
      expect(find.byKey(const Key('SetUrlScreenScaffold')), findsOneWidget);

      final finder = find.byKey(const Key('LoginButton'));
      await tester.ensureVisible(finder);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('UrlPageText')), findsOneWidget);
    });
    testWidgets("Testing if signup button works", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();

      //initializing the signup button Finder
      final signupButtonWidget = find.byKey(const Key('SignUpButton'));

      //finding the signup button
      expect(signupButtonWidget, findsOneWidget);
      //testing the signup button widget
      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Sign Up',
      );
      await tester.tap(signupButtonWidget, warnIfMissed: false);
      await tester.pumpAndSettle();
    });
    testWidgets("Testing onTap in sign up button", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
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
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();

      final gestureDetectorFinder = find.byKey(const Key('ChangeLanguage'));

      await tester.dragUntilVisible(
        gestureDetectorFinder.first,
        find.byType(SingleChildScrollView).first,
        const Offset(100, 0),
      );

      await tester.tap(gestureDetectorFinder.first);
      await tester.pump();

      verify(navigationService.pushScreen('/selectLang', arguments: null));
    });
  });

  //Testing in dark mode
  group('Select Language Screen Widget Test in dark mode', () {
    testWidgets("Testing if Select Language Screen shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
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

    testWidgets("Testing if app logo shows up", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
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
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      //initializing the custom rich text widget Finder
      final customRichTextWidget = find.byKey(const Key('UrlPageText'));
      //initializing the greeting text
      final greeting = [
        {
          'text': 'Join',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
        },
        {
          'text': ' ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': 'and',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': ' ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': 'Collaborate',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
        },
        {
          'text': ' ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': 'with your',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': ' ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall,
        },
        {
          'text': 'Organizations',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 24, color: const Color(0xFF4285F4)),
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
    testWidgets("Testing change language button", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
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
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      //initializing the login button Finder
      final loginButtonWidget = find.byKey(const Key('LoginButton'));

      //finding the login button
      expect(loginButtonWidget, findsOneWidget);
      //testing the login button widget
      expect(
        (tester.firstWidget(loginButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Login',
      );

      await tester.ensureVisible(loginButtonWidget);
      await tester.tap(loginButtonWidget);
      await tester.pumpAndSettle();
    });
    testWidgets("Testing if signup button works", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      //initializing the signup button Finder
      final signupButtonWidget = find.byKey(const Key('SignUpButton'));

      //finding the signup button
      expect(signupButtonWidget, findsOneWidget);

      expect(
        (tester.firstWidget(signupButtonWidget) as RaisedRoundedButton)
            .buttonLabel,
        'Sign Up',
      );
      await tester.tap(signupButtonWidget, warnIfMissed: false);
      await tester.pumpAndSettle();
    });
    testWidgets("Testing onTap in sign up button", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
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
      await tester.pumpWidget(
        createSetUrlScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final gestureDetectorFinder = find.byKey(const Key('ChangeLanguage'));

      await tester.dragUntilVisible(
        gestureDetectorFinder.first,
        find.byType(SingleChildScrollView).first,
        const Offset(100, 0),
      );

      await tester.tap(gestureDetectorFinder.first);
      await tester.pump();

      verify(navigationService.pushScreen('/selectLang', arguments: null));
    });
  });
}
