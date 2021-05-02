// Packages imports.
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/services/post_provider.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/login_signup/register_page.dart';
import '../helper.dart';

Widget createRegisterPageScreen() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration()),
        ChangeNotifierProvider<OrgController>(create: (_) => OrgController()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Preferences>(create: (_) => Preferences()),
        ChangeNotifierProvider<CommentHandler>(create: (_) => CommentHandler()),
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
      ],
      child: MaterialApp(
        home: Builder(
          builder: (context) {
            SizeConfig().init(context);
            return RegisterPage();
          },
        ),
      ),
    );

void main() {
  group('Register Page Tests', () {
    testWidgets("Check if Register Page shows up", (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createRegisterPageScreen());

      /// Verify if [Register Page] shows up.
      expect(
        find.byType(RegisterPage),
        findsOneWidget,
      );
    });

    testWidgets("Validations return false when empty form is submitted",
        (tester) async {
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createRegisterPageScreen());

      /// Get the hold of [Form] Widget.
      final form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      final formKey = form.key as GlobalKey<FormState>;

      // Get hold of SIGN UP button.
      final signUpButton = find.text("SIGN UP");

      // Tap on the signUpButton.
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );

      /// Verify that we are still on [Register Page].
      expect(
        find.byType(RegisterPage),
        findsOneWidget,
      );
    });

    testWidgets(
        "Validations return false when any one of five fields are empty",
        (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createRegisterPageScreen());

      /// Make an instance of [Random] class.
      final Random random = Random();

      /// Get the hold of [Form] Widget.
      final form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      final formKey = form.key as GlobalKey<FormState>;

      /// Get the total number of [TextFormField]'s.
      final length = tester.widgetList(find.byType(TextFormField)).length;

      /// Generate random number between [0, 5].
      final int index = random.nextInt(length);

      if (index == 0) {
        // Fill all the other TextFormFields except at index 0.
        // Fill in last name field.
        await tester.enterText(
          find.byType(TextFormField).at(1),
          "Last Name",
        );

        // Fill in email field.
        await tester.enterText(
          find.byType(TextFormField).at(2),
          "test@gmail.com",
        );

        // Fill in password field.
        await tester.enterText(
          find.byType(TextFormField).at(3),
          "Password1@",
        );

        // Fill in confirm password field.
        await tester.enterText(
          find.byType(TextFormField).at(4),
          "Password1@",
        );
      } else if (index == 1) {
        // Fill all the other TextFormFields except at index 1.
        // Fill in first name.
        await tester.enterText(
          find.byType(TextFormField).at(0),
          "First Name",
        );

        // Fill in email field.
        await tester.enterText(
          find.byType(TextFormField).at(2),
          "test@gmail.com",
        );

        // Fill in password field.
        await tester.enterText(
          find.byType(TextFormField).at(3),
          "Password1@",
        );

        // Fill in confirm password field.
        await tester.enterText(
          find.byType(TextFormField).at(4),
          "Password1@",
        );
      } else if (index == 2) {
        // Fill all the other TextFormFields except at index 2.
        // Fill in first name.
        await tester.enterText(
          find.byType(TextFormField).at(0),
          "First Name",
        );

        // Fill in last name field.
        await tester.enterText(
          find.byType(TextFormField).at(1),
          "Last Name",
        );

        // Fill in password field.
        await tester.enterText(
          find.byType(TextFormField).at(3),
          "Password1@",
        );

        // Fill in confirm password field.
        await tester.enterText(
          find.byType(TextFormField).at(4),
          "Password1@",
        );
      } else if (index == 3) {
        // Fill all the other TextFormFields except at index 3.
        // Fill in first name.
        await tester.enterText(
          find.byType(TextFormField).at(0),
          "First Name",
        );

        // Fill in last name field.
        await tester.enterText(
          find.byType(TextFormField).at(1),
          "Last Name",
        );

        // Fill in email field.
        await tester.enterText(
          find.byType(TextFormField).at(2),
          "test@gmail.com",
        );

        // Fill in confirm password field.
        await tester.enterText(
          find.byType(TextFormField).at(4),
          "Password1@",
        );
      } else if (index == 4) {
        // Fill all the other TextFormFields except at index 4.
        // Fill in first name.
        await tester.enterText(
          find.byType(TextFormField).at(0),
          "First Name",
        );

        // Fill in last name field.
        await tester.enterText(
          find.byType(TextFormField).at(1),
          "Last Name",
        );

        // Fill in email field.
        await tester.enterText(
          find.byType(TextFormField).at(2),
          "test@gmail.com",
        );

        // Fill in password field.
        await tester.enterText(
          find.byType(TextFormField).at(3),
          "Password1@",
        );
      }

      // Get hold of SIGN UP button.
      final signUpButton = find.text("SIGN UP");

      // Tap on the signUpButton.
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );

      /// Verify that we are still on [Register Page].
      expect(
        find.byType(RegisterPage),
        findsOneWidget,
      );
    });

    testWidgets("Validations return false when both password field don't match",
        (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createRegisterPageScreen());

      /// Get the hold of [Form] Widget.
      final form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      final formKey = form.key as GlobalKey<FormState>;

      // Fill in first name.
      await tester.enterText(
        find.byType(TextFormField).at(0),
        "First Name",
      );

      // Fill in last name field.
      await tester.enterText(
        find.byType(TextFormField).at(1),
        "Last Name",
      );

      // Fill in email field.
      await tester.enterText(
        find.byType(TextFormField).at(2),
        "test@gmail.com",
      );

      // Fill in password field.
      await tester.enterText(
        find.byType(TextFormField).at(3),
        "Password1@",
      );

      // Fill in confirm password field (slightly different this time).
      await tester.enterText(
        find.byType(TextFormField).at(4),
        "Password1@2",
      );

      // Get hold of SIGN UP button.
      final signUpButton = find.text("SIGN UP");

      // Tap on the signUpButton.
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to false.
      expect(
        formKey.currentState.validate(),
        false,
      );
    });

    testWidgets("Validations return true when all fields are correctly filled",
        (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createRegisterPageScreen());

      /// Get the hold of [Form] Widget.
      final form = tester.widget(find.byType(Form));

      /// Get the hold of [Form Key].
      final formKey = form.key as GlobalKey<FormState>;

      // Fill in first name.
      await tester.enterText(
        find.byType(TextFormField).at(0),
        "First Name",
      );

      // Fill in last name field.
      await tester.enterText(
        find.byType(TextFormField).at(1),
        "Last Name",
      );

      // Fill in email field.
      await tester.enterText(
        find.byType(TextFormField).at(2),
        "test@gmail.com",
      );

      // Fill in password field.
      await tester.enterText(
        find.byType(TextFormField).at(3),
        "Password1@",
      );

      // Fill in confirm password field.
      await tester.enterText(
        find.byType(TextFormField).at(4),
        "Password1@",
      );

      // Get hold of SIGN UP button.
      final signUpButton = find.text("SIGN UP");

      // Tap on the signUpButton.
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      // Verify that key's current state validates to true
      expect(
        formKey.currentState.validate(),
        true,
      );
    });
  });
}
