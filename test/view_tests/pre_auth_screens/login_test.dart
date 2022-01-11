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

Future<void> showLoginScreen(tester) async {
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

      await tester.tap(find.descendant(
        of: find.byType(AppBar),
        matching: find.byType(IconButton),
      ));
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
          find.textContaining("Enter your registered Email"), findsOneWidget);
      expect(find.textContaining("Enter your password"), findsOneWidget);
      expect(find.textContaining("Forgot password"), findsOneWidget);
    });

    testWidgets('Check if entering text in TextField(s) works', (tester) async {
      await showLoginScreen(tester);

      final emailField = tester.firstWidget(find.byType(TextFormField).first);
      final passwordField =
          tester.widgetList(find.byType(TextFormField).last).first;

      await tester.enterText(find.byType(TextFormField).first, 'ravidi');
      await tester.enterText(find.byType(TextFormField).last, 'shaikh');

      expect((emailField as TextFormField).controller!.text, 'ravidi');
      expect((passwordField as TextFormField).controller!.text, 'shaikh');
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

    testWidgets('Check if Recover button works', (tester) async {
      await showLoginScreen(tester);

      expect(find.byType(Recover), findsNothing);

      await tester.tap(find.textContaining('Forgot password'));
      await tester.pumpAndSettle();

      expect(find.byType(Recover), findsOneWidget);
    });
  });
}
