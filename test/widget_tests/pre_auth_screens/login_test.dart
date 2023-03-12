// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
// import 'package:talawa/views/main_screen.dart';
import 'package:talawa/views/pre_auth_screens/login.dart';
import 'package:talawa/views/pre_auth_screens/recover.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../helpers/test_locator.dart';

Widget createApp() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: TextButton(
      onPressed: () async {
        await navigationService.pushScreen('/login');
      },
      child: const Text('ravidi'),
    ),
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
  );
}

Future<void> showLoginScreen(WidgetTester tester) async {
  await tester.pumpWidget(createApp());
  await tester.pump();
  await tester.tap(find.textContaining('ravidi'));
  await tester.pumpAndSettle();
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  group('Test for Login screen', () {
    testWidgets('Check if Login screen shows up', (tester) async {
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.byType(Login), findsNothing);

      await tester.tap(find.textContaining('ravidi'));
      await tester.pumpAndSettle();

      expect(find.byType(Login), findsOneWidget);
    });

    testWidgets('Check if back button works', (tester) async {
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.byType(Login), findsNothing);

      await tester.tap(find.textContaining('ravidi'));
      await tester.pumpAndSettle();

      expect(find.byType(Login), findsOneWidget);

      await tester.tap(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(IconButton),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Login), findsNothing);
    });

    testWidgets('Check if all widgets are present', (tester) async {
      await showLoginScreen(tester);

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(CustomRichText), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(RaisedRoundedButton), findsOneWidget);
    });

    testWidgets('Check if all texts show up properly', (tester) async {
      await showLoginScreen(tester);

      // expect(find.text("We're Glad you're Back "), findsOneWidget);
      expect(
        find.textContaining("Enter your registered Email"),
        findsOneWidget,
      );
      expect(find.textContaining("Enter your password"), findsOneWidget);
      expect(find.textContaining("Forgot password"), findsOneWidget);
    });

    testWidgets("Testing the email Input text form field", (tester) async {
      //pushing setUrlScreen
      await showLoginScreen(tester);

      //initializing the email input field widget Finder
      final emailInputFieldWidget = find.byKey(const Key('EmailInputField'));
      //initializing the text field suffix button widget Finder
      final findLoginButton = find.byKey(const Key('LoginButton'));
      //initializing the nullEmailSubmission widget Finder
      final nullEmailSubmission = find.text('Email must not be left blank');
      //initializing the invalidEmailSubmission widget Finder
      final invalidEmailSubmission =
          find.text('Please enter a valid Email Address');

      //finding the email input text field
      expect(emailInputFieldWidget, findsOneWidget);
      //finding the login button
      expect(findLoginButton, findsOneWidget);

      //inputting a non email text in the field
      await tester.enterText(emailInputFieldWidget, 'non-url text');
      //submitting the field with non url input
      await tester.tap(findLoginButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the invalidEmailSubmission widget appears
      expect(invalidEmailSubmission, findsOneWidget);

      //without inputting text in the field
      await tester.enterText(emailInputFieldWidget, '');
      //submitting the field with non url input
      await tester.tap(findLoginButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the nullEmailSubmission widget appears
      expect(nullEmailSubmission, findsOneWidget);
    });

    testWidgets("Testing the password Input text form field", (tester) async {
      //pushing setUrlScreen
      await showLoginScreen(tester);

      //initializing the password input field widget Finder
      final passwordInputFieldWidget =
          find.byKey(const Key('PasswordInputField'));
      //initializing the pa Finder
      final iconButton = find.byIcon(Icons.visibility_off);
      //initializing the text field suffix button widget Finder
      final findLoginButton = find.byKey(const Key('LoginButton'));
      //initializing the nullPasswordSubmission widget Finder
      final nullPasswordSubmission =
          find.text('Password must not be left blank');
      //initializing the invalidPasswordSubmission widget Finder
      final invalidPasswordSubmission = find.text(
        'Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)',
      );
      //initializing the spacePasswordSubmission widget Finder
      final spacePasswordSubmission =
          find.text('Password must not contain spaces');

      //finding the password input text field
      expect(passwordInputFieldWidget, findsOneWidget);
      //finding the  iconbutton
      expect(iconButton, findsOneWidget);
      //finding the login button
      expect(findLoginButton, findsOneWidget);

      //inputting a invalid password text in the field
      await tester.enterText(passwordInputFieldWidget, 'test');
      //submitting the field with invalid password input
      await tester.tap(findLoginButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the invalidPasswordSubmission widget appears
      expect(invalidPasswordSubmission, findsOneWidget);

      //without inputting text in the field
      await tester.enterText(passwordInputFieldWidget, '');
      //submitting the field without input
      await tester.tap(findLoginButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the nullPasswordSubmission widget appears
      expect(nullPasswordSubmission, findsOneWidget);

      //inputting a password with spaces in the field
      await tester.enterText(passwordInputFieldWidget, 'testing spaces');
      //submitting the field with spaces input
      await tester.tap(findLoginButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //testing the spacePasswordSubmission widget appears
      expect(spacePasswordSubmission, findsOneWidget);

      await tester.tap(iconButton);
      await tester.pumpAndSettle();
    });

    // TODO: uncomment after implementing mock LoginViewModel

    // testWidgets('Check if Login button works', (tester) async {
    //   await showLoginScreen(tester);

    //   await tester.enterText(find.byType(TextFormField).first, 'ravidi');
    //   await tester.enterText(find.byType(TextFormField).last, 'shaikh');

    //   await tester.tap(find.textContaining('Login'));
    //   await tester.pumpAndSettle();

    //   expect(find.byType(MainScreen), findsNothing);

    //   await tester.enterText(find.byType(TextFormField).first, 'ravidi@ravidi.ravidi');
    //   await tester.enterText(find.byType(TextFormField).last, 'Shaikh@1234');

    //   await tester.tap(find.textContaining('Login'));
    //   await tester.pumpAndSettle();

    //   expect(find.byType(MainScreen), findsOneWidget);
    // });

    testWidgets('Check if login button works', (tester) async {
      await showLoginScreen(tester);

      final loginButton = find.byKey(const Key('LoginButton'));
      expect(loginButton, findsOneWidget);

      await tester.tap(loginButton);
      await tester.pumpAndSettle();
    });

    testWidgets('Check if Recover button works', (tester) async {
      await showLoginScreen(tester);

      expect(find.byType(Recover), findsNothing);

      await tester.tap(find.textContaining('Forgot password'));
      await tester.pumpAndSettle();

      expect(find.byType(Recover), findsOneWidget);
    });
  });
}
