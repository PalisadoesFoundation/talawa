import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_page.dart';
import 'package:talawa/views/after_auth_screens/events/event_filter_bottomsheet.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

/// Mocks CallBack Function.
class MockCallbackFunction extends Mock {
  ///Mock Call FUnction.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void call();
}

/// SetDateCallback.
final setDateCallback = MockCallbackFunction();

/// SetTimeCallback.
final setTimeCallback = MockCallbackFunction();

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


/// Tests Create Event Page.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  SizeConfig().test();
  testSetupLocator();
  // locator.unregister<OrganizationService>();
  locator.unregister<MultiMediaPickerService>();
  // locator.registerSingleton(OrganizationService());
  // locator.registerSingleton(LikeButtonViewModel());

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('testing', () {
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
  });
     
}
