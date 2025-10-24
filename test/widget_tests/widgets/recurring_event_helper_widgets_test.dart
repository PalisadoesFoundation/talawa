// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/recurring_event_helper_widgets.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_helpers.mocks.dart';
import '../../helpers/test_locator.dart';

/// Widget for testing CustomRectangle wrapped with MaterialApp.
Widget createCustomRectangleWidget({required Widget child}) {
  return MaterialApp(
    home: Scaffold(
      body: CustomRectangle(child: child),
    ),
  );
}

/// Widget for testing CustomTextField wrapped with MaterialApp.
Widget createCustomTextFieldWidget({
  int? maxTextLength,
  required TextEditingController textEditingController,
  bool readOnly = false,
  bool? enabled,
}) {
  return MaterialApp(
    home: Scaffold(
      body: CustomTextField(
        maxTextLength: maxTextLength,
        textEditingController: textEditingController,
        readOnly: readOnly,
        enabled: enabled,
      ),
    ),
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    locator<SizeConfig>().test();
  });

  group('CustomRectangle Widget Tests', () {
    testWidgets('Should render child widget with custom decoration',
        (WidgetTester tester) async {
      const testChild = Text('Test Child');

      await tester.pumpWidget(createCustomRectangleWidget(child: testChild));

      // Check if child widget is rendered
      expect(find.text('Test Child'), findsOneWidget);

      // Check if Container with decoration is present
      expect(find.byType(Container), findsOneWidget);

      // Check if the child is centered
      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets('Should apply correct decoration properties',
        (WidgetTester tester) async {
      const testChild = Icon(Icons.star);

      await tester.pumpWidget(createCustomRectangleWidget(child: testChild));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration! as BoxDecoration;

      // Check if decoration has border
      expect(decoration.border, isA<Border>());
      expect(decoration.borderRadius, isA<BorderRadius>());
    });
  });

  group('CustomTextField Widget Tests', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets('Should render with basic properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCustomTextFieldWidget(
          textEditingController: controller,
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });

    testWidgets('Should have correct input properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCustomTextFieldWidget(
          textEditingController: controller,
          maxTextLength: 5,
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(textField.textAlign, TextAlign.center);
      expect(textField.keyboardType, TextInputType.number);
      expect(textField.inputFormatters, isA<List<TextInputFormatter>>());
      expect(textField.maxLength, 5);
    });

    testWidgets('Should accept numeric input only',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCustomTextFieldWidget(
          textEditingController: controller,
        ),
      );

      // Try to enter numeric input
      await tester.enterText(find.byType(TextField), '123');
      expect(controller.text, '123');

      // Clear and try to enter non-numeric input
      controller.clear();
      await tester.enterText(find.byType(TextField), 'abc');
      expect(controller.text, ''); // Should be empty due to digit filter
    });

    testWidgets('Should respect enabled property', (WidgetTester tester) async {
      await tester.pumpWidget(
        createCustomTextFieldWidget(
          textEditingController: controller,
          enabled: false,
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, false);
    });

    testWidgets('Should respect readOnly property',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCustomTextFieldWidget(
          textEditingController: controller,
          readOnly: true,
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.readOnly, true);
    });

    testWidgets('Should have correct decoration properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCustomTextFieldWidget(
          textEditingController: controller,
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration!;

      expect(decoration.counterText, '');
      expect(
        decoration.contentPadding,
        const EdgeInsets.symmetric(vertical: 14),
      );
      expect(decoration.enabledBorder, isA<OutlineInputBorder>());
      expect(decoration.focusedBorder, isA<OutlineInputBorder>());
      expect(decoration.border, isA<OutlineInputBorder>());
      expect(decoration.disabledBorder, isA<OutlineInputBorder>());
    });
  });

  group('RecurrenceFrequencyDropdown Widget Tests', () {
    late MockCreateEventViewModel mockModel;

    setUp(() {
      mockModel = getAndRegisterCreateEventModel() as MockCreateEventViewModel;
    });

    testWidgets('Should render PopupMenuButton with correct structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecurrenceFrequencyDropdown(
              model: mockModel,
              onSelected: null,
              options: ['Daily', 'Weekly', 'Monthly'],
              selectedOption: 'Weekly',
            ),
          ),
        ),
      );

      // Check if CustomRectangle is present
      expect(find.byType(CustomRectangle), findsOneWidget);

      // Check if Container and Row are present
      expect(find.byType(Container), findsAtLeastNWidgets(1));
      expect(find.byType(Row), findsAtLeastNWidgets(1));

      // Check if PopupMenuButton is present
      expect(find.byType(PopupMenuButton<String>), findsOneWidget);
    });

    testWidgets('Should display selected option text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecurrenceFrequencyDropdown(
              model: mockModel,
              onSelected: null,
              options: ['Daily', 'Weekly', 'Monthly'],
              selectedOption: 'Monthly',
            ),
          ),
        ),
      );

      expect(find.text('Monthly'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
    });
  });

  group('EventEndOptions Widget Tests', () {
    late MockCreateEventViewModel mockModel;

    setUp(() {
      mockModel = getAndRegisterCreateEventModel() as MockCreateEventViewModel;
      when(mockModel.eventEndType).thenReturn(EventEndTypes.never);
      when(mockModel.recurrenceEndDate).thenReturn(null);
      when(mockModel.count).thenReturn(null);
    });

    testWidgets('Should render Column with basic structure',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Check if Column is rendered
      expect(find.byType(Column), findsOneWidget);

      // Check if RadioListTile widgets are present
      expect(find.byType(RadioListTile<String>), findsNWidgets(3));
    });

    testWidgets('Should display event end type texts',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      expect(find.text(EventEndTypes.never), findsOneWidget);
      expect(find.text(EventEndTypes.on), findsOneWidget);
      expect(find.text(EventEndTypes.after), findsOneWidget);
      expect(find.text('occurrence(s)'), findsOneWidget);
    });

    testWidgets('Should render date selector when model has end date',
        (WidgetTester tester) async {
      final testDate = DateTime(2023, 12, 25);
      when(mockModel.recurrenceEndDate).thenReturn(testDate);
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Check if formatted date is displayed
      expect(find.text('Dec 25, 2023'), findsOneWidget);

      // Check if IconButton is present
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('Should render count input field in after option',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.after);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Check if TextField for count is present
      final textFieldFinder = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.decoration?.hintText == '1',
      );
      expect(textFieldFinder, findsOneWidget);

      // Check text field properties
      final textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.textAlign, TextAlign.center);
      expect(textField.keyboardType, TextInputType.number);
      expect(textField.inputFormatters, isNotEmpty);
    });

    testWidgets('Should handle state changes when radio buttons are interacted',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find radio buttons by type
      final radioButtons = find.byType(RadioListTile<String>);
      expect(radioButtons, findsNWidgets(3));

      // Test tapping on a radio button (this tests the onChanged callback exists)
      await tester.tap(radioButtons.first);
      await tester.pumpAndSettle();

      // Widget should rebuild without errors
      expect(find.byType(EventEndOptions), findsOneWidget);
    });

    testWidgets('Should render CustomRectangle widgets',
        (WidgetTester tester) async {
      when(mockModel.recurrenceEndDate).thenReturn(DateTime.now());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Should have CustomRectangle widgets for date picker and count field
      expect(find.byType(CustomRectangle), findsAtLeastNWidgets(1));
    });
  });
}
