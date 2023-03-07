// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/edit_event_page.dart';
import 'package:talawa/views/after_auth_screens/events/edit_events_form.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';

import '../../../helpers/setup_firebase_mocks.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';

Widget editEventScreen({
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
          home: EditEventPage(
            key: const Key('EditEventScreen'),
            event: Event(
              id: '1',
              admins: [],
              startDate: DateFormat('yMd').format(
                DateTime(2021, 1, 1),
              ),
              endDate: DateFormat('yMd').format(
                DateTime(2022, 1, 1),
              ),
              startTime: DateFormat('h:mm a').format(DateTime(2021, 1, 1)),
              endTime: DateFormat('h:mm a').format(DateTime(2022, 1, 1)),
              isRegisterable: true,
              isPublic: true,
              isRegistered: true,
              title: "Test Title",
              description: "Description Title",
              location: "Buea",
            ),
          ),
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

Future<void> main() async {
  // SizeConfig().test();
  // setupLocator();
  // graphqlConfig.test();

  // setupFirebaseMocks();
  // await Firebase.initializeApp();

  // group("Edit Event Screen Widget Test in dark mode", () {
  //   testWidgets("Testing if dark mode is applied", (tester) async {
  //     await tester.pumpWidget(
  //       editEventScreen(
  //         themeMode: ThemeMode.dark,
  //         theme: TalawaTheme.darkTheme,
  //       ),
  //     );
  //     await tester.pumpAndSettle();
  //     expect(
  //       (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
  //           .theme
  //           ?.scaffoldBackgroundColor,
  //       TalawaTheme.darkTheme.scaffoldBackgroundColor,
  //     );
  //   });
  //   testWidgets("Testing if tapping on Done works", (tester) async {
  //     getAndRegisterUserConfig();
  //     final service = getAndRegisterEventService();
  //     locator<DataBaseMutationFunctions>().init();

  //     await tester.pumpWidget(editEventScreen(theme: TalawaTheme.darkTheme));
  //     await tester.pumpAndSettle();

  //     await tester.tap(find.text('Done'));
  //     await tester.pump();

  //     verify(
  //       (service as MockEventService)
  //           .editEvent(eventId: '1', variables: anyNamed('variables')),
  //     );
  //   });
  //   testWidgets('Tap on Add Image', (tester) async {
  //     await tester.pumpWidget(editEventScreen(theme: TalawaTheme.darkTheme));
  //     await tester.pumpAndSettle();

  //     await tester.tap(find.text('Add Image'));
  //     await tester.pump();
  //   });
  //   testWidgets('Tap on DataTimeTile date', (tester) async {
  //     await tester.pumpWidget(editEventScreen(theme: TalawaTheme.darkTheme));
  //     await tester.pumpAndSettle();

  //     await tester.tap(find.byKey(const Key('EventDateTimeTileDate')).first);
  //     await tester.pump();

  //     expect(find.byType(DatePickerDialog), findsOneWidget);

  //     await tester.tap(find.text('31'));
  //     await tester.tap(find.text('OK'));
  //     await tester.pumpAndSettle();

  //     expect(find.text('2021-01-31'), findsOneWidget);
  //   });
  //   testWidgets('Tap on DataTimeTile time', (tester) async {
  //     await tester.pumpWidget(editEventScreen(theme: TalawaTheme.darkTheme));
  //     await tester.pumpAndSettle();

  //     await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).first);
  //     await tester.pump();

  //     expect(find.byType(TimePickerDialog), findsOneWidget);

  //     final center = tester
  //         .getCenter(find.byKey(const ValueKey<String>('time-picker-dial')));
  //     await tester.tapAt(Offset(center.dx - 10, center.dy));
  //     await tester.pump();
  //     await tester.tapAt(Offset(center.dx, center.dy + 10));
  //     await tester.tap(find.text('OK'));
  //     await tester.pump();

  //     expect(find.text('9:30 AM'), findsOneWidget);
  //   });
  //   testWidgets('Tap on DataTimeTile date for end', (tester) async {
  //     await tester.pumpWidget(editEventScreen(theme: TalawaTheme.darkTheme));
  //     await tester.pumpAndSettle();

  //     await tester.tap(find.byKey(const Key('EventDateTimeTileDate')).last);
  //     await tester.pump();

  //     expect(find.byType(DatePickerDialog), findsOneWidget);

  //     await tester.tap(find.text('31'));
  //     await tester.tap(find.text('OK'));
  //     await tester.pumpAndSettle();

  //     expect(find.text('2022-01-31'), findsOneWidget);
  //   });
  //   testWidgets('Tap on DataTimeTile time for end', (tester) async {
  //     await tester.pumpWidget(editEventScreen(theme: TalawaTheme.darkTheme));
  //     await tester.pumpAndSettle();

  //     await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).last);
  //     await tester.pump();

  //     expect(find.byType(TimePickerDialog), findsOneWidget);

  //     await tester.tap(find.text('PM'));
  //     await tester.tap(find.text('OK'));
  //     await tester.pump();

  //     expect(find.text('12:00 PM'), findsOneWidget);
  //   });
  // });

  // group("Edit Event Screen Widget Test in light mode", () {
  //   testWidgets("Testing if light mode is applied", (tester) async {
  //     await tester.pumpWidget(
  //       editEventScreen(
  //         themeMode: ThemeMode.light,
  //         theme: TalawaTheme.lightTheme,
  //       ),
  //     );
  //     await tester.pumpAndSettle();
  //     expect(
  //       (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
  //           .theme
  //           ?.scaffoldBackgroundColor,
  //       TalawaTheme.lightTheme.scaffoldBackgroundColor,
  //     );
  //   });
  // });
  // group('Edit Event Screen Widget Test', () {
  //   testWidgets("Testing if Edit Event Screen shows up", (tester) async {
  //     await tester.pumpWidget(
  //       editEventScreen(
  //         theme: TalawaTheme.lightTheme,
  //       ),
  //     );
  //     await tester.pumpAndSettle();
  //     final screenScaffoldWidget = find.byKey(const Key('EditEventScreen'));
  //     expect(screenScaffoldWidget, findsOneWidget);
  //   });

  //   group("Testing app bar properties and contents", () {
  //     testWidgets("Testing if app bar shows up", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appBar = find.byType(AppBar);
  //       final appBarWidget = tester.firstWidget(appBar) as AppBar;
  //       expect(appBar, findsOneWidget);
  //       expect(appBarWidget.elevation, 1);
  //     });
  //     testWidgets("Testing close button in app bar", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appBar = find.byType(AppBar);
  //       final appBarWidget = tester.firstWidget(appBar) as AppBar;
  //       final closeBtn = find.descendant(
  //         of: find.byType(AppBar),
  //         matching: find.byType(GestureDetector),
  //       );
  //       final closeIcon = find.descendant(
  //         of: closeBtn.first,
  //         matching: find.byIcon(Icons.close),
  //       );
  //       expect(appBarWidget.leading, tester.firstWidget(closeBtn));
  //       expect(
  //         (appBarWidget.leading as GestureDetector?)?.child,
  //         tester.firstWidget(closeIcon),
  //       );
  //     });
  //     testWidgets("Testing title in app bar", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appBar = find.byType(AppBar);
  //       final appBarWidget = tester.firstWidget(appBar) as AppBar;
  //       final title = find.descendant(
  //         of: find.byType(AppBar),
  //         matching: find.byType(Text),
  //       );
  //       expect(appBarWidget.title, tester.firstWidget<Text>(title));
  //       expect(appBarWidget.centerTitle, true);
  //       expect(
  //         (appBarWidget.title as Text?)?.data,
  //         'Edit Event',
  //       );
  //       expect(
  //         (appBarWidget.title as Text?)?.style!.fontFamily,
  //         TalawaTheme.lightTheme.textTheme.titleLarge!.fontFamily,
  //       );
  //       expect(
  //         (appBarWidget.title as Text?)?.style!.fontSize,
  //         20,
  //       );
  //     });
  //     testWidgets("Testing done button in app bar", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appBar = find.byType(AppBar);
  //       final appBarWidget = tester.firstWidget(appBar) as AppBar;
  //       final doneBtn = find.descendant(
  //         of: find.byType(AppBar),
  //         matching: find.byType(TextButton),
  //       );
  //       final doneText =
  //           find.descendant(of: doneBtn, matching: find.byType(Text));
  //       expect(appBarWidget.actions?.length, 1);
  //       expect(appBarWidget.actions?.first, tester.firstWidget(doneBtn));
  //       expect(
  //         (appBarWidget.actions?.first as TextButton?)?.child,
  //         tester.firstWidget<Text>(doneText),
  //       );
  //       expect(
  //         ((appBarWidget.actions?.first as TextButton?)?.child as Text?)?.data,
  //         'Done',
  //       );
  //       expect(
  //         ((appBarWidget.actions?.first as TextButton?)?.child as Text?)
  //             ?.style!
  //             .fontSize,
  //         16,
  //       );
  //       expect(
  //         ((appBarWidget.actions?.first as TextButton?)?.child as Text?)
  //             ?.style!
  //             .color,
  //         TalawaTheme.lightTheme.colorScheme.secondary,
  //       );
  //     });
  //   });

  //   group("Testing body properties and contents", () {
  //     testWidgets("Testing Add Image section", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appLocalization = AppLocalizations.of(
  //         navigationService.navigatorKey.currentContext!,
  //       );
  //       final imageIcon = find.descendant(
  //         of: find.byType(Row),
  //         matching: find.byIcon(Icons.image),
  //       );
  //       final addImageBtn = find.descendant(
  //         of: find.byType(Row),
  //         matching: find.byType(TextButton),
  //       );
  //       final addImageText = find.descendant(
  //         of: addImageBtn.first,
  //         matching: find.byType(Text),
  //       );
  //       final imageShowWidget = find.byType(Image);
  //       expect(imageIcon, findsOneWidget);
  //       expect(addImageText, findsOneWidget);
  //       expect(
  //         (tester.widget(addImageText) as Text?)?.data,
  //         appLocalization!.strictTranslate("Add Image"),
  //       );
  //       expect(
  //         (tester.widget(addImageText) as Text?)?.style!.fontSize,
  //         16,
  //       );
  //       expect(imageShowWidget, findsNothing);
  //     });
  //     testWidgets("Testing if Edit Event Form widget shows", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final editEventForm = find.byType(EditEventForm);
  //       expect(editEventForm, findsOneWidget);
  //     });
  //     testWidgets("Testing Select Start Date and Time section", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appLocalization = AppLocalizations.of(
  //         navigationService.navigatorKey.currentContext!,
  //       );
  //       final textDesc = find.text(
  //         appLocalization!.strictTranslate('Select Start Date and Time'),
  //       );
  //       final dateTimeTiles = find.byType(DateTimeTile);
  //       expect(textDesc, findsOneWidget);
  //       expect(dateTimeTiles, findsNWidgets(2));
  //       expect(
  //         (tester.firstWidget(dateTimeTiles) as DateTimeTile).date,
  //         DateTime(2021, 1, 1).toString().split(' ')[0],
  //       );
  //       expect(
  //         (tester.firstWidget(dateTimeTiles) as DateTimeTile).time,
  //         TimeOfDay.fromDateTime(DateTime(2021, 1, 1)).format(
  //           navigationService.navigatorKey.currentContext!,
  //         ),
  //       );
  //       expect(
  //         (tester.widget(textDesc) as Text?)?.style!.fontSize,
  //         16,
  //       );
  //     });
  //     testWidgets("Testing Select End Date and Time section", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appLocalization = AppLocalizations.of(
  //         navigationService.navigatorKey.currentContext!,
  //       );
  //       final textDesc = find.text(
  //         appLocalization!.strictTranslate('Select End Date and Time'),
  //       );
  //       final dateTimeTiles = find.byType(DateTimeTile);
  //       expect(textDesc, findsOneWidget);
  //       expect(dateTimeTiles, findsNWidgets(2));
  //       expect(
  //         (tester.widgetList(dateTimeTiles).toList()[1] as DateTimeTile).date,
  //         DateTime(2022, 1, 1).toString().split(' ')[0],
  //       );
  //       expect(
  //         (tester.widgetList(dateTimeTiles).toList()[1] as DateTimeTile).time,
  //         TimeOfDay.fromDateTime(DateTime(2022, 1, 1)).format(
  //           navigationService.navigatorKey.currentContext!,
  //         ),
  //       );
  //       expect(
  //         (tester.widgetList(dateTimeTiles).toList()[1] as DateTimeTile).time,
  //         TimeOfDay.fromDateTime(DateTime(2022, 1, 1)).format(
  //           navigationService.navigatorKey.currentContext!,
  //         ),
  //       );
  //       expect(
  //         (tester.widget(textDesc) as Text?)?.style!.fontSize,
  //         16,
  //       );
  //     });
  //     testWidgets("Testing Does not repeat section", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appLocalization = AppLocalizations.of(
  //         navigationService.navigatorKey.currentContext!,
  //       );
  //       final restoreIcon = find.descendant(
  //         of: find.byType(Row),
  //         matching: find.byIcon(Icons.restore),
  //       );
  //       final doesNotRepeatText = find.descendant(
  //         of: find.byType(Row),
  //         matching: find.text(
  //           appLocalization!.strictTranslate('Does not repeat'),
  //         ),
  //       );
  //       expect(restoreIcon, findsOneWidget);
  //       expect(doesNotRepeatText, findsOneWidget);
  //       expect(
  //         (tester.widget(doesNotRepeatText) as Text?)?.style!.fontSize,
  //         16,
  //       );
  //     });
  //     testWidgets("Testing Keep public section", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appLocalization = AppLocalizations.of(
  //         navigationService.navigatorKey.currentContext!,
  //       );
  //       final keepPublicText = find.descendant(
  //         of: find.byType(Row),
  //         matching: find.text(
  //           appLocalization!.strictTranslate('Keep Public'),
  //         ),
  //       );
  //       final switches = find.descendant(
  //         of: find.byType(Row),
  //         matching: find.byType(Switch),
  //       );
  //       expect(keepPublicText, findsOneWidget);
  //       expect(switches, findsNWidgets(2));
  //       expect(
  //         (tester.widget(keepPublicText) as Text?)?.style!.fontSize,
  //         16,
  //       );
  //       expect((tester.firstWidget(switches) as Switch).value, true);
  //       await tester.tap(switches.first);
  //       await tester.pumpAndSettle();
  //       expect((tester.firstWidget(switches) as Switch).value, false);
  //     });
  //     testWidgets("Testing Keep Registerable section", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appLocalization = AppLocalizations.of(
  //         navigationService.navigatorKey.currentContext!,
  //       );
  //       final keepRegisterableText = find.descendant(
  //         of: find.byType(Row),
  //         matching: find.text(
  //           appLocalization!.strictTranslate('Keep Registerable'),
  //         ),
  //       );
  //       final switches = find.descendant(
  //         of: find.byType(Row),
  //         matching: find.byType(Switch),
  //         skipOffstage: false,
  //       );
  //       expect(keepRegisterableText, findsOneWidget);
  //       expect(switches, findsNWidgets(2));
  //       expect(
  //         (tester.widget(keepRegisterableText) as Text?)?.style!.fontSize,
  //         16,
  //       );
  //       expect((tester.widgetList(switches).toList()[1] as Switch).value, true);
  //       await tester.ensureVisible(switches.at(1));
  //       await tester.tap(switches.at(1));
  //       await tester.pumpAndSettle();
  //       expect(
  //         (tester.widgetList(switches).toList()[1] as Switch).value,
  //         false,
  //       );
  //     });
  //     testWidgets("Testing if cancel button in app bar works", (tester) async {
  //       await tester.pumpWidget(
  //         editEventScreen(
  //           theme: TalawaTheme.lightTheme,
  //         ),
  //       );
  //       await tester.pumpAndSettle();
  //       final appBar = find.byType(AppBar);
  //       final closeBtn = find.descendant(
  //         of: appBar,
  //         matching: find.byType(GestureDetector),
  //       );
  //       await tester.tap(closeBtn.first);
  //       await tester.pumpAndSettle(const Duration(milliseconds: 500));
  //       final createEventScreenPage = find.byKey(const Key('EditEventScreen'));
  //       expect(createEventScreenPage, findsNothing);
  //     });
  //   });
  // });
}
