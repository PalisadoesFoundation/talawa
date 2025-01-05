// ignore_for_file: talawa_api_doc

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_item.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/edit_agenda_item_page.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createEditAgendaItemScreen() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return BaseView<EditAgendaItemViewModel>(
        onModelReady: (model) {
          model.initialize(testAgendaItem, testCategories);
        },
        builder: (context, model, child) {
          return MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: [
              const AppLocalizationsDelegate(isTest: true),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: Scaffold(
              body: EditAgendaItemPage(
                agendaItem: testAgendaItem,
                categories: testCategories,
              ),
            ),
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: router.generateRoute,
          );
        },
      );
    },
  );
}

EventAgendaItem testAgendaItem = EventAgendaItem(
  id: '1',
  title: 'Test Agenda Item',
  description: 'Test Description',
  duration: '00:30',
  categories: [],
  attachments: [],
  urls: [],
);

List<AgendaCategory> testCategories = [
  AgendaCategory(id: '1', name: 'Category 1'),
  AgendaCategory(id: '2', name: 'Category 2'),
];

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('EditAgendaItemPage Widget Tests', () {
    testWidgets("Check if edit agenda item screen shows up", (tester) async {
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      expect(find.byType(EditAgendaItemPage), findsOneWidget);
    });

    testWidgets('Category selection works correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DropdownButtonFormField<AgendaCategory>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Category 1').last);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('Category 1')), findsOneWidget);
    });

    testWidgets('Update button works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();

      expect(find.text("No changes made"), findsOneWidget);

      await tester.tap(find.byType(DropdownButtonFormField<AgendaCategory>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Category 1').last);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();
      expect(find.byType(EditAgendaItemPage), findsNothing);
    });

    testWidgets('Add URL works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('urlTextField')),
        'https://example.com',
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('https://example.com')), findsOneWidget);
    });

    testWidgets('Add Attachments button works correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add Attachments'));
      await tester.pumpAndSettle();
    });

    testWidgets('Remove a selected category', (WidgetTester tester) async {
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      // Step 1: Select a category
      await tester.tap(find.byType(DropdownButtonFormField<AgendaCategory>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Category 1').last);
      await tester.pumpAndSettle();

      // Verify the category was added
      expect(find.byKey(const Key('Category 1')), findsOneWidget);

      // Step 2: Remove the selected category
      await tester.tap(find.byType(DropdownButtonFormField<AgendaCategory>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Category 1').last);
      await tester.pumpAndSettle();

      // Verify the category was removed
      expect(find.byKey(const Key('Category 1')), findsNothing);
    });

    testWidgets('Chip onDeleted removes a category',
        (WidgetTester tester) async {
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      // Step 1: Add a category to the selected categories
      await tester.tap(find.byType(DropdownButtonFormField<AgendaCategory>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Category 1').last);
      await tester.pumpAndSettle();

      // Verify the category was added and is displayed as a Chip
      expect(find.byKey(const Key('Category 1')), findsOneWidget);

      // Step 2: Trigger the onDeleted callback by specifically finding the delete icon
      final deleteButtonFinder = find.descendant(
        of: find.byKey(const Key('Category 1')),
        matching: find.byIcon(
          Icons.cancel,
        ), // Adjust to match the delete icon used in the Chip
      );

      expect(
        deleteButtonFinder,
        findsOneWidget,
      ); // Ensure there's exactly one match
      await tester.tap(deleteButtonFinder);
      await tester.pumpAndSettle();

      // Step 3: Verify the category was removed
      expect(find.byKey(const Key('Category 1')), findsNothing);
    });

    testWidgets('TextFormField displays error message when input is empty',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      // Find the TextFormField
      final textFormField = find.byKey(const Key('edit_event_agenda_duration'));
      expect(textFormField, findsOneWidget);

      // Simulate user entering empty text
      await tester.enterText(textFormField, '');
      await tester.pumpAndSettle();

      // Since we're not using a Form, we need to manually trigger the validator
      // by accessing the FormFieldState and calling validate()
      final formFieldState =
          tester.state<FormFieldState<String>>(textFormField);
      formFieldState.validate();
      await tester.pumpAndSettle();

      // Check for the error message
      expect(find.text('Please enter a duration'), findsOneWidget);
    });

    testWidgets('Agenda Item Title Validation', (WidgetTester tester) async {
      // Title validation rules:
      // - Must not be empty
      // - Must contain at least one letter (A-Z or a-z)
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      // Locate the TextFormField using its Key
      final titleField = find.byKey(const Key('edit_event_agenda_tf1'));
      expect(titleField, findsOneWidget);

      // Simulate user entering empty text and trigger validation
      await tester.enterText(titleField, '');
      await tester.pumpAndSettle();
      final emptyFieldState = tester.state<FormFieldState<String>>(titleField);
      emptyFieldState.validate();
      await tester.pumpAndSettle();

      // Verify the error message for an empty title
      expect(find.text('Title must not be left blank.'), findsOneWidget);

      // Simulate user entering an invalid title (numbers only) and trigger validation
      await tester.enterText(titleField, '12345');
      await tester.pumpAndSettle();
      final invalidFieldState =
          tester.state<FormFieldState<String>>(titleField);
      invalidFieldState.validate();
      await tester.pumpAndSettle();

      // Verify the error message for an invalid title
      expect(find.text('Invalid Title'), findsOneWidget);

      // Simulate user entering a valid title and trigger validation
      await tester.enterText(titleField, 'Team Meeting');
      await tester.pumpAndSettle();
      final validFieldState = tester.state<FormFieldState<String>>(titleField);
      validFieldState.validate();
      await tester.pumpAndSettle();

      // Verify no error message is shown for valid title
      expect(find.text('Invalid Title'), findsNothing);
      expect(find.text('Title must not be left blank.'), findsNothing);
    });

    testWidgets('Agenda Item Description Validation',
        (WidgetTester tester) async {
      // Description validation rules:
      // - Must not be empty
      // - Must contain valid characters (add specific rules here)
      await tester.pumpWidget(createEditAgendaItemScreen());
      await tester.pumpAndSettle();

      // Locate the TextFormField using its Key
      final descriptionField = find.byKey(const Key('edit_event_agenda_tf2'));
      expect(descriptionField, findsOneWidget);

      // Simulate user entering an invalid description and trigger validation
      await tester.enterText(descriptionField, '');
      await tester.pumpAndSettle();
      final emptyFieldState =
          tester.state<FormFieldState<String>>(descriptionField);
      emptyFieldState.validate();
      await tester.pumpAndSettle();

      // Verify the error message for an empty description
      expect(find.text('Description must not be left blank.'), findsOneWidget);

      // Simulate user entering an invalid title and trigger validation
      await tester.enterText(descriptionField, '12345');
      await tester.pumpAndSettle();
      final invalidFieldState =
          tester.state<FormFieldState<String>>(descriptionField);
      invalidFieldState.validate();
      await tester.pumpAndSettle();

      // Verify the error message for an invalid description
      expect(find.text('Invalid Description'), findsOneWidget);

      // Test valid description
      await tester.enterText(descriptionField, 'Valid Description');
      await tester.pumpAndSettle();
      final validFieldState =
          tester.state<FormFieldState<String>>(descriptionField);
      validFieldState.validate();
      await tester.pumpAndSettle();
      expect(find.text('Invalid Description'), findsNothing);
    });
  });
}
