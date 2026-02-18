import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/user/user_info.dart';

import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/event_card.dart';

import '../../helpers/test_locator.dart';

Event getEvent({bool? isRegistered, bool isPublic = false}) {
  return Event(
    name: "Testing",
    location: "PyasePyasePyasePyasePyasePyase",
    description: "Testing for the Event Card Widget",
    isPublic: isPublic,
    startAt: DateTime.parse('2023-12-13T19:10:00.000Z'),
    endAt: DateTime.parse('2023-12-13T20:15:00.000Z'),
    id: "1",
    isRegistered: isRegistered,
    attendees: [Attendee(id: "attendee1")],
    creator: User(id: "ravidi"),
  );
}

Widget createCustomEventCard(
  Event event, {
  bool isSearchItem = false,
  String? eventTitleHighlightedText,
}) {
  return MaterialApp(
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: EventCard(
      key: const Key('event_card'),
      event: event,
      isSearchItem: isSearchItem,
      eventTitleHighlightedText: eventTitleHighlightedText,
    ),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
  });

  tearDown(() {
    userConfig.currentUser.id = null;
  });

  group("Test for EventCard widget", () {
    testWidgets('Check if Event Card shows up', (tester) async {
      mockNetworkImages(() async {
        expect(find.byType(EventCard), findsNothing);

        await tester.pumpWidget(createCustomEventCard(getEvent()));
        await tester.pump();

        expect(find.byType(EventCard), findsOneWidget);
      });
    });

    testWidgets('Check for child(ren)', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createCustomEventCard(getEvent()));
        await tester.pump();

        expect(
          find.descendant(
            of: find.byType(EventCard),
            matching: find.descendant(
              of: find.byType(Padding),
              matching: find.byType(Stack),
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Stack),
            matching: find.byType(Card),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: find.byType(Stack),
            matching: find.byType(Positioned),
          ),
          findsOneWidget,
        );
      });
    });

    testWidgets('Check for conditional widgets - false', (tester) async {
      mockNetworkImages(() async {
        const eventTitleHighlightedText = "ravidi";
        const eventTitle = "Testing";

        await tester.pumpWidget(
          createCustomEventCard(
            getEvent(),
            isSearchItem: false,
            eventTitleHighlightedText: eventTitleHighlightedText,
          ),
        );
        await tester.pump();

        expect(
          find.descendant(
            of: find.byType(Positioned),
            matching: find.byType(DecoratedBox),
          ),
          findsNothing,
        );
        expect(find.text("Registered"), findsNothing);

        expect(
          find.text(eventTitleHighlightedText, findRichText: true),
          findsNothing,
        );
        expect(find.text(eventTitle), findsOneWidget);
        expect(find.text('public'), findsNothing);
        expect(find.text('private'), findsOneWidget);
      });
    });

    testWidgets('Check for conditional widgets - true', (tester) async {
      mockNetworkImages(() async {
        const eventTitleHighlightedText = "ravidi";
        const eventTitle = "Testing";

        await tester.pumpWidget(
          createCustomEventCard(
            getEvent(isRegistered: true, isPublic: true),
            isSearchItem: true,
            eventTitleHighlightedText: eventTitleHighlightedText,
          ),
        );
        await tester.pump();

        expect(
          find.descendant(
            of: find.byType(Positioned),
            matching: find.byType(DecoratedBox),
          ),
          findsOneWidget,
        );
        expect(find.text("Registered"), findsOneWidget);

        expect(
          find.text(eventTitleHighlightedText, findRichText: true),
          findsOneWidget,
        );
        expect(find.text(eventTitle), findsNothing);
        expect(find.text('public'), findsOneWidget);
        expect(find.text('private'), findsNothing);
      });
    });

    testWidgets('Check for texts', (tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(createCustomEventCard(getEvent()));
        await tester.pump();

        expect(find.text("2023-12-13 - 2023-12-13"), findsOneWidget);
        expect(find.text("07:10 PM - 08:15 PM"), findsOneWidget);
        expect(
          find.text("PyasePyasePyasePyase"),
          findsOneWidget,
        ); // trimmed location
        expect(
          find.text("Testing for the Event Card Widget"),
          findsOneWidget,
        ); // event description
        expect(find.text("1"), findsOneWidget);
      });
    });

    testWidgets('Check for Created Row visibility', (tester) async {
      mockNetworkImages(() async {
        final event = getEvent();
        userConfig.currentUser.id = event.creator!.id;
        await tester.pumpWidget(createCustomEventCard(event));
        await tester.pump();
        final BuildContext ctx = tester.element(find.byType(EventCard));
        expect(find.byIcon(Icons.verified), findsOneWidget);
        expect(
          find.text(AppLocalizations.of(ctx)!.strictTranslate('Created')),
          findsOneWidget,
        );
      });
    });

    testWidgets(
        'should not show Created row and verified icon when current user is not the event creator',
        (tester) async {
      mockNetworkImages(() async {
        final event = getEvent();
        userConfig.currentUser.id = "nonCreatorId";
        await tester.pumpWidget(createCustomEventCard(event));
        await tester.pump();
        final BuildContext ctx = tester.element(find.byType(EventCard));
        expect(find.byIcon(Icons.verified), findsNothing);
        expect(
          find.text(AppLocalizations.of(ctx)!.strictTranslate('Created')),
          findsNothing,
        );
      });
    });
  });
}
