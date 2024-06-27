import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

/// Instance of callback function.
class MockCallbackFunction extends Mock {
  /// Callback function.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void call();
}

/// A callback function to set date.
final setDateCallback = MockCallbackFunction();

/// A callback function to set time.
final setTimeCallback = MockCallbackFunction();

/// Creates a widget for testing.
///
/// **params**:
///   None
///
/// **returns**:
/// * `Widget`: Returns mocked Material App Widget
Widget createWidget() {
  return MaterialApp(
    home: Scaffold(
      body: DateTimeTile(
        isAllDay: false,
        date: "fakeDate",
        time: "fakeTime",
        setDate: setDateCallback,
        setTime: setTimeCallback,
      ),
    ),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<SizeConfig>().test();
  });

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Tests for DateTimeTile widget', () {
    testWidgets('Checking if the widget shows up', (tester) async {
      await tester.pumpWidget(createWidget());
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets("Checking padding", (tester) async {
      await tester.pumpWidget(createWidget());

      final paddingFinder = find.byType(Padding);
      final padding = tester.firstWidget(paddingFinder);

      expect(paddingFinder, findsOneWidget);
      expect(
        (padding as Padding).padding,
        EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.083),
      );
    });

    testWidgets("Checking tap Inkwell for setDate", (tester) async {
      await tester.pumpWidget(createWidget());

      final inkwellFinder = find.byType(InkWell).first;

      await tester.tap(inkwellFinder);
      await tester.pump();

      expect(inkwellFinder, findsOneWidget);

      verify(setDateCallback());
    });

    testWidgets("Checking tap Inkwell for setTime", (tester) async {
      await tester.pumpWidget(createWidget());

      final inkwellFinder = find.byType(InkWell).last;

      await tester.tap(inkwellFinder);
      await tester.pump();

      expect(inkwellFinder, findsOneWidget);

      verify(setTimeCallback());
    });

    testWidgets("Testing the icons", (tester) async {
      await tester.pumpWidget(createWidget());

      final iconFinder = find.byType(Icon);
      final icon = tester.firstWidget(iconFinder);

      expect(
        (icon as Icon).color,
        const Color(0xff524F4F),
      );
      expect(
        icon.size,
        19,
      );
      expect(
        icon.icon,
        Icons.calendar_today,
      );

      final iconFinder2 = find.byType(Icon).last;
      final icon2 = tester.firstWidget(iconFinder2);

      expect(
        (icon2 as Icon).color,
        const Color(0xff524F4F),
      );
      expect(
        icon2.size,
        19,
      );
      expect(
        icon2.icon,
        Icons.schedule,
      );
    });

    testWidgets("Testing text widgets", (tester) async {
      await tester.pumpWidget(createWidget());
      final textFinder = find.byType(Text).first;
      final text = tester.firstWidget(textFinder);

      expect(
        (text as Text).data,
        "fakeDate",
      );
      expect(
        text.style,
        const TextStyle(fontSize: 16),
      );

      final textFinder2 = find.byType(Text).last;
      final text2 = tester.firstWidget(textFinder2);

      expect(
        (text2 as Text).data,
        "fakeTime",
      );
      expect(
        text2.style,
        const TextStyle(fontSize: 16),
      );
    });
  });
}
