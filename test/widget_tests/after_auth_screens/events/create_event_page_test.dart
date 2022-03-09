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

Widget createEventScreen(
        {ThemeMode themeMode = ThemeMode.light, required ThemeData theme}) =>
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
        });

void main() {
  SizeConfig().test();
  setupLocator();
  graphqlConfig.test();
  group("Create Event Screen Widget Test in dark mode", () {
    testWidgets("Testing if dark mode is applied", (tester) async {
      await tester.pumpWidget(createEventScreen(
        themeMode: ThemeMode.dark,
        theme: TalawaTheme.darkTheme,
      ));
      await tester.pumpAndSettle();
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme
            ?.scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
    });
  });
  group('Create Event Screen Widget Test', () {
    testWidgets("Testing if Create Event Screen shows up", (tester) async {
      await tester.pumpWidget(createEventScreen(
        theme: TalawaTheme.lightTheme,
      ));
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(const Key('CreateEventScreen'));
      expect(screenScaffoldWidget, findsOneWidget);
    });

    group("Testing app bar properties and contents", () {
      testWidgets("Testing if app bar shows up", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
        await tester.pumpAndSettle();
        final appBar = find.byType(AppBar);
        expect(appBar, findsOneWidget);
      });
      testWidgets("Testing close button in app bar", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
      });
      testWidgets("Testing add button in app bar", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
      });
    });

    group("Testing body properties and contents", () {
      testWidgets("Testing Add Image section", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
        expect(imageShowWidget, findsNothing);
      });
      testWidgets("Testing if Create Event Form widget shows", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
        await tester.pumpAndSettle();
        final createEventForm = find.byType(CreateEventForm);
        expect(createEventForm, findsOneWidget);
      });
      testWidgets("Testing Select Start Date and Time section", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
      });
      testWidgets("Testing Select End Date and Time section", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
      });
      testWidgets("Testing Does not repeat section", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
      });
      testWidgets("Testing Keep public section", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
      });
      testWidgets("Testing Keep Registerable section", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
      });
      testWidgets("Testing Add Admins section", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
        await tester.pumpAndSettle();
        final addAdminsText = find.descendant(
          of: find.byType(Row),
          matching: find.text("Add Admins"),
        );
        final addIcons = find.byIcon(Icons.add);
        final memberNameTiles = find.byType(MemberNameTile);
        expect(addAdminsText, findsOneWidget);
        expect(addIcons, findsNWidgets(2));
        expect(memberNameTiles, findsNothing);
      });
      testWidgets("Testing Add Members section", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
        await tester.pumpAndSettle();
        final addMembersText = find.descendant(
          of: find.byType(Row),
          matching: find.text("Add Members"),
        );
        final addIcons = find.byIcon(Icons.add);
        final memberNameTiles = find.byType(MemberNameTile);
        expect(addMembersText, findsOneWidget);
        expect(addIcons, findsNWidgets(2));
        expect(memberNameTiles, findsNothing);
      });
      testWidgets("Testing if cancel button in app bar works", (tester) async {
        await tester.pumpWidget(createEventScreen(
          theme: TalawaTheme.lightTheme,
        ));
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
    });
  });
}
