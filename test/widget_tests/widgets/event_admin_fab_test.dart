import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/event_admin_fab.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  call();
}

class MockBuildContext extends Mock implements BuildContext {}

final MockBuildContext mockBuildContext = MockBuildContext();

final setDateCallback = MockCallbackFunction();
final setTimeCallback = MockCallbackFunction();

Event mockEvent = Event(
  id: '1',
  title: 'test',
  startTime: '10000',
  endTime: '20000',
  location: 'ABC',
  description: 'test',
  creator: User(
    id: "xzy1",
    firstName: "Test",
    lastName: "User",
    email: "testuser@gmail.com",
    refreshToken: "testtoken",
    authToken: 'testtoken',
  ),
  isPublic: true,
  organization: OrgInfo(id: 'XYZ'),
);

ExploreEventsViewModel mockExploreEventsViewModel = ExploreEventsViewModel();
final mockModel = MockExploreEventsViewModel();

Widget createWidget() {
  return MaterialApp(
    home: Scaffold(
      body: eventAdminFab(
        context: mockBuildContext,
        event: mockEvent,
        exploreEventsViewModel: mockModel,
      ),
    ),
  );
}

void main() {
  testSetupLocator();
  locator<SizeConfig>().test();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Tests for event_admin_fab widget', () {
    testWidgets('Checking if the widget shows up', (tester) async {
      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle(const Duration(seconds: 500));
      expect(find.byType(SpeedDial), findsWidgets);
    });

    testWidgets("Checking speed dial", (tester) async {
      await tester.pumpWidget(createWidget());
      await tester.pumpAndSettle(const Duration(seconds: 500));
      final speedDialFinder = find.byType(SpeedDial);
      final speedDial = tester.firstWidget(speedDialFinder);

      expect(speedDialFinder, findsOneWidget);
      expect((speedDial as SpeedDial).icon, Icons.menu);
      expect(speedDial.activeIcon, Icons.close);
      expect(speedDial.buttonSize, 55.0);
      expect(speedDial.overlayColor,
          Theme.of(mockBuildContext).colorScheme.onBackground);
      expect(speedDial.overlayOpacity, 0.5);
      expect(
          speedDial.backgroundColor, Theme.of(mockBuildContext).primaryColor);
      expect(speedDial.foregroundColor,
          Theme.of(mockBuildContext).colorScheme.secondary);

      final speedDialChild = speedDial.children.first;

      expect(speedDialChild.label, 'Delete Event');
      expect(
        speedDialChild.labelStyle,
        Theme.of(mockBuildContext)
            .textTheme
            .headline6!
            .copyWith(color: Theme.of(mockBuildContext).colorScheme.secondary),
      );
      expect(speedDialChild.foregroundColor,
          Theme.of(mockBuildContext).colorScheme.secondary);
      expect(speedDialChild.backgroundColor,
          Theme.of(mockBuildContext).primaryColor);
      expect(speedDialChild.labelBackgroundColor,
          Theme.of(mockBuildContext).primaryColor);

      //onTap for first speedDialChild
      // on tap for second speedDialChild
      when(mockModel.deleteEvent(eventId: "1"))
          .thenAnswer((realInvocation) async {});
      speedDialChild.onTap!.call();
      verify(mockModel.deleteEvent(eventId: "1"));

      final speedDialChild2 = speedDial.children.last;
      expect(speedDialChild2.label, 'Edit Event');
      expect(
        speedDialChild2.labelStyle,
        Theme.of(mockBuildContext)
            .textTheme
            .headline6!
            .copyWith(color: Theme.of(mockBuildContext).colorScheme.secondary),
      );
      expect(speedDialChild2.foregroundColor,
          Theme.of(mockBuildContext).colorScheme.secondary);
      expect(speedDialChild2.backgroundColor,
          Theme.of(mockBuildContext).primaryColor);
      expect(speedDialChild2.labelBackgroundColor,
          Theme.of(mockBuildContext).primaryColor);

      when(navigationService.pushScreen("/editEventPage", arguments: mockEvent))
          .thenAnswer((_) async {});

      // on tap for second speedDialChild
      speedDialChild2.onTap!.call();
      verify(
          navigationService.pushScreen("/editEventPage", arguments: mockEvent));
    });
  });
}
