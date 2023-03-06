// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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
    title: "Testing",
    location: "PyasePyasePyasePyasePyasePyase",
    description: "Testing for the Event Card Widget",
    startDate: "13 Dec",
    endDate: "13 Dec",
    startTime: "07:10PM",
    endTime: "08:15PM",
    isPublic: isPublic,
    isRegistered: isRegistered,
    attendees: "96",
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
  SizeConfig().test();
  testSetupLocator();

  TestWidgetsFlutterBinding.ensureInitialized();

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

        expect(find.text("13 Dec - 13 Dec"), findsOneWidget); // duration date
        expect(find.text("07:10PM - 08:15PM"), findsOneWidget); // duration time
        expect(
          find.text("PyasePyasePyasePyase"),
          findsOneWidget,
        ); // trimmed location
        expect(
          find.text("Testing for the Event Card Widget"),
          findsOneWidget,
        ); // event description
        expect(find.text("96"), findsOneWidget);
      });
    });
  });
}
