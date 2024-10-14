// ignore_for_file: talawa_api_doc
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
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
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
  });
}
