// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talawa/services/app_localization.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/controllers/signup_login_controller.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/controllers/url_controller.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/controllers/news_feed_controller.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/login_signup/set_url_page.dart';
import '../helper.dart';
import 'package:talawa/router.dart' as router;

Widget createLoginPageScreen() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration()),
        ChangeNotifierProvider<OrgController>(create: (_) => OrgController()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Preferences>(create: (_) => Preferences()),
        ChangeNotifierProvider<CommentHandler>(create: (_) => CommentHandler()),
        ChangeNotifierProvider<NewsFeedProvider>(
            create: (_) => NewsFeedProvider()),
        ChangeNotifierProvider<UrlController>(create: (_) => UrlController()),
        ChangeNotifierProvider<SignupLoginController>(
            create: (_) => SignupLoginController()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Builder(builder: (context) {
          SizeConfig().init(context);
          return UrlPage();
        }),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;
  setupLocator();
  group("Login Page Tests", () {
    testWidgets("Testing if LoginPage shows up", (tester) async {
      // locator.registerLazySingleton(() => NavigationService());
      await tester.pumpWidget(createLoginPageScreen());
      await tester.pumpAndSettle();

      /// Verify if [LoginPage] shows up.
      expect(
        find.byType(Form),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of LoginPage in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(
          SizeConfig.safeBlockHorizontal * 110,
          SizeConfig.safeBlockVertical * 100);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createLoginPageScreen());
      await tester.pumpAndSettle();

      /// Verify if [LoginPage] shows up.
      expect(
        find.byType(Form),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of LoginPage in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(
          SizeConfig.safeBlockHorizontal * 256,
          SizeConfig.safeBlockVertical * 96);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(createLoginPageScreen());
      await tester.pumpAndSettle();

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
      await tester.pumpAndSettle();

      // Get the create account button.
      final createAccountButton = find.text("Create an Account");

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
      await tester.pumpAndSettle();

      // Get the login button.
      final loginButton = find.text("Login");

      // Tap on the login button
      await tester.tap(loginButton);

      // LoginForm should not be displayed.
      expect(
        find.text("SIGN IN"),
        findsNothing,
      );
    });

    testWidgets("Create an Account Button is working if url is verfied",
        (tester) async {
      await tester.pumpWidget(createLoginPageScreen());
      await tester.pumpAndSettle();

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
      final setURLButton = find.text("Set URL");

      // Tap on Set URL Button.
      await tester.tap(setURLButton);
      await tester.pump();

      // Verify that saveMsg changes from "Set URL" to "URL SAVED!".
      expect(
        find.text("Set URL"),
        findsNothing,
      );
      expect(
        find.text("URL SAVED!"),
        findsOneWidget,
      );

      // Get the create account button.
      final createAccountButton = find.text("Create an Account");

      // Tap on the createAccountButton.
      await tester.tap(createAccountButton);
      await tester.pump();

      // RegisterForm should be displayed.
      expect(
        find.text("Create an Account"),
        findsOneWidget,
      );
    });

    testWidgets("Login Button is working if url is verfied", (tester) async {
      //FlutterError.onError = onErrorIgnoreOverflowErrors;
      await tester.pumpWidget(createLoginPageScreen());
      await tester.pumpAndSettle();

      // Get the create account button.
      final loginButton = find.text("Login");

      /// Enter [calico.palisadoes.org] in [TextFormField].
      await tester.enterText(
        find.byType(TextFormField),
        'talawa-graphql-api.herokuapp.com/graphql',
      );

      //  Check if saveMsg is "Set URL".
      expect(
        find.text("Set URL"),
        findsOneWidget,
      );

      // Get the Set URL Button.
      final setURLButton = find.text("Set URL");

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
        find.text("Login"),
        findsOneWidget,
      );
    });

    testWidgets("Protocol selection button is available or not",
        (tester) async {
      // Ignore overflow errors.
      FlutterError.onError = onErrorIgnoreOverflowErrors;

      await tester.pumpWidget(createLoginPageScreen());
      await tester.pumpAndSettle();

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
      await tester.pumpAndSettle();

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
      final setURLButton = find.text("Set URL");

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
      final dropDownButton = find.text("HTTP").first;

      // Tap on the dropDownButton.
      await tester.tap(dropDownButton);
      await tester.pumpAndSettle();

      // Get the httpsOptionButton.
      final httpsOptionButton = find.text("HTTPS").first;

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
