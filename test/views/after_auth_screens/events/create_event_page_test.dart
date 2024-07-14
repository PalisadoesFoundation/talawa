import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_page.dart';
import 'package:talawa/views/after_auth_screens/events/venue_bottom_sheet.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/recurrence_dialog.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';
import '../../../widget_tests/after_auth_screens/events/create_event_form_test.dart';

/// Mock class instance of CallbackFunction.
class MockCallbackFunction extends Mock {
  /// Mock function call.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void call();
}

/// mock instance for setDateCallback.
final setDateCallback = MockCallbackFunction();

/// mock instance for setTimeCallback.
final setTimeCallback = MockCallbackFunction();

/// Creates a EventScreen for tests.
///
/// **params**:
/// * `themeMode`: ThemeMode
/// * `theme`: ThemeData of App
///
/// **returns**:
/// * `Widget`: Event Screen Widget
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
          home: const Scaffold(
            body: CreateEventPage(
              key: Key('CreateEventScreen'),
            ),
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });
  group('testing -> CreateEventPage', () {
    testWidgets("Checking tap Inkwell for setDate 1 datetime", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );

      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      final inkwellFinder = find.byType(InkWell);
      expect(inkwellFinder, findsNWidgets(8));

      final file = File('fakePath');

      final multimediaPickerService = locator<MultiMediaPickerService>();

      when(multimediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((_) async {
        return file;
      });

      await tester.tap(inkwellFinder.at(1));
      await tester.pump();
    });

    testWidgets("Checking tap Inkwell for setTime 1 datetime", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      final inkwellFinder = find.byType(InkWell);
      expect(inkwellFinder, findsNWidgets(8));

      final file = File('fakePath');

      final multimediaPickerService = locator<MultiMediaPickerService>();

      when(multimediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((_) async {
        return file;
      });

      await tester.tap(inkwellFinder.at(2));
      await tester.pump();
    });
    testWidgets('Test Add Button', (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      when(userConfig.loggedIn).thenReturn(true);

      final addBtn = find.byKey(const Key('addButton'));

      await tester.tap(addBtn);
      await tester.pumpAndSettle();

      expect(createEventViewModel.validate, AutovalidateMode.disabled);
    });

    testWidgets('recurrence button', (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      const String prev = "Does not repeat";

      expect(find.text(prev), findsAny);
      await tester.ensureVisible(find.byKey(const Key("inkwell_recurrLabel")));
      await tester.tap(find.text(prev));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Custom..."));
      await tester.pumpAndSettle();

      expect(find.byType(ShowRecurrenceDialog), findsNothing);
    });

    testWidgets("Checking tap Inkwell for setDate 2 datetime", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );

      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      final inkwellFinder = find.byType(InkWell);
      expect(inkwellFinder, findsNWidgets(8));

      final file = File('fakePath');

      final multimediaPickerService = locator<MultiMediaPickerService>();

      when(multimediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((_) async {
        return file;
      });

      await tester.tap(inkwellFinder.at(3));
      await tester.pump();
    });

    testWidgets("Checking tap Inkwell for set time 2 datetime", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );

      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      final inkwellFinder = find.byType(InkWell);
      expect(inkwellFinder, findsNWidgets(8));

      final file = File('fakePath');

      final multimediaPickerService = locator<MultiMediaPickerService>();

      when(multimediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((_) async {
        return file;
      });

      await tester.tap(inkwellFinder.at(4));
      await tester.pump();
    });

    testWidgets('checks if the upload photo from  button shows correct icon',
        (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pump();

      final finder = find.byKey(const Key('txt_btn_cep'));

      expect(finder, findsOneWidget);
      final file = File('fakePath');
      final multimediaPickerServices = locator<MultiMediaPickerService>();

      when(multimediaPickerServices.getPhotoFromGallery())
          .thenAnswer((_) async {
        return file;
      });

      await tester.tap(finder);
      await tester.pump();

      expect(finder, findsOneWidget);
    });

    testWidgets(
        'checks if the uploaded photo from gallery button is removed after pressing remove button',
        (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pump();

      /// using the key of icon button
      /// because their are many icon button

      final finder = find.byKey(const Key('txt_btn_cep'));

      final cancelBtn = find.byIcon(Icons.cancel);

      expect(finder, findsOneWidget);

      final file = File('fakePath');

      final multimediaPickerService = locator<MultiMediaPickerService>();

      when(multimediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((_) async {
        return file;
      });

      await tester.tap(finder);
      await tester.pump();

      await tester.tap(cancelBtn);
      await tester.pump();
    });

    testWidgets("Testing All day section", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();
      final appLocalization = AppLocalizations.of(
        navigationService.navigatorKey.currentContext!,
      );
      final allDayText = find.descendant(
        of: find.byType(Row),
        matching: find.text(
          appLocalization!.strictTranslate('All day'),
        ),
      );
      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(allDayText, findsOneWidget);
      expect(switches, findsNWidgets(3));
      expect(
        (tester.widget(allDayText) as Text?)?.style!.fontSize,
        16,
      );
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(0));
      await tester.pumpAndSettle();
      expect((tester.widgetList(switches).toList()[0] as Switch).value, false);
    });

    testWidgets("Testing Keep Registerable section", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();
      final appLocalization = AppLocalizations.of(
        navigationService.navigatorKey.currentContext!,
      );
      final keepRegisterableText = find.descendant(
        of: find.byType(Row),
        matching: find.text(
          appLocalization!.strictTranslate('Keep Registerable'),
        ),
      );
      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(keepRegisterableText, findsOneWidget);
      expect(switches, findsNWidgets(3));
      expect(
        (tester.widget(keepRegisterableText) as Text?)?.style!.fontSize,
        16,
      );
      expect((tester.widgetList(switches).toList()[1] as Switch).value, true);
      await tester.ensureVisible(switches.at(1));
      await tester.tap(switches.at(1));
      await tester.pumpAndSettle();
      expect((tester.widgetList(switches).toList()[1] as Switch).value, false);
    });

    testWidgets("Testing Keep public section", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();
      final appLocalization = AppLocalizations.of(
        navigationService.navigatorKey.currentContext!,
      );
      final keepPublicText = find.descendant(
        of: find.byType(Row),
        matching: find.text(
          appLocalization!.strictTranslate('Keep Public'),
        ),
      );
      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(keepPublicText, findsOneWidget);
      expect(switches, findsNWidgets(3));
      expect(
        (tester.widget(keepPublicText) as Text?)?.style!.fontSize,
        16,
      );
      expect((tester.widgetList(switches).toList()[2] as Switch).value, true);
      await tester.ensureVisible(switches.at(2));
      await tester.tap(switches.at(2));
      await tester.pumpAndSettle();
      expect((tester.widgetList(switches).toList()[2] as Switch).value, false);
    });

    // testWidgets("Checking tap Inkwell work for admin list", (tester) async {
    //   await tester.pumpWidget(
    //     createEventScreen(
    //       themeMode: ThemeMode.dark,
    //       theme: TalawaTheme.darkTheme,
    //     ),
    //   );
    //   await tester.pump();
    //   final inkwellFinder = find.byType(InkWell);
    //   expect(inkwellFinder, findsNWidgets(8));

    //   ///returning the file variable to the
    //   ///result of function multimediaPickerService.getPhotoFromGallery
    //   ///when this function is called in the
    //   ///view model of add_post_page.
    //   final file = File('fakePath');

    //   /// using the new instance of multimediaPickerService
    //   /// so that when statement can be used again,
    //   /// else it gives null point exception
    //   final multimediaPickerService = locator<MultiMediaPickerService>();

    //   /// when is function provided by mockito lib
    //   when(multimediaPickerService.getPhotoFromGallery(camera: false))
    //       .thenAnswer((_) async {
    //     return file;
    //   });

    //   await tester.ensureVisible(find.byKey(const Key('inwell_cep1')));
    //   await tester.pumpAndSettle();

    //   await tester.tap(find.byKey(const Key('inwell_cep1')));
    //   await tester.pump();

    //   //TODO: implement Rest of the test when the _adminCheckedMap or _memberCheckedMap return true for some id
    //   //TODO: for not it return false for all the ordMember.id
    //   //
    //   // orgMembersList.forEach((orgMember) {
    //   //   if (isAdmin) {
    //   //     _adminCheckedMap.putIfAbsent(orgMember.id!, () => false);
    //   //   } else {
    //   //     _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    //   //   }
    //   //   _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    //   // });
    // });

    testWidgets("Checking tap Inkwell for second add to bottom sheet",
        (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );

      await tester.pumpAndSettle();

      final switches = find.descendant(
        of: find.byType(Row),
        matching: find.byType(Switch),
      );
      expect(switches, findsNWidgets(3));
      expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
      await tester.ensureVisible(switches.at(0));
      await tester.tap(switches.at(1));

      await tester.pump();
      final inkwellFinder = find.byType(InkWell);
      expect(inkwellFinder, findsNWidgets(8));

      await tester.ensureVisible(find.byKey(const Key('inwell_cep2')));
      await tester.pump();

      // await tester.tap(find.byKey(const Key('text_btn_ambs')));
      await tester.tap(
        find.byKey(
          const Key('inwell_cep2'),
        ),
      );
      await tester.pump();

      await tester.pump();
      await tester.ensureVisible(find.byKey(const Key('text_btn_ambs1')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('text_btn_ambs1')));
      await tester.pump();
    });
    group('setState Coverage completion', () {
      testWidgets('Tap on DateTimeTile date', (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            themeMode: ThemeMode.dark,
            theme: TalawaTheme.darkTheme,
          ),
        );
        await tester.pump();

        await tester.tap(find.byKey(const Key('EventDateTimeTileDate')).first);
        await tester.pump();

        await tester.ensureVisible(find.byKey(const Key('key for test cep')));
        await tester.pump();

        expect(find.byType(DatePickerDialog), findsOneWidget);
        expect(find.byType(CalendarDatePicker), findsOneWidget);

        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        expect(
          find.text(DateTime.now().toString().split(' ').first),
          findsNWidgets(2),
        );
      });

      testWidgets('Test end date selection', (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            themeMode: ThemeMode.dark,
            theme: TalawaTheme.darkTheme,
          ),
        );

        await tester.pumpAndSettle();

        final switches = find.descendant(
          of: find.byType(Row),
          matching: find.byType(Switch),
        );
        expect(switches, findsNWidgets(3));
        expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
        await tester.ensureVisible(switches.at(0));
        await tester.tap(switches.at(1));

        await tester.pump();

        await tester.tap(find.byKey(const Key('EventDateTimeTileDate')).last);
        await tester.pump();

        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();
        expect(find.text('Does not repeat'), findsOneWidget);
      });

      testWidgets('Tap on DateTimeTile time', (tester) async {
        final currentTime = DateTime.now();
        final futureTime = currentTime.add(const Duration(minutes: 30));
        await tester.pumpWidget(
          createEventScreen(
            themeMode: ThemeMode.dark,
            theme: TalawaTheme.darkTheme,
          ),
        );
        await tester.pumpAndSettle();

        final switches = find.descendant(
          of: find.byType(Row),
          matching: find.byType(Switch),
        );
        expect(switches, findsNWidgets(3));
        expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
        await tester.ensureVisible(switches.at(0));
        await tester.tap(switches.at(1));

        await tester.pump();
        await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).first);
        await tester.pump();

        expect(find.byType(TimePickerDialog), findsOneWidget);

        await tester.tap(find.text('OK'));
        await tester.pump();
        expect(
          find.text(DateFormat.jm().format(currentTime)),
          findsOneWidget,
        );

        expect(
          find.text(DateFormat.jm().format(futureTime)),
          findsOneWidget,
        );
      });
      testWidgets('Tap on DateTimeTile date', (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            themeMode: ThemeMode.dark,
            theme: TalawaTheme.darkTheme,
          ),
        );

        await tester.pumpAndSettle();

        final switches = find.descendant(
          of: find.byType(Row),
          matching: find.byType(Switch),
        );
        expect(switches, findsNWidgets(3));
        expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
        await tester.ensureVisible(switches.at(0));
        await tester.tap(switches.at(1));

        await tester.pump();

        await tester.tap(find.byKey(const Key('EventDateTimeTileDate')).last);
        await tester.pump();

        await tester.ensureVisible(find.byKey(const Key('key for test cep')));
        await tester.pump();

        expect(find.byType(DatePickerDialog), findsOneWidget);
        expect(find.byType(CalendarDatePicker), findsOneWidget);

        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();
        expect(
          find.text(DateTime.now().toString().split(' ').first),
          findsNWidgets(2),
        );
      });
      testWidgets('Tap on DateTimeTile time', (tester) async {
        final currentTime = DateTime.now();
        final futureTime = currentTime.add(const Duration(minutes: 30));
        await tester.pumpWidget(
          createEventScreen(
            themeMode: ThemeMode.dark,
            theme: TalawaTheme.darkTheme,
          ),
        );
        await tester.pumpAndSettle();

        final switches = find.descendant(
          of: find.byType(Row),
          matching: find.byType(Switch),
        );
        expect(switches, findsNWidgets(3));
        expect((tester.widgetList(switches).toList()[0] as Switch).value, true);
        await tester.ensureVisible(switches.at(0));
        await tester.tap(switches.at(1));

        await tester.pump();
        await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).last);
        await tester.pump();

        expect(find.byType(TimePickerDialog), findsOneWidget);

        await tester.tap(find.text('OK'));
        await tester.pump();
        expect(
          find.text(DateFormat.jm().format(currentTime)),
          findsOneWidget,
        );

        expect(
          find.text(DateFormat.jm().format(futureTime)),
          findsOneWidget,
        );
      });
    });

    group("Tests for integration with view model and services", () {
      late final CreateEventViewModel cachedViewModel =
          getAndRegisterCreateEventModel();

      // testWidgets("setup MockCreateEventViewModel", (tester) async {
      //   cachedViewModel = getAndRegisterCreateEventModel();
      // });

      testWidgets("Check if AppBar buttons work", (tester) async {
        mockNetworkImages(() async {
          await tester.pumpWidget(
            createEventScreen(
              themeMode: ThemeMode.dark,
              theme: TalawaTheme.darkTheme,
            ),
          );
          await tester.pumpAndSettle();

          expect(find.byType(CreateEventPage), findsOneWidget);

          await tester.tap(find.text("Add"));
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(Icons.close));
          await tester.pumpAndSettle();

          // expect(find.byType(CreateEventPage), findsNothing);
        });
      });

      testWidgets(
        "Check if data coming from view model show up correctly",
        (tester) async {
          mockNetworkImages(() async {
            await tester.pumpWidget(
              createEventScreen(
                themeMode: ThemeMode.dark,
                theme: TalawaTheme.darkTheme,
              ),
            );
            await tester.pumpAndSettle();
          });
        },
      );

      testWidgets("Check if bottom sheet unticking works", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            themeMode: ThemeMode.dark,
            theme: TalawaTheme.darkTheme,
          ),
        );
        await tester.pump();

        await tester.ensureVisible(find.byKey(const Key('inwell_cep2')));
        await tester.pump();

        // await tester.tap(find.byKey(const Key('text_btn_ambs')));
        await tester.tap(
          find.byKey(
            const Key('inwell_cep2'),
          ),
        );
        await tester.pump();

        await tester.pump();
        await tester.ensureVisible(find.byKey(const Key('text_btn_ambs1')));
        await tester.pumpAndSettle();

        await tester.tap(find.byType(CheckboxListTile).first);
        expect(cachedViewModel.memberCheckedMap['fakeUser1'], true);
        await tester.pumpAndSettle();
      });

      testWidgets(
        "Check if deleting members and admins works",
        (tester) async {
          mockNetworkImages(() async {
            await tester.pumpWidget(
              createEventScreen(
                themeMode: ThemeMode.dark,
                theme: TalawaTheme.darkTheme,
              ),
            );
            await tester.pumpAndSettle();

            //expect(find.text("p s"), findsOneWidget);
            expect(find.text("r p"), findsOneWidget);

            //await tester.ensureVisible(find.text("p s"));
            // await tester.pumpAndSettle();
            // await tester.tap(find.byIcon(Icons.cancel_rounded).at(0));
            // await tester.pumpAndSettle(const Duration(seconds: 1));

            //expect(cachedViewModel.selectedAdmins, []);
            expect(find.text("r p"), findsOneWidget);

            await tester.ensureVisible(find.text("r p"));
            await tester.pumpAndSettle();
            await tester.tap(find.byIcon(Icons.cancel_rounded).at(0));
            await tester.pumpAndSettle(const Duration(seconds: 1));

            //expect(cachedViewModel.selectedAdmins, []);
            expect(cachedViewModel.selectedMembers, []);
          });
        },
      );
    });
    testWidgets("Checking if add venue button shows up", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Add Venue'), findsOneWidget);
    });
    testWidgets("Checking if bottom sheet appears if no venue is selcted",
        (tester) async {
      final model = createEventViewModel;
      model.initialize();
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getVenueByOrgId': [
            {
              'id': '1',
              'name': 'Mock Venue 1',
              'capacity': 100,
              'imageUrl': '',
              'description': 'aaa',
            },
            {
              'id': '2',
              'name': 'Mock Venue 2',
              'capacity': 150,
              'imageUrl': '',
              'description': 'aaa',
            },
          ],
        },
        options: QueryOptions(document: gql(queries.venueListQuery())),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queries.venueListQuery(),
          variables: {
            "orgId": 'XYZ',
          },
        ),
      ).thenAnswer((_) async => mockQueryResult);

      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Add Venue'), findsOneWidget);
      await tester.tap(find.text('Add Venue'));
      await tester.pumpAndSettle();

      expect(find.byType(VenueBottomSheet), findsOneWidget);
    });
    testWidgets("Checking if selected venue shows up", (tester) async {
      final model = createEventViewModel;
      model.initialize();
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getVenueByOrgId': [
            {
              'id': '1',
              'name': 'Mock Venue 1',
              'capacity': 100,
              'imageUrl': '',
              'description': 'aaa',
            },
            {
              'id': '2',
              'name': 'Mock Venue 2',
              'capacity': 150,
              'imageUrl': '',
              'description': 'aaa',
            },
          ],
        },
        options: QueryOptions(document: gql(queries.venueListQuery())),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queries.venueListQuery(),
          variables: {
            "orgId": 'XYZ',
          },
        ),
      ).thenAnswer((_) async => mockQueryResult);

      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Add Venue'), findsOneWidget);
      await tester.tap(find.text('Add Venue'));
      await tester.pumpAndSettle();

      expect(find.byType(VenueBottomSheet), findsOneWidget);
      expect(find.text('Mock Venue 1'), findsOneWidget);

      await tester.tap(find.text('Mock Venue 1'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.check));
      await tester.pumpAndSettle();

      expect(find.text('Mock Venue 1'), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);
    });
  });
}
