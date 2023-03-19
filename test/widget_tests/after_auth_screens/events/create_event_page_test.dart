// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_form.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';
import 'package:talawa/widgets/member_name_tile.dart';

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
  setupLocator();
  graphqlConfig.test();
  group("Create Event Screen Widget Test in dark mode", () {
    group('Check if the validator of the create_event_form is working', () {
      testWidgets("Testing if text field validator are working",
          (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final addBtn = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(TextButton),
        );
        await tester.tap(addBtn);
      });
    });

    testWidgets("Testing if dark mode is applied", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme
            ?.scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
    });
  });
  group("Create Event Screen Widget Test in light mode", () {
    testWidgets("Testing if light mode is applied", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.light,
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme
            ?.scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
    });
  });
  group('Create Event Screen Widget Test', () {
    testWidgets("Testing if Create Event Screen shows up", (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          theme: TalawaTheme.lightTheme,
        ),
      );
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(const Key('CreateEventScreen'));
      expect(screenScaffoldWidget, findsOneWidget);
    });

    group("Testing app bar properties and contents", () {
      testWidgets("Testing if app bar shows up", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appBar = find.byType(AppBar);
        final appBarWidget = tester.firstWidget(appBar) as AppBar;
        expect(appBar, findsOneWidget);
        expect(appBarWidget.elevation, 1);
      });
      testWidgets("Testing close button in app bar", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appBar = find.byType(AppBar);
        final appBarWidget = tester.firstWidget(appBar) as AppBar;
        final closeBtn = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(GestureDetector),
        );
        final closeIcon = find.descendant(
          of: closeBtn.first,
          matching: find.byIcon(Icons.close),
        );
        expect(appBarWidget.leading, tester.firstWidget(closeBtn));
        expect(
          (appBarWidget.leading as GestureDetector?)?.child,
          tester.firstWidget(closeIcon),
        );
      });
      testWidgets("Testing title in app bar", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appBar = find.byType(AppBar);
        final appBarWidget = tester.firstWidget(appBar) as AppBar;
        final appLocalization = AppLocalizations.of(
          navigationService.navigatorKey.currentContext!,
        );
        final title = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(Text),
        );
        expect(appBarWidget.title, tester.firstWidget<Text>(title));
        expect(appBarWidget.centerTitle, true);
        expect(
          (appBarWidget.title as Text?)?.data,
          appLocalization!.strictTranslate('Add Event'),
        );
        expect(
          (appBarWidget.title as Text?)?.style!.fontFamily,
          TalawaTheme.lightTheme.textTheme.titleLarge!.fontFamily,
        );
        expect(
          (appBarWidget.title as Text?)?.style!.fontSize,
          20,
        );
      });
      testWidgets("Testing add button in app bar", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appBar = find.byType(AppBar);
        final appBarWidget = tester.firstWidget(appBar) as AppBar;
        final appLocalization = AppLocalizations.of(
          navigationService.navigatorKey.currentContext!,
        );
        final addBtn = find.descendant(
          of: find.byType(AppBar),
          matching: find.byType(TextButton),
        );
        await tester.tap(addBtn);
        final addText =
            find.descendant(of: addBtn, matching: find.byType(Text));
        expect(appBarWidget.actions?.length, 1);
        expect(appBarWidget.actions?.first, tester.firstWidget(addBtn));
        expect(
          (appBarWidget.actions?.first as TextButton?)?.child,
          tester.firstWidget<Text>(addText),
        );
        expect(
          ((appBarWidget.actions?.first as TextButton?)?.child as Text?)?.data,
          appLocalization!.strictTranslate('Add'),
        );
        expect(
          ((appBarWidget.actions?.first as TextButton?)?.child as Text?)
              ?.style!
              .fontSize,
          16,
        );
        expect(
          ((appBarWidget.actions?.first as TextButton?)?.child as Text?)
              ?.style!
              .color,
          TalawaTheme.lightTheme.colorScheme.secondary,
        );
      });
    });

    group("Testing body properties and contents", () {
      testWidgets("Testing Add Image section", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appLocalization = AppLocalizations.of(
          navigationService.navigatorKey.currentContext!,
        );
        final imageIcon = find.descendant(
          of: find.byType(Row),
          matching: find.byIcon(Icons.image),
        );
        final addImageBtn = find.descendant(
          of: find.byType(Row),
          matching: find.byType(TextButton),
        );
        final addImageText = find.descendant(
          of: addImageBtn.first,
          matching: find.byType(Text),
        );
        final imageShowWidget = find.byType(Image);
        expect(imageIcon, findsOneWidget);
        expect(addImageText, findsOneWidget);
        expect(
          (tester.widget(addImageText) as Text?)?.data,
          appLocalization!.strictTranslate("Add Image"),
        );
        expect(
          (tester.widget(addImageText) as Text?)?.style!.fontSize,
          16,
        );
        expect(imageShowWidget, findsNothing);
      });
      testWidgets("Testing if Create Event Form widget shows", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final createEventForm = find.byType(CreateEventForm);
        expect(createEventForm, findsOneWidget);
      });
      testWidgets("Testing Select Start Date and Time section", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appLocalization = AppLocalizations.of(
          navigationService.navigatorKey.currentContext!,
        );
        final textDesc = find.text(
          appLocalization!.strictTranslate('Select Start Date and Time'),
        );
        final dateTimeTiles = find.byType(DateTimeTile);
        expect(textDesc, findsOneWidget);
        expect(dateTimeTiles, findsNWidgets(2));

        expect(
          (tester.widget(textDesc) as Text?)?.style!.fontSize,
          16,
        );
      });
      testWidgets("Testing Select End Date and Time section", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appLocalization = AppLocalizations.of(
          navigationService.navigatorKey.currentContext!,
        );
        final textDesc = find.text(
          appLocalization!.strictTranslate('Select End Date and Time'),
        );
        final dateTimeTiles = find.byType(DateTimeTile);
        expect(textDesc, findsOneWidget);
        expect(dateTimeTiles, findsNWidgets(2));

        expect(
          (tester.widget(textDesc) as Text?)?.style!.fontSize,
          16,
        );
      });
      testWidgets("Testing Does not repeat section", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appLocalization = AppLocalizations.of(
          navigationService.navigatorKey.currentContext!,
        );
        final restoreIcon = find.descendant(
          of: find.byType(Row),
          matching: find.byIcon(Icons.restore),
        );
        final doesNotRepeatText = find.descendant(
          of: find.byType(Row),
          matching: find.text(
            appLocalization!.strictTranslate('Does not repeat'),
          ),
        );
        expect(restoreIcon, findsOneWidget);
        expect(doesNotRepeatText, findsOneWidget);
        expect(
          (tester.widget(doesNotRepeatText) as Text?)?.style!.fontSize,
          16,
        );
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
        expect(switches, findsNWidgets(2));
        expect(
          (tester.widget(keepPublicText) as Text?)?.style!.fontSize,
          16,
        );
        expect((tester.firstWidget(switches) as Switch).value, true);
        await tester.tap(switches.first);
        await tester.pumpAndSettle();
        expect((tester.firstWidget(switches) as Switch).value, false);
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
        expect(switches, findsNWidgets(2));
        expect(
          (tester.widget(keepRegisterableText) as Text?)?.style!.fontSize,
          16,
        );
        expect((tester.widgetList(switches).toList()[1] as Switch).value, true);
        await tester.ensureVisible(switches.at(1));
        await tester.tap(switches.at(1));
        await tester.pumpAndSettle();
        expect(
          (tester.widgetList(switches).toList()[1] as Switch).value,
          false,
        );
      });
      testWidgets("Testing Add Members section", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final addMembersText = find.descendant(
          of: find.byType(Row),
          matching: find.text("Add Members"),
        );
        final addIcons = find.byIcon(Icons.add);
        final memberNameTiles = find.byType(MemberNameTile);
        expect(addMembersText, findsOneWidget);
        expect(addIcons, findsNWidgets(1));
        expect(
          (tester.widget(addMembersText) as Text?)?.style!.fontSize,
          16,
        );
        expect(memberNameTiles, findsNothing);
        await tester.ensureVisible(addMembersText.first);
        await tester.tap(addMembersText.first);
        await tester.pump();
        expect(find.byType(BottomSheet), findsOneWidget);
      });
      testWidgets("Testing if cancel button in app bar works", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();
        final appBar = find.byType(AppBar);
        final closeBtn = find.descendant(
          of: appBar,
          matching: find.byType(GestureDetector),
        );
        await tester.tap(closeBtn.first);
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
        final createEventScreenPage =
            find.byKey(const Key('CreateEventScreen'));
        expect(createEventScreenPage, findsNothing);
      });
      testWidgets("Testing if mapScreen opens up", (tester) async {
        await tester.pumpWidget(
          createEventScreen(
            theme: TalawaTheme.lightTheme,
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Choose on map'));
        await tester.pumpAndSettle();
      });
    });
  });
}
