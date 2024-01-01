import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/widgets/custom_drawer.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
}

final setDateCallback = MockCallbackFunction();
final setTimeCallback = MockCallbackFunction();

/// Creates Explore Event Screen.
///
/// **params**:
/// * `model`: Home Screen Model
///
/// **returns**:
/// * `Widget`: Returns Explore Screen Widget
Widget createExploreEventsScreen(MainScreenViewModel model) => MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: [
        const AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      key: const Key('Root'),
      home: Scaffold(
        key: MainScreenViewModel.scaffoldKey,
        drawer: CustomDrawer(
          homeModel: model,
        ),
        body: const ExploreEvents(
          key: Key('ExploreEvents'),
        ),
      ),
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: router.generateRoute,
    );
void main() {
  SizeConfig().test();
  testSetupLocator();
  locator.unregister<MultiMediaPickerService>();
  setUp(() {
    registerServices();
  });
  tearDown(() {
    unregisterServices();
  });
  group('testing filters bottomsheet', () {
    testWidgets("Checking tap cross works", (tester) async {
      await mockNetworkImages(() async {
        locator.unregister<ExploreEventsViewModel>();
        final model = ExploreEventsViewModel();
        locator.registerSingleton(model);
        final homeModel = locator<MainScreenViewModel>();
        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();
        await tester.tap(find.bySemanticsLabel('Filters'));
        await tester.pumpAndSettle();
        final finder = find.byKey(const Key('close'));
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(find.bySemanticsLabel('Filters'), findsAtLeast(1));
      });
    });
    testWidgets("Testing if Filter button works", (tester) async {
      await mockNetworkImages(() async {
        locator.unregister<ExploreEventsViewModel>();
        final model = ExploreEventsViewModel();
        locator.registerSingleton(model);
        final homeModel = locator<MainScreenViewModel>();
        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();
        await tester.tap(find.bySemanticsLabel('Filters'));
        await tester.pumpAndSettle();
        await tester.pump();
        await tester.tap(find.byKey(const Key('Public Events')));
        await tester.pumpAndSettle();
        expect(model.chosenValue, 'Public Events');
      });
    });
  });
}
