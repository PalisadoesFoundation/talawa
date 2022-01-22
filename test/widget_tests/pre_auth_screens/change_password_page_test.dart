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
import 'package:talawa/views/pre_auth_screens/change_password.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../helpers/test_locator.dart';

Widget createChangePassScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
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
          home: const ChangePass(key: Key('ChangePass')),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

Widget createChangePassScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
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
          home: const ChangePass(key: Key('ChangePass')),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();
  group('Change Password Screen Widget Test in light mode', () {
    testWidgets("Testing if Change Password Screen shows up", (tester) async {
      await tester.pumpWidget(createChangePassScreenLight());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('ChangePassScreenScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
    });
    testWidgets("Testing if custom rich text shows up", (tester) async {
      //pushing recover screen
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      //initializing the custom rich text widget Finder
      final customRichTextWidget = find.byKey(
        const Key('ChangePageText'),
      );

      //initializing the greeting text
      final greeting = [
        {
          'text':
              "${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("Hello")}, ",
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
        {
          'text':
              '${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("User Name")} ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline6!
              .copyWith(fontSize: 24)
        },
        {
          'text':
              "${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("we've")} ",
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
        {
          'text':
              '${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("got you covered")} ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
      ];

      //finding the custom rich text widget
      expect(customRichTextWidget, findsOneWidget);

      //testing greeting text
      expect((tester.firstWidget(customRichTextWidget) as CustomRichText).words,
          greeting);
    });
    testWidgets("Testing the Password Input text form field", (tester) async {
      //pushing change pass Screen
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      //initializing the pass input field widget Finder
      final passInputFieldWidget = find.byKey(const Key('PassInputField'));
      //initializing the confirm pass input field widget Finder
      final passConfirmInputFieldWidget =
          find.byKey(const Key('PassRepeatInputField'));
      //initializing the text field suffix button widget Finder
      final findChangePassButton =
          find.byKey(const Key('ChangePasswordButton'));
      //initializing the null pass Submission widget Finder
      final nullPassSubmission = find.text('Password must not be left blank');
      //initializing the invalid password submission widget Finder
      final invalidPassSubmission = find.text(
          'Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)');
      //initializing the invalid password submission widget Finder
      final misMatchPassSubmission =
          find.text('Password does not match original');

      //finding the pass input text field
      expect(passInputFieldWidget, findsOneWidget);
      //finding the confirm pass input text field
      expect(passConfirmInputFieldWidget, findsOneWidget);
      //finding the recover button
      expect(findChangePassButton, findsOneWidget);

      //inputting a invalid pass in the field
      await tester.enterText(passInputFieldWidget, 'nontext');
      //submitting the field with invalid input
      await tester.tap(findChangePassButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the invalidPassSubmission widget appears
      expect(invalidPassSubmission, findsOneWidget);

      //without inputting text in the field
      await tester.enterText(passInputFieldWidget, '');
      //submitting the field with null input
      await tester.tap(findChangePassButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the nullPassSubmission widget appears
      expect(nullPassSubmission, findsOneWidget);

      //not matching confirm pass
      await tester.enterText(passInputFieldWidget, 'Test@123');
      await tester.enterText(passConfirmInputFieldWidget, 'Test@12');
      //submitting the field with mismatch password input
      await tester.tap(findChangePassButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the nullPassSubmission widget appears
      expect(misMatchPassSubmission, findsOneWidget);
    });
  });
  group('Change Password Screen Widget Test in dark mode', () {
    testWidgets("Testing if Change Password Screen shows up", (tester) async {
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();
      // finding scaffold is present
      final screenScaffoldWidget = find.byKey(
        const Key('ChangePassScreenScaffold'),
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
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      //initializing the custom rich text widget Finder
      final customRichTextWidget = find.byKey(
        const Key('ChangePageText'),
      );

      //initializing the greeting text
      final greeting = [
        {
          'text':
              "${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("Hello")}, ",
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
        {
          'text':
              '${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("User Name")} ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline6!
              .copyWith(fontSize: 24)
        },
        {
          'text':
              "${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("we've")} ",
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
        {
          'text':
              '${AppLocalizations.of(navigationService.navigatorKey.currentContext!)!.translate("got you covered")} ',
          'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
              .textTheme
              .headline5
        },
      ];

      //finding the custom rich text widget
      expect(customRichTextWidget, findsOneWidget);

      //testing greeting text
      expect((tester.firstWidget(customRichTextWidget) as CustomRichText).words,
          greeting);
    });
    testWidgets("Testing the Password Input text form field", (tester) async {
      //pushing change pass Screen
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();

      //initializing the pass input field widget Finder
      final passInputFieldWidget = find.byKey(const Key('PassInputField'));
      //initializing the confirm pass input field widget Finder
      final passConfirmInputFieldWidget =
          find.byKey(const Key('PassRepeatInputField'));
      //initializing the text field suffix button widget Finder
      final findRecoverButton = find.byKey(const Key('ChangePasswordButton'));
      //initializing the null pass Submission widget Finder
      final nullPassSubmission = find.text('Password must not be left blank');
      //initializing the invalid password submission widget Finder
      final invalidPassSubmission = find.text(
          'Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)');
      //initializing the invalid password submission widget Finder
      final misMatchPassSubmission =
          find.text('Password does not match original');

      //finding the pass input text field
      expect(passInputFieldWidget, findsOneWidget);
      //finding the confirm pass input text field
      expect(passConfirmInputFieldWidget, findsOneWidget);
      //finding the recover button
      expect(findRecoverButton, findsOneWidget);

      //inputting a invalid pass in the field
      await tester.enterText(passInputFieldWidget, 'nontext');
      //submitting the field with invalid input
      await tester.tap(findRecoverButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the invalidPassSubmission widget appears
      expect(invalidPassSubmission, findsOneWidget);

      //without inputting text in the field
      await tester.enterText(passInputFieldWidget, '');
      //submitting the field with null input
      await tester.tap(findRecoverButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the nullPassSubmission widget appears
      expect(nullPassSubmission, findsOneWidget);

      //not matching confirm pass
      await tester.enterText(passInputFieldWidget, 'Test@123');
      await tester.enterText(passConfirmInputFieldWidget, 'Test@12');
      //submitting the field with mismatch password input
      await tester.tap(findRecoverButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the nullPassSubmission widget appears
      expect(misMatchPassSubmission, findsOneWidget);
    });
  });
}
