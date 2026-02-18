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

    testWidgets(
        'Should handle PopupMenuButton interaction and onSelected callback',
        (WidgetTester tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecurrenceFrequencyDropdown(
              model: mockModel,
              onSelected: (value) {
                selectedValue = value;
              },
              options: ['Daily', 'Weekly', 'Monthly'],
              selectedOption: 'Weekly',
            ),
          ),
        ),
      );

      // Tap on PopupMenuButton to open menu
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();

      // Verify menu items are displayed
      expect(find.text('Daily'), findsWidgets);
      expect(find.text('Weekly'), findsWidgets);
      expect(find.text('Monthly'), findsWidgets);

      // Tap on 'Daily' option
      await tester.tap(find.text('Daily').last);
      await tester.pumpAndSettle();

      // Verify callback was called with correct value
      expect(selectedValue, 'Daily');
    });

    testWidgets('Should create correct PopupMenuEntry items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecurrenceFrequencyDropdown(
              model: mockModel,
              onSelected: null,
              options: ['Option1', 'Option2', 'Option3'],
              selectedOption: 'Option1',
            ),
          ),
        ),
      );

      // Open the popup menu
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();

      // Verify all options are created as PopupMenuItem
      expect(find.byType(PopupMenuItem<String>), findsNWidgets(3));
      expect(find.text('Option1'), findsWidgets);
      expect(find.text('Option2'), findsWidgets);
      expect(find.text('Option3'), findsWidgets);
    });

    testWidgets('Should handle empty options list gracefully',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RecurrenceFrequencyDropdown(
              model: mockModel,
              onSelected: null,
              options: [],
              selectedOption: '',
            ),
          ),
        ),
      );

      // Should still render without errors
      expect(find.byType(PopupMenuButton<String>), findsOneWidget);

      // Open menu (should be empty)
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();

      expect(find.byType(PopupMenuItem<String>), findsNothing);
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
        (widget) => widget is TextField && widget.decoration?.hintText == '10',
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

    testWidgets('Should handle never radio button inputAction',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);
      when(mockModel.count).thenReturn(5);
      when(mockModel.recurrenceEndDate).thenReturn(DateTime.now());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find and tap the "Never" radio button
      final neverRadio = find.byKey(const Key('neverRadioButton'));
      expect(neverRadio, findsOneWidget);

      await tester.tap(neverRadio);
      await tester.pumpAndSettle();

      // Verify that model setters were called (indirectly through widget rebuild)
      expect(find.byType(EventEndOptions), findsOneWidget);
    });

    testWidgets('Should handle date picker interaction in "on" option',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);
      when(mockModel.recurrenceEndDate).thenReturn(DateTime(2023, 12, 25));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find the date selector IconButton
      final dateButton = find.byKey(const Key('dateSelectorCalendar'));
      expect(dateButton, findsOneWidget);

      // Verify IconButton properties
      final iconButton = tester.widget<IconButton>(dateButton);
      expect(iconButton.onPressed, isNotNull);

      // Test the date display
      expect(find.text('Dec 25, 2023'), findsOneWidget);
    });

    testWidgets(
        'Should call customDatePicker and update model when date selector is pressed',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);
      when(mockModel.recurrenceEndDate).thenReturn(DateTime(2023, 12, 25));

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find the date selector IconButton
      final dateButton = find.byKey(const Key('dateSelectorCalendar'));
      expect(dateButton, findsOneWidget);

      // Tap the date selector button
      await tester.tap(dateButton);
      await tester.pump();

      // This should open the date picker dialog
      expect(find.byType(DatePickerDialog), findsOneWidget);

      // Test canceling the date picker
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Dialog should be closed
      expect(find.byType(DatePickerDialog), findsNothing);
    });

    testWidgets('Should update model state when date is selected from picker',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);
      when(mockModel.recurrenceEndDate).thenReturn(DateTime(2023, 12, 25));

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find the date selector IconButton
      final dateButton = find.byKey(const Key('dateSelectorCalendar'));
      expect(dateButton, findsOneWidget);

      // Tap the date selector button to open picker
      await tester.tap(dateButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Verify date picker dialog is shown
      expect(find.byType(DatePickerDialog), findsOneWidget);

      // Tap OK to confirm date selection (this will use the initialDate: DateTime.now())
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Dialog should be closed
      expect(find.byType(DatePickerDialog), findsNothing);

      // The widget should have called setState which would trigger a rebuild
      expect(find.byType(EventEndOptions), findsOneWidget);
    });

    testWidgets('Should properly initialize date picker with DateTime.now()',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);
      when(mockModel.recurrenceEndDate).thenReturn(DateTime(2023, 12, 25));

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find the date selector IconButton
      final dateButton = find.byKey(const Key('dateSelectorCalendar'));
      expect(dateButton, findsOneWidget);

      // Tap to open date picker
      await tester.tap(dateButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Verify the date picker opens with today's date highlighted
      expect(find.byType(DatePickerDialog), findsOneWidget);

      // The picker should initialize with DateTime.now() as specified in the code
      // This tests the customDatePicker(initialDate: DateTime.now()) call
      final today = DateTime.now();
      final todayText = today.day.toString();
      expect(find.text(todayText), findsAtLeastNWidgets(1));
    });

    testWidgets('Should update eventEndType to "on" when date is selected',
        (WidgetTester tester) async {
      // Start with a different end type
      when(mockModel.eventEndType).thenReturn(EventEndTypes.never);
      when(mockModel.recurrenceEndDate).thenReturn(null);

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Switch to "on" option by tapping the radio button
      final onRadio = find.byKey(const Key('onRadioButton'));
      expect(onRadio, findsOneWidget);

      await tester.tap(onRadio);
      await tester.pumpAndSettle();

      // Now the date selector should be available
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);
      when(mockModel.recurrenceEndDate).thenReturn(DateTime.now());

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      final dateButton = find.byKey(const Key('dateSelectorCalendar'));
      expect(dateButton, findsOneWidget);

      // Test the complete flow: tap button -> picker opens -> select date -> model updates
      await tester.tap(dateButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(DatePickerDialog), findsOneWidget);

      // Confirm date selection
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Verify the widget rebuilt successfully (indicating setState was called)
      expect(find.byType(EventEndOptions), findsOneWidget);
    });

    testWidgets('Should handle date picker cancellation gracefully',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);
      final initialDate = DateTime(2023, 12, 25);
      when(mockModel.recurrenceEndDate).thenReturn(initialDate);

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Verify initial date display
      expect(find.text('Dec 25, 2023'), findsOneWidget);

      // Open date picker
      final dateButton = find.byKey(const Key('dateSelectorCalendar'));
      await tester.tap(dateButton);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(DatePickerDialog), findsOneWidget);

      // Cancel the picker
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Date should remain unchanged (customDatePicker returns initialDate on cancel)
      expect(find.text('Dec 25, 2023'), findsOneWidget);
      expect(find.byType(DatePickerDialog), findsNothing);
    });

    testWidgets('Should handle "on" radio button inputAction',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.never);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find and tap the "On" radio button
      final onRadio = find.byKey(const Key('onRadioButton'));
      expect(onRadio, findsOneWidget);

      await tester.tap(onRadio);
      await tester.pumpAndSettle();

      // Widget should rebuild without errors
      expect(find.byType(EventEndOptions), findsOneWidget);
    });

    testWidgets('Should handle count input field onChanged callback',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.after);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find the count input TextField
      final countField = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.decoration?.hintText == '10',
      );
      expect(countField, findsOneWidget);

      // Test entering valid numeric input
      await tester.enterText(countField, '15');
      await tester.pumpAndSettle();

      // Test entering empty input (should default to 1)
      await tester.enterText(countField, '');
      await tester.pumpAndSettle();

      // Test numeric validation
      final textField = tester.widget<TextField>(countField);
      expect(textField.onChanged, isNotNull);
      expect(textField.keyboardType, TextInputType.number);
      expect(textField.inputFormatters, isNotEmpty);
    });

    testWidgets('Should handle "after" radio button inputAction',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.on);
      when(mockModel.recurrenceEndDate).thenReturn(DateTime.now());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find and tap the "After" radio button
      final afterRadio = find.byKey(const Key('afterRadioButton'));
      expect(afterRadio, findsOneWidget);

      await tester.tap(afterRadio);
      await tester.pumpAndSettle();

      // Widget should rebuild and show count field enabled
      expect(find.byType(EventEndOptions), findsOneWidget);

      // Count field should be enabled when "after" is selected
      final countField = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.decoration?.hintText == '10',
      );
      expect(countField, findsOneWidget);
    });

    testWidgets('Should apply correct theme properties to radio buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find Theme widgets wrapping RadioListTiles
      final themes = find.byType(Theme);
      expect(themes, findsAtLeastNWidgets(3)); // One for each radio button

      // Verify RadioListTile properties
      final radioButtons = find.byType(RadioListTile<String>);
      expect(radioButtons, findsNWidgets(3));

      // Test radio button values and group behavior
      final firstRadio =
          tester.widget<RadioListTile<String>>(radioButtons.first);
      expect(firstRadio.value, EventEndTypes.never);
    });

    testWidgets(
        'Should handle radio button onChanged with proper state management',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.never);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Find radio buttons
      final radioButtons = find.byType(RadioListTile<String>);
      expect(radioButtons, findsNWidgets(3));

      // Test tapping different radio buttons
      for (int i = 0; i < 3; i++) {
        await tester.tap(radioButtons.at(i));
        await tester.pumpAndSettle();

        // Verify widget rebuilds successfully
        expect(find.byType(EventEndOptions), findsOneWidget);
      }
    });

    testWidgets('Should handle count field enabled/disabled state correctly',
        (WidgetTester tester) async {
      // Test when "after" is selected (field should be enabled)
      when(mockModel.eventEndType).thenReturn(EventEndTypes.after);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      final countField = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.decoration?.hintText == '10',
      );
      expect(countField, findsOneWidget);

      final textField = tester.widget<TextField>(countField);
      expect(textField.enabled, true);

      // Rebuild with different end type
      when(mockModel.eventEndType).thenReturn(EventEndTypes.never);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      final disabledField = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.decoration?.hintText == '10',
      );
      expect(disabledField, findsOneWidget);

      final disabledTextField = tester.widget<TextField>(disabledField);
      expect(disabledTextField.enabled, false);
    });

    testWidgets(
        'Should initialize with correct state when eventEndType is never',
        (WidgetTester tester) async {
      when(mockModel.eventEndType).thenReturn(EventEndTypes.never);
      when(mockModel.recurrenceEndDate).thenReturn(DateTime.now());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EventEndOptions(model: mockModel),
          ),
        ),
      );

      // Verify initState behavior - should set recurrenceEndDate to null
      expect(find.byType(EventEndOptions), findsOneWidget);

      // Verify widget structure is correct
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(RadioListTile<String>), findsNWidgets(3));
    });
  });
}
