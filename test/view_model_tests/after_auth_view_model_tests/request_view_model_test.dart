import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/request/request_model.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/request_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/request_view_model/request_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  call();
}

class _MockNavigationService extends Mock implements NavigationService {
  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void pushDialog(Widget dialog) {
    showDialog<CustomAlertDialog>(
      context: navigatorKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  late Request newRequest;
  setUp(() async {
    registerServices();
    await locator.unregister<NavigationService>();
    locator.registerSingleton<NavigationService>(_MockNavigationService());
    locator<SizeConfig>().test();
    newRequest = Request(
      id: "1",
      name: "test",
      image: "null",
      description: "fake_request_desc",
      dateTime: "2020-01-01T00:00:00.000Z",
    );
  });

  tearDown(() {
    unregisterServices();
  });

  group('Request tests', () {
    test("Test fetchNewRequests and refreshRequests", () async {
      final model = RequestViewModel();
      await model.initialise();
      when(requestService.getRequests()).thenAnswer((realInvocation) async {});
      await model.fetchNewRequests();
      verify(requestService.getRequests());

      model.refreshRequests();
      verify(requestService.getRequests());
    });

    test("Test checkIfExistsAndAddNewRequest function", () async {
      final model = RequestViewModel();
      await model.initialise();
      await model.checkIfExistsAndAddNewRequest(newRequest);
      expect(model.requests.isNotEmpty, true);
      expect(model.requests.first.id, newRequest.id);
    });

    testWidgets("Test of rejectRequest function is executed", (tester) async {
      final model = RequestViewModel();
      when(model.requestService.rejectRequest(newRequest.id!))
          .thenAnswer((realInvocation) async => 1);

      await tester.pumpWidget(MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        navigatorKey: navigationService.navigatorKey,
        home: Scaffold(body: Container()),
      ));
      await tester.pumpAndSettle();
      await model.checkIfExistsAndAddNewRequest(newRequest);
      await model.rejectRequest(requestId: newRequest.id!);
      await tester.pumpAndSettle();
      expect(model.requests, isEmpty);
    });

    testWidgets("Test of acceptRequest function is executed", (tester) async {
      final model = RequestViewModel();
      when(model.requestService.acceptRequest(newRequest.id!))
          .thenAnswer((realInvocation) async => 1);

      await tester.pumpWidget(MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        navigatorKey: navigationService.navigatorKey,
        home: Scaffold(body: Container()),
      ));
      await tester.pumpAndSettle();
      await model.checkIfExistsAndAddNewRequest(newRequest);
      await model.acceptRequest(requestId: newRequest.id!);
      await tester.pumpAndSettle();
      // final customFinder = find.byType(RequestCard);
      // await tester.tap(customFinder);
      // await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(model.requests, isEmpty);
    });

    test("Test get request service", () async {
      final model = RequestViewModel();
      expect(model.requestService, isA<RequestService>());
    });
  });
}
