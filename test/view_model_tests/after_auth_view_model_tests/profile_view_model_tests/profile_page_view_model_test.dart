// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockBuildContext extends Mock implements BuildContext {}

void verifyInteraction(dynamic x, {required String mockName}) {
  // Ensures that navigation service was called
  try {
    verifyZeroInteractions(x);
    //If 0 interactions passes that means mock was not called hence test fails
    throw Exception("Expected interaction but found 0 with $mockName");
  } on TestFailure {
    //If test fails then 1 or more interactions with navigation service hence test passes
    expect(true, true);
  }
}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('ProfilePageViewModel Tests -', () {
    test("Test initialization", () {
      final model = ProfilePageViewModel();
      model.initialize();
      expect(model.currentOrg, userConfig.currentOrg);
      expect(model.currentUser, userConfig.currentUser);
    });

    test("Test showSnackBar and popBottomSheet function", () {
      final model = ProfilePageViewModel();
      model.initialize();

      model.showSnackBar("fake_message");
      verify(
        navigationService.showTalawaErrorDialog(
          "fake_message",
          MessageType.error,
        ),
      ).called(1);

      model.popBottomSheet();
      verify(navigationService.pop());
    });

    test("Test updateSheetHeight function", () {
      final model = ProfilePageViewModel();
      model.initialize();
      model.updateSheetHeight();
      expect(model.bottomSheetHeight, SizeConfig.screenHeight! * 0.65);
    });

    testWidgets("Test iconButton function", (tester) async {
      final model = ProfilePageViewModel();
      model.initialize();
      const Icon testIcon = Icon(Icons.cancel);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: model.iconButton(testIcon, () {}),
          ),
        ),
      );
      final iconButtonFinder = find.byType(IconButton);
      final iconButton = tester.firstWidget(iconButtonFinder);
      expect((iconButton as IconButton).icon, testIcon);
    });

    testWidgets("Test dominationButton function", (tester) async {
      final mockContext = MockBuildContext();
      final model = ProfilePageViewModel();
      model.initialize();
      const String amt = "test_amt";

      void mockSetter(void Function() innerFunction) {}

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: model.dominationButton(
              amt,
              mockContext,
              mockSetter,
            ),
          ),
        ),
      );
      final containerFinder = find.byType(Container);
      final Container container = tester.firstWidget(containerFinder);
      expect(
        container.padding,
        EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight! * 0.02,
          horizontal: SizeConfig.screenWidth! * 0.075,
        ),
      );
    });
    testWidgets("Test invite method", (WidgetTester tester) async {
      // final mockContext = MockBuildContext();
      final model = ProfilePageViewModel();
      model.initialize();
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                // Trigger the invite method on button press
                return ElevatedButton(
                  key: const Key('inviteButton'),
                  onPressed: () => model.invite(context),
                  child: const Text('Invoke Invite'),
                );
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // model.invite(mockContext);

      await tester.tap(find.byKey(const Key('inviteButton')));
      await tester.pumpAndSettle(); // Wait for animations and UI changes

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byType(QrImageView), findsOneWidget);
    });

    testWidgets("Test logout function", (tester) async {
      final mockContext = MockBuildContext();
      final model = ProfilePageViewModel();
      final mocknav = getAndRegisterNavigationService();
      model.initialize();
      await model.logout(mockContext);
      await tester.pumpAndSettle();

      //Ensures that naviagation service was called
      verifyInteraction(mocknav, mockName: "NavigationService");
    });
  });
}
