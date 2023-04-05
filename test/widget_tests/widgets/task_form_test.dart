// ignore_for_file: talawa_api_doc

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';
import 'package:talawa/widgets/task_form.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

/// OnSaveCallback class provides a simple call function to test callbacks.
///
/// Services include:
/// * `call` : mock function to test callback
class OnSaveCallback {
  void call() {}
}

/// MockOnSaveCallback class is the mocked version of OnSaveCallback.
///
/// Services include:
class MockOnSaveCallback extends Mock implements OnSaveCallback {}

/// The object created for MockOnSaveCallback.
MockOnSaveCallback mockOnSaveCallback = MockOnSaveCallback();

/// This function is used to return TaskFormWidget for testing.
///
/// **params**:
///   None
///
/// **returns**:
/// * `Widget`: TaskForm Widget for testing.

Widget createTaskFormWidget() {
  return BaseView<CreateTaskViewModel>(
    onModelReady: (model) {},
    builder: (context, model, child) {
      return MaterialApp(
        key: const Key('Root'),
        navigatorKey: locator<NavigationService>().navigatorKey,
        navigatorObservers: [],
        locale: const Locale('en'),
        supportedLocales: [
          const Locale('en', 'US'),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: TaskForm(
            onSave: () async {
              mockOnSaveCallback.call();
              return true;
            },
            title: "TITLE",
            actionText: "ACTION",
          ),
        ),
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

void callback() {}

void main() {
  testSetupLocator();
  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Test datetime callbacks', () {
    testWidgets(
      "Check DateTimeTile setTime and setDate callback",
      (tester) async {
        await tester.pumpWidget(createTaskFormWidget());
        await tester.pumpAndSettle();
        final dateTimeTile = find.byType(DateTimeTile);
        final datePicker = find.byKey(const Key("EventDateTimeTileDate"));
        final timePicker = find.byKey(const Key("EventDateTimeTileTime"));

        expect(dateTimeTile, findsOneWidget);
        expect(datePicker, findsOneWidget);
        expect(timePicker, findsOneWidget);

        await tester.tap(timePicker);
        await tester.pumpAndSettle();
        expect(find.text("OK"), findsOneWidget);
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        await tester.tap(timePicker);
        await tester.pumpAndSettle();
        expect(find.text("OK"), findsOneWidget);
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();
      },
    );
  });

  group("Widget Tests for TaskForm", () {
    testWidgets("Check if TaskForm shows up", (tester) async {
      await tester.pumpWidget(createTaskFormWidget());
      await tester.pumpAndSettle();

      expect(find.byType(TaskForm), findsOneWidget);
    });

    testWidgets("Check if all children show up correctly", (tester) async {
      await tester.pumpWidget(createTaskFormWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsWidgets);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Scrollbar), findsOneWidget);
      expect(find.byType(TitleField), findsOneWidget);
      expect(find.byType(DescriptionField), findsOneWidget);
    });

    testWidgets("Check if all update button work", (tester) async {
      await tester.pumpWidget(createTaskFormWidget());
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TitleField), "title");
      await tester.enterText(find.byType(DescriptionField), "description");
      await tester.tap(find.byType(TextButton));

      verify(mockOnSaveCallback.call());
    });
  });
}
