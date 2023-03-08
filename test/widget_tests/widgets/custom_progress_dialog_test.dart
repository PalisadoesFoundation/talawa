// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../helpers/test_helpers.dart';

Widget createCustomProgressDialog() {
  return MaterialApp(
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
    home: const Scaffold(
      body: SingleChildScrollView(
        child: CustomProgressDialog(
          key: Key('testing'),
        ),
      ),
    ),
  );
}

void main() {
  SizeConfig().test();

  setUp(() {
    registerServices();
    registerViewModels();
  });

  tearDown(() async {
    unregisterViewModels();
    unregisterServices();
  });
  group('Test for CustomProgressDialog', () {
    testWidgets(
        'Check if CustomProgressDialog widget shows up when connection available',
        (tester) async {
      // Setup connectivity for connection available
      when(connectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Build the widget
      await tester.pumpWidget(createCustomProgressDialog());
      await tester.pump();
      await tester.pump();

      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    });
    testWidgets(
        'Check if CustomProgressDialog widget shows up when no connection',
        (tester) async {
      // Register navigation service
      locator.unregister<NavigationService>();
      locator.registerSingleton(NavigationService());

      // Setup connectivity for connection not available
      when(connectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      // Build the widget
      await tester.pumpWidget(createCustomProgressDialog());
      await tester.pump();

      expect(find.byType(Column), findsOneWidget);
      expect(find.text("No Internet!"), findsOneWidget);

      // CustomProgressDialog should pop
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.byType(CustomProgressDialog), findsNothing);
    });
  });
}
