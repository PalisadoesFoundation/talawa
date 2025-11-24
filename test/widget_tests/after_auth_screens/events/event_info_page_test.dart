import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_body.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_page.dart';
import 'package:talawa/views/after_auth_screens/events/manage_agenda_items_screen.dart';
import 'package:talawa/views/after_auth_screens/events/volunteer_groups_screen.dart';

import '../../../helpers/test_helpers.dart';

/// Creates an instance of Event with the given parameters.
///
/// **params**:
/// * `isPublic`: event is public or not
/// * `isCreator`: user is creator of the event or not
///
/// **returns**:
/// * `Event`: return the Event instance
Event getEvent(bool isPublic, bool isCreator) {
  return Event(
    id: '1',
    name: 'test',
    location: 'ABC',
    description: 'test',
    creator: User(
      id: isCreator ? "xzy1" : "abc1",
      name: "Test User",
      email: "testuser@gmail.com",
      refreshToken: "testtoken",
      authToken: 'testtoken',
    ),
    admins: [
      User(
        id: isCreator ? "xzy1" : "abc1",
        name: "Test User",
      ),
    ],
    isPublic: isPublic,
    organization: OrgInfo(id: 'XYZ'),
  );
}

/// Creates an instance of EventInfoPage with the given parameters.
///
/// **params**:
/// * `isPublic`: whether the event is public or not
/// * `isCreator`: whether the user is the creator of the event or not
///
/// **returns**:
/// * `Widget`: return the EventInfoPage widget
Widget createEventInfoPage(bool isPublic, bool isCreator) {
  return MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      const AppLocalizationsDelegate(isTest: true),
    ],
    navigatorKey: navigationService.navigatorKey,
    onGenerateRoute: router.generateRoute,
    home: EventInfoPage(
      args: {
        'event': getEvent(isPublic, isCreator),
        'exploreEventViewModel': ExploreEventsViewModel(),
      },
    ),
  );
}

void main() {
  setUp(() {
    SizeConfig().test();
    registerServices();
    registerViewModels();
  });
  tearDown(() {
    unregisterViewModels();
  });
  group('Test EventInfoPage', () {
    testWidgets('Test tab Bar appears', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createEventInfoPage(true, true));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key("tabBar")), findsOneWidget);
      });
    });

    testWidgets('Test event info section appears', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createEventInfoPage(true, true));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key("tabBar")), findsOneWidget);
        expect(find.text('Info'), findsOneWidget);
        expect(find.byType(EventInfoBody), findsOneWidget);

        //check if delete floating button appears when user is creator
        expect(find.byIcon(Icons.delete), findsOneWidget);
        await tester.tap(find.byIcon(Icons.delete));
        await tester.pumpAndSettle();
      });
    });

    testWidgets('Test FloatingActionButton', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createEventInfoPage(true, false));
        await tester.pumpAndSettle();

        expect(
          find.byKey(
            const Key("registerEventFloatingbtn"),
          ),
          findsOneWidget,
        );

        await tester.tap(
          find.byKey(
            const Key("registerEventFloatingbtn"),
          ),
        );
        await tester.pumpAndSettle();
      });
    });
    testWidgets('Test if volunteer section appears on swipe left',
        (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createEventInfoPage(true, true));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key("tabBar")), findsOneWidget);
        expect(find.text('Info'), findsOneWidget);
        expect(find.byType(VolunteerGroupsScreen), findsNothing);

        await tester.drag(
          find.byType(TabBarView),
          const Offset(-500.0, 0.0),
        );
        await tester.pumpAndSettle();

        expect(find.byType(EventInfoBody), findsNothing);
        expect(find.byType(VolunteerGroupsScreen), findsOneWidget);
      });
    });
    testWidgets('Test if agenda section appears on swipe left', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createEventInfoPage(true, true));
        await tester.pumpAndSettle();
        expect(find.byKey(const Key("tabBar")), findsOneWidget);
        expect(find.text('Info'), findsOneWidget);
        expect(find.byType(VolunteerGroupsScreen), findsNothing);

        await tester.drag(
          find.byType(TabBarView),
          const Offset(-500.0, 0.0),
        );
        await tester.pumpAndSettle();

        expect(find.byType(EventInfoBody), findsNothing);
        expect(find.byType(VolunteerGroupsScreen), findsOneWidget);

        await tester.drag(
          find.byType(TabBarView),
          const Offset(-500.0, 0.0),
        );
        await tester.pumpAndSettle();

        expect(find.byType(VolunteerGroupsScreen), findsNothing);
        expect(find.byType(ManageAgendaScreen), findsOneWidget);
      });
    });
  });
}
