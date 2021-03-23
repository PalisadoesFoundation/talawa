// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/login_signup/set_url_page.dart';

Widget createLoginPageScreen() => MultiProvider(
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
      ],
      child: MaterialApp(
        home: UrlPage(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  // Function for ignoring overflow errors.
  Function onErrorIgnoreOverflowErrors = (
    FlutterErrorDetails details, {
    bool forceReport = false,
  }) {
    assert(details != null);
    assert(details.exception != null);

    bool ifIsOverflowError = false;

    // Detect overflow error.
    var exception = details.exception;
    if (exception is FlutterError)
      ifIsOverflowError = !exception.diagnostics.any(
        (e) => e.value.toString().startsWith(
              "A RenderFlex overflowed by",
            ),
      );

    // Ignore if is overflow error.
    if (ifIsOverflowError) {
      print("Over flow error");
    }

    // Throw other errors.
    else {
      FlutterError.dumpErrorToConsole(
        details,
        forceReport: forceReport,
      );
    }
  };
  group("Login Page Tests", () {
    testWidgets("Testing if LoginPage shows up", (tester) async {
      await tester.pumpWidget(createLoginPageScreen());

      /// Verify if [LoginPage] shows up.
      expect(
        find.byType(Form),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of LoginPage in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createLoginPageScreen());

      /// Verify if [LoginPage] shows up.
      expect(
        find.byType(Form),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of LoginPage in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createLoginPageScreen());

      /// Verify if [LoginPage] shows up.
      expect(
        find.byType(Form),
        findsOneWidget,
      );
    });

    testWidgets("Create an Account Button is disabled if url not verfied",
        (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;
      await tester.pumpWidget(createLoginPageScreen());

      // Get the create account button.
      var createAccountButton = find.text("Create an Account");

      // Tap on the createAccountButton.
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      // RegisterForm should not be displayed.
      expect(
        find.text("SIGN UP"),
        findsNothing,
      );
    });

    testWidgets("Login Button is disabled if url not verfied", (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;
      await tester.pumpWidget(createLoginPageScreen());

      // Get the login button.
      var loginButton = find.text("Login");

      // Tap on the login button
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // LoginForm should not be displayed.
      expect(
        find.text("SIGN IN"),
        findsNothing,
      );
    });

    testWidgets("Create an Account Button is working if url is verfied",
        (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createLoginPageScreen());

      // Get the create account button.
      var createAccountButton = find.text("Create an Account");

      /// Enter [calico.palisadoes.org] in [TextFormField].
      await tester.enterText(
        find.byType(TextFormField),
        'calico.palisadoes.org',
      );

      //  Check if saveMsg is "Set URL".
      expect(
        find.text("Set URL"),
        findsOneWidget,
      );

      // Get the Set URL Button.
      var setURLButton = find.text("Set URL");

      // Tap on Set URL Button.
      await tester.tap(setURLButton);
      await tester.pumpAndSettle();

      // Verify that saveMsg changes from "Set URL" to "URL SAVED!".
      expect(
        find.text("Set URL"),
        findsNothing,
      );
      expect(
        find.text("URL SAVED!"),
        findsOneWidget,
      );

      // Tap on the createAccountButton.
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      // RegisterForm should be displayed.
      expect(
        find.text("SIGN UP"),
        findsOneWidget,
      );
    });

    testWidgets("Login Button is working if url is verfied", (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createLoginPageScreen());

      // Get the create account button.
      var loginButton = find.text("Login");

      /// Enter [calico.palisadoes.org] in [TextFormField].
      await tester.enterText(
        find.byType(TextFormField),
        'calico.palisadoes.org',
      );

      //  Check if saveMsg is "Set URL".
      expect(
        find.text("Set URL"),
        findsOneWidget,
      );

      // Get the Set URL Button.
      var setURLButton = find.text("Set URL");

      // Tap on Set URL Button.
      await tester.tap(setURLButton);
      await tester.pumpAndSettle();

      // Verify that saveMsg changes from "Set URL" to "URL SAVED!".
      expect(
        find.text("Set URL"),
        findsNothing,
      );
      expect(
        find.text("URL SAVED!"),
        findsOneWidget,
      );

      // Tap on the loginButton.
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // LoginForm should be displayed.
      expect(
        find.text("SIGN IN"),
        findsOneWidget,
      );
    });

    testWidgets("Protocol selection button is available or not",
        (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createLoginPageScreen());

      // Verify that protocol selection button is present.
      expect(
        find.text("HTTP"),
        findsOneWidget,
      );
    });

    testWidgets("On changing protocol 'URL Saved!' text changes to 'Set URL'",
        (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createLoginPageScreen());

      /// Enter [calico.palisadoes.org] in [TextFormField].
      await tester.enterText(
        find.byType(TextFormField),
        'calico.palisadoes.org',
      );

      //  Check if saveMsg is "Set URL".
      expect(
        find.text("Set URL"),
        findsOneWidget,
      );

      // Get the Set URL Button.
      var setURLButton = find.text("Set URL");

      // Tap on Set URL Button.
      await tester.tap(setURLButton);
      await tester.pumpAndSettle();

      // Verify that saveMsg changes from "Set URL" to "URL SAVED!".
      expect(
        find.text("Set URL"),
        findsNothing,
      );
      expect(
        find.text("URL SAVED!"),
        findsOneWidget,
      );

      // Get the DropdownButton
      var dropDownButton = find.text("HTTP").first;

      // Tap on the dropDownButton.
      await tester.tap(dropDownButton);
      await tester.pumpAndSettle();

      // Get the httpsOptionButton.
      var httpsOptionButton = find.text("HTTPS").first;

      // Tap on the httpsOptionButton.
      await tester.tap(httpsOptionButton);
      await tester.pumpAndSettle();

      // Verify that saveMsg changes from "URL SAVED!" to "Set URL".
      expect(
        find.text("Set URL"),
        findsOneWidget,
      );
      expect(
        find.text("URL SAVED!"),
        findsNothing,
      );
    });
  });
}
