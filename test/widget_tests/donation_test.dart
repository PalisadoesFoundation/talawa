// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/Doantion/donation.dart';

Widget DoantionPage() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
          create: (_) => GraphQLConfiguration(),
        ),
        ChangeNotifierProvider<OrgController>(
          create: (_) => OrgController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<Preferences>(
          create: (_) => Preferences(),
        ),
        ChangeNotifierProvider<CommentHandler>(
          create: (_) => CommentHandler(),
        ),
      ],
      child: MaterialApp(
        home: Donation(
          name: "Test Name",
        ),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Doantion  Tests", () {
    testWidgets("Testing if Donation Page shows up", (tester) async {
      await tester.pumpWidget(DoantionPage());

      /// Verify if [Donation Page] shows up.

      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of Donation in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(DoantionPage());

      /// Verify if [Donation Page] shows up.
      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of Donation in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(DoantionPage());

      /// Verify if [Donation Page] shows up.
      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
    });

    testWidgets(" other Amount Button is working", (tester) async {
      await tester.pumpWidget(DoantionPage());

      // Get the other amount button.
      var otherAmountButton = find.byKey(Key('6'));

      // Tap on the other amount button.
      await tester.tap(otherAmountButton);
      await tester.pumpAndSettle();

      // TextFormField Should be displayed.
      expect(
        find.byType(TextFormField),
        findsWidgets,
      );
    });
    testWidgets(
        "Testing if CustomPay Dialog shows up validations on empty submission",
        (tester) async {
      await tester.pumpWidget(DoantionPage());

      var otherAmountButton = find.byKey(Key('6'));

      // Tap on the other amount button.
      await tester.tap(otherAmountButton);
      await tester.pumpAndSettle();
      // findind the form
      Finder formWidgetFinder = find.byType(Form);
      Form formWidget = tester.widget(formWidgetFinder) as Form;
      GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if CustomPay Dialog shows up validations on non Number submission",
        (tester) async {
      await tester.pumpWidget(DoantionPage());

      var otherAmountButton = find.byKey(Key('6'));

      // Tap on the other amount button.
      await tester.tap(otherAmountButton);
      await tester.pumpAndSettle();
      // Enter a Text
      Finder enterAmount = find.byType(TextFormField);
      await tester.enterText(enterAmount, "test");
      await tester.pump();

      // findind the form
      Finder formWidgetFinder = find.byType(Form);
      Form formWidget = tester.widget(formWidgetFinder) as Form;
      GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
  });
}
