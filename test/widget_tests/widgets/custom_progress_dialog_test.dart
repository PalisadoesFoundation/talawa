// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
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
      // Build the widget
      await tester.pumpWidget(createCustomProgressDialog());
      await tester.pump();
      await tester.pump();

      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    });
  });
}
