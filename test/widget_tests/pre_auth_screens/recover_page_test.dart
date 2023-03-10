// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/pre_auth_screens/recover.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../helpers/test_locator.dart';

Widget createRecoverScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: TalawaTheme.lightTheme,
          home: const Recover(key: Key('Recover')),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

Widget createRecoverScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: TalawaTheme.darkTheme,
          home: const Recover(key: Key('Recover')),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();
  group('Select Language Screen Widget Test in light mode', () {
    testWidgets("Testing if Select Language Screen shows up", (tester) async {
      await tester.pumpWidget(createRecoverScreenLight());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('RecoverScreenScaffold'),
      );
      final iconButton = find.byIcon(Icons.arrow_back);
      expect(screenScaffoldWidget, findsOneWidget);
      expect(iconButton, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
      await tester.tap(iconButton);
      await tester.pumpAndSettle();
    });
  });
  group('Select Language Screen Widget Test in dark mode', () {
    testWidgets("Testing if Select Language Screen shows up", (tester) async {
      await tester.pumpWidget(createRecoverScreenDark());
      await tester.pumpAndSettle();
      // finding scaffold is present
      final screenScaffoldWidget = find.byKey(
        const Key('RecoverScreenScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
    });
    testWidgets("Testing if custom rich text shows up", (tester) async {
      //pushing recover screen
      await tester.pumpWidget(createRecoverScreenDark());
      await tester.pumpAndSettle();

      //initializing the custom rich text widget Finder
      final customRichTextWidget = find.byKey(
        const Key('RecoverPageText'),
      );

      //initializing the greeting text
      final greeting = [
        {
          'text':
              "${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("Sit back relax, we'll")} ",
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headlineSmall
        },
        {
          'text':
              '${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("Recover")} ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 24)
        },
        {
          'text': AppLocalizations.of(
            navigationService.navigatorKey.currentContext!,
          )!
              .translate("your password"),
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
    testWidgets("Testing the email Input text form field", (tester) async {
      //pushing setUrlScreen
      await tester.pumpWidget(createRecoverScreenDark());
      await tester.pumpAndSettle();

      //initializing the url input field widget Finder
      final emailInputFieldWidget = find.byKey(const Key('EmailInputField'));
      //initializing the text field suffix button widget Finder
      final findRecoverButton = find.byKey(const Key('RecoverButton'));
      //initializing the nullUrlSubmission widget Finder
      final nullEmailSubmission = find.text('Email must not be left blank');
      //initializing the invalidUrlSubmission widget Finder
      final invalidEmailSubmission =
          find.text('Please enter a valid Email Address');

      //finding the url input text field
      expect(emailInputFieldWidget, findsOneWidget);
      //finding the recover button
      expect(findRecoverButton, findsOneWidget);

      //inputting a non email text in the field
      await tester.enterText(emailInputFieldWidget, 'non-url text');
      //submitting the field with non url input
      await tester.tap(findRecoverButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the invalidUrlSubmission widget appears
      expect(invalidEmailSubmission, findsOneWidget);

      //without inputting text in the field
      await tester.enterText(emailInputFieldWidget, '');
      //submitting the field with non url input
      await tester.tap(findRecoverButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the nullEmailSubmission widget appears
      expect(nullEmailSubmission, findsOneWidget);
    });
  });
}
