// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_form.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_page.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';

var createEventViewModel = CreateEventViewModel();

// TextEditingController eventTitleTextController = TextEditingController();
// createEventViewModel.eventTitleTextController = eventTitleTextController;

Widget createCreateEventForm() {
  final createEventViewModel = CreateEventViewModel();
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
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
    home: Scaffold(body: CreateEventForm(model: createEventViewModel)),
  );
}

Widget createEventScreen({
  ThemeMode themeMode = ThemeMode.light,
  required ThemeData theme,
}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, langModel, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: theme,
          home: const CreateEventPage(
            key: Key('CreateEventScreen'),
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

void main() {
  SizeConfig().test();
  locator.registerSingleton(NavigationService());
  setUp(() {
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  testWidgets("Test if create event form shows up",
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(createCreateEventForm());
      await tester.pump();
      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(
        find.descendant(
          of: find.byType(Form),
          matching: find.byType(TextFormField),
        ),
        findsNWidgets(3),
      );
    });
  });

  testWidgets("Test if create event key are working",
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(createCreateEventForm());
      await tester.pump();
      expect(find.byKey(const Key('create_event_form_tff1')), findsOneWidget);
      expect(find.byKey(const Key('create_event_form_tff2')), findsOneWidget);
      expect(find.byKey(const Key('create_event_form_tff3')), findsOneWidget);
    });
  });

  testWidgets("Test if gesture detector is working",
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(createCreateEventForm());
      await tester.pump();
      final gestureDetector = find.byKey(const Key('gesture_cef_test'));
      await tester.tap(gestureDetector);
      await tester.pump();
      expect(find.byKey(const Key('gesture_cef_test')), findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    });
  });

//---------------------------------------------------
  testWidgets(
      'Test if form of 1st TextField is submitted on pressing enter on mobile keyboard.',
      (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(createCreateEventForm());
      await tester.pump();

      await tester.enterText(
        find.byKey(const Key('create_event_form_tff1')),
        'fakeEventTitle',
      );
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump();
    });
  });
  testWidgets(
      'Test if form of 2nd TextField is submitted on pressing enter on mobile keyboard.',
      (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(createCreateEventForm());
      await tester.pump();

      await tester.enterText(
        find.byKey(const Key('create_event_form_tff2')),
        'fakeEventTitle',
      );
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump();
    });
  });
  testWidgets(
      'Test if form of 3rd TextField is submitted on pressing enter on mobile keyboard.',
      (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(createCreateEventForm());
      await tester.pump();

      await tester.enterText(
        find.byKey(const Key('create_event_form_tff3')),
        'fakeEventTitle',
      );
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.next);
      await tester.pump();
    });
  });
}
