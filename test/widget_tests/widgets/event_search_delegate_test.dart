import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_card.dart';
import 'package:talawa/widgets/event_search_delegate.dart';

import '../../helpers/test_helpers.dart';
// import '../../helpers/test_locator.dart';

Widget createEventSearch() {
  return MaterialApp(
    home: Scaffold(
        body: BaseView<ExploreEventsViewModel>(
            onModelReady: (model) => model.initialise(),
            builder: (context, model, child) {
              return IconButton(
                onPressed: () {
                  print(model.events);
                  showSearch(
                    context: context,
                    delegate: EventSearch(
                      eventList: model.events,
                      exploreEventsViewModel: model,
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              );
            })),
  );
}

void main() {
  // testSetupLocator();

  setUp(() {
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  group('Test for EventSearch Delegate', () {
    testWidgets('Check if EventSearch shows up', (tester) async {
      await tester.pumpWidget(createEventSearch());
      await tester.pump();
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byIcon(Icons.clear), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
    // testWidgets('Check if back button works fine', (tester) async {
    //   await tester.pumpWidget(createEventSearch());
    //   await tester.pump();
    //   await tester.tap(find.byIcon(Icons.search));
    //   await tester.pumpAndSettle();

    //   final x = find.descendant(
    //     of: find.byType(AppBar),
    //     matching: find.byType(IconButton),
    //   );
    //   print(x);
    //   await tester.tap(x.first);
    //   await tester.pumpAndSettle();

    //   expect(find.byIcon(Icons.arrow_back), findsNothing);
    // });
    testWidgets('Check if typing in textfield works', (tester) async {
      await tester.pumpWidget(createEventSearch());
      await tester.pump();
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      final textfield = find.byType(TextField);
      await tester.enterText(textfield, 'test');
      await tester.pumpAndSettle();

      expect(find.byType(EventCard), findsOneWidget);
    });
  });
}
