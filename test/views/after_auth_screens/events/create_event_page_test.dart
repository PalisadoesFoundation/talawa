// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
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
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
}

final setDateCallback = MockCallbackFunction();
final setTimeCallback = MockCallbackFunction();

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
  SizeConfig().test();
  testSetupLocator();
  // locator.unregister<OrganizationService>();
  locator.unregister<MultiMediaPickerService>();
  // locator.registerSingleton(OrganizationService());
  // locator.registerSingleton(LikeButtonViewModel());

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  testWidgets("Checking tap Inkwell for setDate 1 datetime", (tester) async {
    await tester.pumpWidget(
      createEventScreen(
        themeMode: ThemeMode.dark,
        theme: TalawaTheme.darkTheme,
      ),
    );
    await tester.pump();
    final inkwellFinder = find.byType(InkWell);
    expect(inkwellFinder, findsNWidgets(7));
    // tester.allElements.forEach((element) {
    //   print(element);
    // });

    ///returning the file variable to the
    ///result of function multimediaPickerService.getPhotoFromGallery
    ///when this function is called in the
    ///view model of add_post_page.
    final file = File('fakePath');

    /// using the new instance of multimediaPickerService
    /// so that when statement can be used again,
    /// else it gives null point exception
    final multimediaPickerService = locator<MultiMediaPickerService>();

    /// when is function provided by mockito lib
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
    await tester.pump();
    final inkwellFinder = find.byType(InkWell);
    expect(inkwellFinder, findsNWidgets(7));

    ///returning the file variable to the
    ///result of function multimediaPickerService.getPhotoFromGallery
    ///when this function is called in the
    ///view model of add_post_page.
    final file = File('fakePath');

    /// using the new instance of multimediaPickerService
    /// so that when statement can be used again,
    /// else it gives null point exception
    final multimediaPickerService = locator<MultiMediaPickerService>();

    /// when is function provided by mockito lib
    when(multimediaPickerService.getPhotoFromGallery(camera: false))
        .thenAnswer((_) async {
      return file;
    });

    await tester.tap(inkwellFinder.at(2));
    await tester.pump();
  });
  testWidgets("Checking tap Inkwell for setDate 2 datetime", (tester) async {
    await tester.pumpWidget(
      createEventScreen(
        themeMode: ThemeMode.dark,
        theme: TalawaTheme.darkTheme,
      ),
    );
    await tester.pump();
    final inkwellFinder = find.byType(InkWell);
    expect(inkwellFinder, findsNWidgets(7));

    ///returning the file variable to the
    ///result of function multimediaPickerService.getPhotoFromGallery
    ///when this function is called in the
    ///view model of add_post_page.
    final file = File('fakePath');

    /// using the new instance of multimediaPickerService
    /// so that when statement can be used again,
    /// else it gives null point exception
    final multimediaPickerService = locator<MultiMediaPickerService>();

    /// when is function provided by mockito lib
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
    await tester.pump();
    final inkwellFinder = find.byType(InkWell);
    expect(inkwellFinder, findsNWidgets(7));
    // tester.allElements.forEach((element) {
    //   print(element);
    // });

    ///returning the file variable to the
    ///result of function multimediaPickerService.getPhotoFromGallery
    ///when this function is called in the
    ///view model of add_post_page.
    final file = File('fakePath');

    /// using the new instance of multimediaPickerService
    /// so that when statement can be used again,
    /// else it gives null point exception
    final multimediaPickerService = locator<MultiMediaPickerService>();

    /// when is function provided by mockito lib
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

    /// using the key of icon button
    /// because their are many icon button

    final finder = find.byKey(const Key('txt_btn_cep'));

    expect(finder, findsOneWidget);

    ///returning the file variable to the
    ///result of function multimediaPickerService.getPhotoFromGallery
    ///when this function is called in the
    ///view model of add_post_page.
    final file = File('fakePath');

    /// using the new instance of multimediaPickerService
    /// so that when statement can be used again,
    /// else it gives null point exception
    final multimediaPickerServices = locator<MultiMediaPickerService>();

    /// when is function provided by mockito lib
    when(multimediaPickerServices.getPhotoFromGallery()).thenAnswer((_) async {
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

    ///returning the file variable to the
    ///result of function multimediaPickerService.getPhotoFromGallery
    ///when this function is called in the
    ///view model of add_post_page.
    final file = File('fakePath');

    /// using the new instance of multimediaPickerService
    /// so that when statement can be used again,
    /// else it gives null point exception
    final multimediaPickerService = locator<MultiMediaPickerService>();

    /// when is function provided by mockito lib
    when(multimediaPickerService.getPhotoFromGallery(camera: false))
        .thenAnswer((_) async {
      return file;
    });

    await tester.tap(finder);
    await tester.pump();

    await tester.tap(cancelBtn);
    await tester.pump();
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
    expect((tester.widgetList(switches).toList()[1] as Switch).value, false);
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
    await tester.pump();
    final inkwellFinder = find.byType(InkWell);
    expect(inkwellFinder, findsNWidgets(7));

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
    testWidgets('Tap on DataTimeTile date', (tester) async {
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
    testWidgets('Tap on DataTimeTile time', (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).first);
      await tester.pump();

      expect(find.byType(TimePickerDialog), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pump();
      expect(
        find.text(DateFormat.jm().format(DateTime.now())),
        findsNWidgets(2),
      );
    });
    testWidgets('Tap on DataTimeTile date', (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
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
    testWidgets('Tap on DataTimeTile time', (tester) async {
      await tester.pumpWidget(
        createEventScreen(
          themeMode: ThemeMode.dark,
          theme: TalawaTheme.darkTheme,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('EventDateTimeTileTime')).last);
      await tester.pump();

      expect(find.byType(TimePickerDialog), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pump();
      expect(
        find.text(DateFormat.jm().format(DateTime.now())),
        findsNWidgets(2),
      );
    });
  });

  group("Tests for integration with view model and services", () {
    late final CreateEventViewModel cachedViewModel;

    testWidgets("setup MockCreateEventViewModel", (tester) async {
      cachedViewModel = getAndRegisterCreateEventModel();
    });

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

      await tester.tap(find.byType(CheckboxListTile));
      expect(cachedViewModel.memberCheckedMap['fakeUser1'], false);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CheckboxListTile));
      expect(cachedViewModel.memberCheckedMap['fakeUser1'], true);
      await tester.pump();
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
}
