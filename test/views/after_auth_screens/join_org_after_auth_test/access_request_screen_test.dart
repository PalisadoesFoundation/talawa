import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/access_request_screen.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget accessRequestScreen() {
  return BaseView<AccessScreenViewModel>(
    onModelReady: (model) => model.initialise(fakeOrgInfo),
    builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: SendAccessRequest(org: fakeOrgInfo),
        navigatorKey: navigationService.navigatorKey,
      );
    },
  );
}

void main() {
  testSetupLocator();
  setUp(() => registerServices());
  tearDown(() => unregisterServices());
  group("SendRequestAccess Screen test", () {
    testWidgets("SendRequestAccess screen is build correctly",
        (WidgetTester tester) async {
      await tester.pumpWidget(accessRequestScreen());
      await tester.pumpAndSettle();

      //Verify that appbar is present with transparent background color
      expect(find.byType(AppBar), findsOneWidget);
      final AppBar appBar = tester.firstWidget(find.byType(AppBar));
      expect(appBar.backgroundColor, Colors.transparent);

      //Verify that the image is present
      expect(find.byType(Image), findsOneWidget);
      expect(find.text("You need access"), findsOneWidget);
      expect(
        find.text("Request access, or switch to an account with access"),
        findsOneWidget,
      );
      expect(find.byType(TextField), findsOneWidget);
      //Verify that the send request button is present
      expect(find.text("Request Access"), findsOneWidget);

      //Tap the "Request Access" button and trigger a frame
      await tester.tap(find.text("Request Access"));
      await tester.pump();
    });
  });
}
