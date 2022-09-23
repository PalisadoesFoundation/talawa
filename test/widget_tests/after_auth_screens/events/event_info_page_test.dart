// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_page.dart';

import '../../../helpers/test_helpers.dart';

Widget createEventInfoPage(bool isPublic) {
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
        'event': Event(
          id: '1',
          title: 'test',
          startTime: '10000',
          endTime: '20000',
          location: 'ABC',
          description: 'test',
          creator: User(
            id: "xyz1",
            firstName: "Test",
            lastName: "User",
            email: "testuser@gmail.com",
            refreshToken: "testtoken",
            authToken: 'testtoken',
          ),
          startDate: '10000',
          endDate: '20000',
          latitude: 23.45,
          longitude: -23.45,
          admins: [
            User(
              id: "xzy1",
              firstName: "Test",
              lastName: "User",
            )
          ],
          isPublic: isPublic,
          organization: OrgInfo(id: 'XYZ'),
        ),
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
    testWidgets('Test Share button', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createEventInfoPage(true));
        await tester.pumpAndSettle();

        final shareButton = find.byIcon(Icons.share);
        expect(shareButton, findsOneWidget);

        await tester.tap(shareButton);
        await tester.pumpAndSettle();
      });
    });

    testWidgets('Test FloatingActionButton', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createEventInfoPage(true));
        await tester.pumpAndSettle();

        expect(find.byType(FloatingActionButton), findsOneWidget);

        await tester.tap(find.byType(FloatingActionButton));
      });
    });

    testWidgets('Test EventInfoPage', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createEventInfoPage(false));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.lock), findsOneWidget);

        await tester.tap(find.text('View on map'));
        verify(navigationService.pushScreen(Routes.mapScreen,
            arguments: {'latitude': 23.45, 'longitude': -23.45}));
      });
    });
  });
}
