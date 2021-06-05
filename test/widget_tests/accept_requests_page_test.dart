import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/lang_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/organization/accept_requests_page.dart';

Widget accepRequestsPage() => MultiProvider(
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
        ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
      ],
      child: Consumer<AppLanguage>(
        builder: (context, appLang, _) => MaterialApp(
          locale: const Locale('en'),
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('es', 'ES'),
            const Locale('fr', 'FR'),
            const Locale('hi', 'IN'),
            const Locale('zh', 'CN'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: Builder(builder: (context) {
            SizeConfig().init(context);
            return AcceptRequestsPage();
          }),
        ),
      ),
    );

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  group("accept_members_requests page tests", () {
    testWidgets("Testing if member page shows up", (WidgetTester tester) async {
      await tester.pumpWidget(accepRequestsPage());
      await tester.pump();

      //verify if [accept_members_requests] page appears
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Card), findsNothing);

      //Testing overflow of accept_members_requests page in a mobile screen
      binding.window.physicalSizeTestValue = const Size(440, 800);
      binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(accepRequestsPage());
      await tester.pump();

      //verify if [accept_members_requests] page appears
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Card), findsNothing);

      //Testing overflow of Member Page in a tablet screen
      binding.window.physicalSizeTestValue = const Size(1024, 768);
      binding.window.devicePixelRatioTestValue = 1.0;
      //
      await tester.pumpWidget(accepRequestsPage());
      await tester.pump();

      //verify if [accept_members_requests] page appears
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Card), findsNothing);
    });
  });
}
