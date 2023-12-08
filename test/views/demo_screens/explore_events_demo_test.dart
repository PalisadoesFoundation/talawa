// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/widgets/custom_drawer.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

// class MockBuildContext extends Mock implements BuildContext {}

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
        body: const DemoExploreEvents(
          key: Key('ExploreEvents'),
        ),
      ),
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: router.generateRoute,
    );

void main() async {
  SizeConfig().test();

  setUp(() {
    registerServices();
    registerViewModels();
  });
  tearDown(() {
    unregisterViewModels();
  });

  group('Test for DemoExploreEventsPage', () {
    testWidgets('Test for menu button.', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final menuButton = find.byIcon(Icons.menu);

      await tester.tap(menuButton);
      await tester.pumpAndSettle();

      expect(find.byType(CustomDrawer), findsOneWidget);
    });

    testWidgets('Test for AddDate button.', (tester) async {
      final model = MainScreenViewModel();
      await tester.pumpWidget(createExploreEventsScreen(model));

      await tester.pumpAndSettle();

      final addDateButton = find.byIcon(Icons.calendar_today);

      await tester.tap(addDateButton);
      await tester.pumpAndSettle();

      expect(find.byType(ExploreEventDialog), findsOneWidget);
    });

    //   testWidgets('Test for add event Button', (tester) async {
    //     final mainScreenModel = MainScreenViewModel();
    //     await tester.pumpWidget(createExploreEventsScreen(mainScreenModel));

    //     await tester.pumpAndSettle();

    //     final addEventButton = find.byType(FloatingActionButton);

    //     when(navigationService.pushScreen(
    //               "/createEventPage",
    //             ),).thenAnswer((realInvocation) async => {});

    //     await tester.tap(addEventButton);
    //     // await tester.pumpAndSettle(const Duration(seconds: 3));

    //     verify(navigationService.pushScreen(
    //               "/createEventPage",
    //             ));

    //     // expect(find.byType(CreateEventPage), findsOneWidget);
    //   });
  });
}
