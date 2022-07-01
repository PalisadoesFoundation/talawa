import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/widgets/custom_drawer.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

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
  setUp(() {
    registerServices();
    registerViewModels();
  });
  tearDown(() {
    unregisterViewModels();
  });
  group("Test Explore Events Screen Widget:", () {
    testWidgets("Testing if drawer opens up", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pump();
        // find by icon menu
        expect(find.byIcon(Icons.menu), findsOneWidget);
        // tap on icon menu
        await tester.tap(find.byIcon(Icons.menu));
        await tester.pump();

        // expect the drawer to be open
        expect(find.byType(CustomDrawer), findsOneWidget);
      });
    });
    testWidgets("Testing if showSearch works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.search), findsOneWidget);

        await tester.tap(find.byIcon(Icons.search));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.clear), findsOneWidget);
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      });
    });
    testWidgets("Testing if refresh works", (tester) async {
      await mockNetworkImages(() async {
        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.drag(
            find.byKey(const Key('ExploreEvents')), const Offset(0, 500));
        await tester.pumpAndSettle();

        verify(locator<ExploreEventsViewModel>().refreshEvents()).called(2);
      });
    });
    testWidgets("Testing if drop down button works", (tester) async {
      await mockNetworkImages(() async {
        locator.unregister<ExploreEventsViewModel>();

        final model = ExploreEventsViewModel();
        locator.registerSingleton(model);

        final homeModel = locator<MainScreenViewModel>();

        await tester.pumpWidget(createExploreEventsScreen(homeModel));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(DropdownButtonHideUnderline));
        await tester.pumpAndSettle();

        await tester.tap(find.bySemanticsLabel('Created Events'));
        await tester.pumpAndSettle();

        expect(model.chosenValue, 'Created Events');
      });
    });
  });
}
