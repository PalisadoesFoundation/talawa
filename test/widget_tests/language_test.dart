// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/generated/l10n.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/views/pages/language/lanuage.dart';
import 'package:talawa/views/pages/login_signup/set_url_page.dart';

Widget Language() => MultiProvider(
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
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: LanguageSelection(),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  group("Login Page Tests", () {
    testWidgets("Testing if language shows up", (tester) async {
      await tester.pumpWidget(Language());
      await tester.pumpAndSettle();

      /// Verify if [LoginPage] shows up.
      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of language in a mobile screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(Language());
      await tester.pumpAndSettle();

      /// Verify if [language] shows up.
      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
    });

    testWidgets("Testing overflow of language in a tablet screen",
        (tester) async {
      binding.window.physicalSizeTestValue = Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(Language());
      await tester.pumpAndSettle();

      /// Verify if [language] shows up.
      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
    });
  });
}
