import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/theme_view_model.dart';
import 'package:talawa/views/base_view.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';
import '../service_tests/third_party_service_test.dart/connectivity_service_test.dart';

Widget createMainScreen({bool demoMode = true, bool? isOnline}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return BaseView<AppTheme>(
        onModelReady: (model) => model.initialize(),
        builder: (context, themeModel, child) {
          return BaseView<AppConnectivity>(
            onModelReady: (connectivityModel) => connectivityModel.initialise(),
            builder: (context, connectivityModel, child) {
              return MaterialApp(
                locale: const Locale('en'),
                localizationsDelegates: [
                  const AppLocalizationsDelegate(isTest: true),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                key: const Key('Root'),
                theme: Provider.of<AppTheme>(context, listen: true).isdarkTheme
                    ? TalawaTheme.darkTheme
                    : TalawaTheme.lightTheme,
                home: Scaffold(
                  body: TextButton(
                    child: const Text('click me'),
                    onPressed: () {
                      AppConnectivity.showSnackbar(isOnline: isOnline!);
                    },
                  ),
                ),
                navigatorKey: locator<NavigationService>().navigatorKey,
                onGenerateRoute: router.generateRoute,
              );
            },
          );
        },
      );
    },
  );
}

void main() {
  late AppConnectivity model;
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    connectivityService.initConnectivity(client: http.Client());

    model = locator<AppConnectivity>();
    model.initialise();
  });
  test('handleConnection when demoMode', () {
    MainScreenViewModel.demoMode = true;
    model.handleConnection(ConnectivityResult.mobile);
  });

  test('handleConnection when online', () {
    MainScreenViewModel.demoMode = false;
    model.handleConnection(ConnectivityResult.mobile);
  });

  test('handleConnection when offline', () {
    internetAccessible = false;
    model.handleConnection(ConnectivityResult.none);
  });

  testWidgets('showSnackbar when online', (tester) async {
    await tester.pumpWidget(createMainScreen(isOnline: true));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('click me'));
  });

  testWidgets('showSnackbar when offline', (tester) async {
    await tester.pumpWidget(createMainScreen(isOnline: false));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.text('click me'));
  });

  test('check enableSubscription body', () {
    connectivityService.connectionStatusController.add(ConnectivityResult.none);
  });

  test('enableSubscirption exception', () async {
    model.enableSubscription();
  });
}
