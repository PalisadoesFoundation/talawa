// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/pre_auth_screens/signup_details.dart';

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
        final OrgInfo org = OrgInfo(
          id: '2',
          name: 'test org',
          isPublic: true,
          creatorInfo: User(firstName: 'test', lastName: 'test'),
        );

        await navigationService.pushScreen('/signupDetails', arguments: org);
      },
      child: const Text('Ayush'),
    ),
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
  );
}

Future<void> showSignUpScreen(WidgetTester tester) async {
  await tester.pumpWidget(createApp());
  await tester.pump();
  await tester.tap(find.textContaining('Ayush'));
  await tester.pumpAndSettle();
}

void main() {
  SizeConfig().test();

  testSetupLocator();

  group('Test For SignUp Screen', () {
    testWidgets('Check if SignUp screen shows up', (tester) async {
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.byType(SignUpDetails), findsNothing);

      await tester.tap(find.textContaining('Ayush'));
      await tester.pumpAndSettle();

      expect(find.byType(SignUpDetails), findsOneWidget);
    });
    testWidgets('Check if arrow back works', (tester) async {
      await tester.pumpWidget(createApp());
      await tester.pump();

      expect(find.byType(SignUpDetails), findsNothing);

      await tester.tap(find.textContaining('Ayush'));
      await tester.pumpAndSettle();

      expect(find.byType(SignUpDetails), findsOneWidget);

      final finder = find.byIcon(Icons.arrow_back);

      await tester.tap(finder);
      await tester.pump();

      expect(find.text('Ayush'), findsOneWidget);
    });

    testWidgets("Testing if input field and signup button appear",
        (tester) async {
      await showSignUpScreen(tester);

      final firstNameInputFieldWidget =
          find.byKey(const Key('FirstNameInputField'));

      final findSignUpButton = find.text('Next');
      expect(firstNameInputFieldWidget, findsOneWidget);

      expect(findSignUpButton, findsOneWidget);
    });
//....................................................................
    testWidgets('Testing validator for first name input form invalid',
        (tester) async {
      await showSignUpScreen(tester);

      final invalidFirstNameSubmission = find.text('Invalid Firstname');

      final firstNameInputFieldWidget =
          find.byKey(const Key('FirstNameInputField'));

      final findSignUpButton = find.text('Next');

      await tester.enterText(firstNameInputFieldWidget, '<>');

      await tester.dragUntilVisible(
        findSignUpButton,
        findSignUpButton,
        const Offset(0, 50),
      );

      await tester.tap(findSignUpButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      expect(invalidFirstNameSubmission, findsOneWidget);
    });
    testWidgets('Testing validator for first name input form null',
        (tester) async {
      await showSignUpScreen(tester);

      final nullSubmission = find.text('Firstname must not be left blank.');

      final firstNameInputFieldWidget =
          find.byKey(const Key('FirstNameInputField'));

      final findSignUpButton = find.text('Next');

      await tester.enterText(firstNameInputFieldWidget, '');

      await tester.dragUntilVisible(
        findSignUpButton,
        findSignUpButton,
        const Offset(0, 50),
      );

      await tester.tap(findSignUpButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      expect(nullSubmission, findsOneWidget);
    });
//...........................................................................

    testWidgets('Testing validator for last name input form invalid',
        (tester) async {
      await showSignUpScreen(tester);

      final invalidLastNameSubmission = find.text('Invalid Lastname');

      final lastNameInputFieldWidget =
          find.byKey(const Key('LastNameInputField'));

      final findSignUpButton = find.text('Next');

      await tester.enterText(lastNameInputFieldWidget, '<>');

      await tester.dragUntilVisible(
        findSignUpButton,
        findSignUpButton,
        const Offset(0, 50),
      );

      await tester.tap(findSignUpButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      expect(invalidLastNameSubmission, findsOneWidget);
    });
    testWidgets('Testing validator for last name input form null',
        (tester) async {
      await showSignUpScreen(tester);

      final nullSubmission = find.text('Lastname must not be left blank.');

      final lastNameInputFieldWidget =
          find.byKey(const Key('LastNameInputField'));

      final findSignUpButton = find.text('Next');

      await tester.enterText(lastNameInputFieldWidget, '');

      await tester.dragUntilVisible(
        findSignUpButton,
        findSignUpButton,
        const Offset(0, 50),
      );

      await tester.tap(findSignUpButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      expect(nullSubmission, findsOneWidget);
    });
  });
  //......................................................................................
  testWidgets("Testing the password Input text form field", (tester) async {
    //pushing setUrlScreen
    await showSignUpScreen(tester);

    //initializing the password input field widget Finder
    final passwordInputFieldWidget = find.byKey(const Key('signuppassword'));
    //initializing the pa Finder
    final iconButton = find.byIcon(Icons.visibility_off);
    //initializing the text field suffix button widget Finder
    final findSignUpButton = find.text('Next');
    //initializing the nullPasswordSubmission widget Finder
    final nullPasswordSubmission = find.text('Password must not be left blank');
    //initializing the invalidPasswordSubmission widget Finder
    final invalidPasswordSubmission = find.text(
      'Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)',
    );
    //initializing the spacePasswordSubmission widget Finder
    final spacePasswordSubmission =
        find.text('Password must not contain spaces');

    await tester.dragUntilVisible(
      findSignUpButton,
      findSignUpButton,
      const Offset(0, 50),
    );
    //finding the password input text field
    expect(passwordInputFieldWidget, findsOneWidget);
    //finding the  iconbutton
    expect(iconButton, findsOneWidget);
    //finding the login button
    expect(findSignUpButton, findsOneWidget);

    //inputting a invalid password text in the field
    await tester.enterText(passwordInputFieldWidget, 'test');
    //submitting the field with invalid password input
    await tester.tap(findSignUpButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    //testing the invalidPasswordSubmission widget appears
    expect(invalidPasswordSubmission, findsOneWidget);

    //without inputting text in the field
    await tester.enterText(passwordInputFieldWidget, '');
    //submitting the field without input
    await tester.tap(findSignUpButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    //testing the nullPasswordSubmission widget appears
    expect(nullPasswordSubmission, findsOneWidget);

    //inputting a password with spaces in the field
    await tester.enterText(passwordInputFieldWidget, 'testing spaces');
    //submitting the field with spaces input
    await tester.tap(findSignUpButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    //testing the spacePasswordSubmission widget appears
    expect(spacePasswordSubmission, findsOneWidget);

    await tester.tap(iconButton);
    await tester.pumpAndSettle();
  });

  testWidgets(
      "Testing onFieldSubmitted in password TextFormField by simulating keyboard hits",
      (tester) async {
    await showSignUpScreen(tester);
    // final formFinder = find.ancestor(
    //     of: find.byKey(const Key('signuppassword')),
    //     matching: find.byType(Form));
    // final formWidget = tester.firstWidget(formFinder) as Form;
    // (formWidget.key! as GlobalKey<FormState>).currentState!.save();

    final textFinder = find.byKey(const Key('signuppassword'));
    await tester.tap(textFinder);
    await tester.pump();
    await tester.showKeyboard(textFinder);
    await tester.testTextInput.receiveAction(TextInputAction.next);
  });
}
