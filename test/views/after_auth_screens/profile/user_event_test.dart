import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/profile/user_event.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_card.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';
import '../../../helpers/test_locator.dart';

Widget userEventsScreen({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
  required bool isTest,
}) {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      // return BaseView<LikeButtonViewModel>(
      //   onModelReady: (model) {
      //     model.initialize(likedBy0, 'test_post_id');
      //   },
      //   builder: (context, model, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          key: MainScreenViewModel.scaffoldKey,
          body: const UserEvents(
            key: Key('test_key'),
          ),
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
      );
    },
  );
  //   },
  // );
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  late MockExploreEventsViewModel mockViewModel;
  setUp(() {
    registerServices();
    mockViewModel = MockExploreEventsViewModel();
    locator.unregister<ExploreEventsViewModel>();
    locator.registerSingleton<ExploreEventsViewModel>(mockViewModel);
  });
  tearDown(() {
    unregisterServices();
  });
  group('tests for UserEvents Screen', () {
    testWidgets('check if UserEvents Screen shows up', (tester) async {
      when(mockViewModel.isBusy).thenReturn(true);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.events).thenReturn([]);

      await tester.pumpWidget(userEventsScreen(isTest: true));
      await tester.pump();
      final finder = find.byKey(const Key('test_key'));
      expect(finder, findsOneWidget);
    });
    testWidgets('check if CircularIndicator Shows up', (tester) async {
      when(mockViewModel.isBusy).thenReturn(true);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.events).thenReturn([]);

      await tester.pumpWidget(userEventsScreen(isTest: false));
      await tester.pump();
      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsOneWidget);
    });
    testWidgets('check if No Events text shows up', (tester) async {
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.events).thenReturn([]);

      await tester.pumpWidget(userEventsScreen(isTest: true));
      await tester.pump();
      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsNothing);
      expect(
        find.text('You have no event in this organization'),
        findsOneWidget,
      );
    });
    testWidgets('check if text button shows up', (tester) async {
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.events).thenReturn([]);

      await tester.pumpWidget(userEventsScreen(isTest: true));
      await tester.pump();

      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsNothing);
      expect(
        find.text('Create your first event'),
        findsOneWidget,
      );
      await tester.tap(find.text('Create your first event'));
      await tester.pumpAndSettle();
    });
    testWidgets('check if User Event screen shows up', (tester) async {
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.events).thenReturn([]);

      await tester.pumpWidget(userEventsScreen(isTest: true));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('test_key')), findsOneWidget);
    });
    testWidgets('check if User Events shows up if not null', (tester) async {
      when(mockViewModel.isBusy).thenReturn(false);
      when(mockViewModel.initialise()).thenAnswer((_) async {});
      when(mockViewModel.userEvents).thenReturn([
        Event(
          id: 'a',
          title: 'Sample Event',
          description: 'This is a fake event description.',
          attendees: 'John Doe, Jane Doe',
          location: 'City Park',
          latitude: 40.7128,
          longitude: -74.0060,
          recurring: false,
          allDay: false,
          startDate: '2022-01-01',
          endDate: '2022-01-02',
          startTime: '12:00 PM',
          endTime: '3:00 PM',
          recurrence: 'Weekly',
          isPublic: true,
          isRegistered: false,
          isRegisterable: true,
          creator: User(id: 'creator'),
          organization: OrgInfo(),
          admins: [
            User(id: 'admin'),
          ],
          registrants: [
            User(id: 'registrant'),
          ],
        ),
      ]);

      await tester.pumpWidget(userEventsScreen(isTest: true));
      await tester.pump();
      final finder = find.byType(CircularProgressIndicator);
      expect(finder, findsNothing);
      expect(
        find.text('Create your first event'),
        findsNothing,
      );
      final finder1 = find.byType(SingleChildScrollView);
      expect(finder1, findsOneWidget);
      expect(find.byType(EventCard), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();
    });
  });
}
