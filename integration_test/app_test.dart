import 'dart:io'; // <-- add this import
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart'; // <-- add this import
import 'package:talawa/locator.dart';
import 'package:talawa/main.dart' as app;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/hive_manager.dart'; // <-- add this import
import 'helper.dart';
import 'robots/login_form_robot.dart';
import 'robots/logout_robot.dart';

void main() {
  late LoginFormRobot loginFormRobot;
  late LogoutRobot logoutRobot;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await dotenv.load(fileName: ".env");
    debugPrint("Environment variables loaded");
    debugPrint("API_URL = ${dotenv.get('API_URL')}");

    final Directory dir = await getApplicationDocumentsDirectory();
    await HiveManager.initializeHive(dir: dir);
  });

  group("E2E Tests : ", () {
    testWidgets(
      "For Admin",
      (WidgetTester tester) async {
        app.main();

        await tester.pumpAndSettle();

        final graphqlConfig = locator<GraphqlConfig>();
        graphqlConfig.initializeForTesting(dotenv.get('API_URL'));

        await Future.delayed(const Duration(seconds: 2));

        loginFormRobot = LoginFormRobot(tester);
        devPrint("-> Login as Admin");
        await loginFormRobot.loginAdmin();
        devPrint("✓ Admin logged in successfully");
        logoutRobot = LogoutRobot(tester);
        devPrint("-> Logout Admin");
        await logoutRobot.logout();
        devPrint("✓ Admin logged out successfully");

        devPrint("✓ Admin test completed successfully");
      },
      timeout: const Timeout(Duration(minutes: 5)),
    );
  });
}
