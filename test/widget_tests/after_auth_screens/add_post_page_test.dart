// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

final homeModel = locator<MainScreenViewModel>();

Widget createAddPostScreen({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
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
    home: Scaffold(
      /// MainScreenViewModel.scaffoldKey.currentState will return null
      /// until and unless their is another widget with the same global key
      key: MainScreenViewModel.scaffoldKey,
      body: AddPost(
        drawerKey: MainScreenViewModel.scaffoldKey,
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  testSetupLocator();
  // locator.registerSingleton(LikeButtonViewModel());

  setUp(() {
    registerServices();
  });

  group('createAddPostScreen Test', () {
    testWidgets('check if createAddPostScreen shows up', (tester) async {
      await tester.pumpWidget(createAddPostScreen());
      await tester.pump();

      final finder = find.byType(Scaffold);

      expect(finder, findsNWidgets(2));
    });

    group('checks if the upload post button is working properly', () {
      testWidgets('checks if the upload post button is pressable',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of text button
        /// because their are many text button

        final finder = find.byKey(const Key('add_post_text_btn1'));

        expect(finder, findsOneWidget);
        await tester.pump();
      });
      testWidgets('checks if the upload post button shows correct text',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of text button
        /// because their are many text button

        final finder = find.byKey(const Key('add_post_text_btn1'));

        final text = find.descendant(of: finder, matching: find.text('Post'));

        expect(finder, findsOneWidget);
        expect(text, findsOneWidget);
      });
    });

    group('checks if the upload photo from gallery button is working properly',
        () {
      testWidgets(
          'checks if the upload photo from gallery button shows correct icon',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of icon button
        /// because their are many icon button

        final finder = find.byKey(const Key('add_post_icon_button2'));

        final icon =
            find.descendant(of: finder, matching: find.byIcon(Icons.photo));

        expect(finder, findsOneWidget);
        expect(icon, findsOneWidget);
      });

      testWidgets(
          'checks if the upload photo from gallery button ad other process are working properly',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of icon button
        /// because their are many icon button

        final finder = find.byKey(const Key('add_post_icon_button2'));

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

        /// taping the button
        await tester.tap(finder);
        await tester.pump();
      });

      testWidgets(
          'checks if the uploaded photo from gallery button is presented on the screen',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of icon button
        /// because their are many icon button

        final finder = find.byKey(const Key('add_post_icon_button2'));

        final finder2 = find.byType(Stack);

        final finder3 = find.byType(Positioned);

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

        expect(finder2, findsNWidgets(3));

        expect(finder3, findsNWidgets(1));
      });

      testWidgets(
          'checks if the uploaded photo from gallery button is removed after pressing remove button',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of icon button
        /// because their are many icon button

        final finder = find.byKey(const Key('add_post_icon_button2'));

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
    });

    group('checks if the upload photo by camera button is working properly',
        () {
      testWidgets(
          'checks if the upload photo by camera button shows correct icon',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of icon button
        /// because their are many icon button

        final finder = find.byKey(const Key('add_post_icon_button3'));

        final icon = find.descendant(
          of: finder,
          matching: find.byIcon(Icons.camera_alt),
        );

        expect(finder, findsOneWidget);
        expect(icon, findsOneWidget);
      });

      testWidgets(
          'checks if the upload by camera one button button is pressable',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of icon button
        /// because their are many icon button

        final finder = find.byKey(const Key('add_post_icon_button3'));

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
        when(multimediaPickerService.getPhotoFromGallery(camera: true))
            .thenAnswer((_) async {
          return file;
        });

        await tester.tap(finder);
        await tester.pump();
      });
    });

    group('checks if the upload file button is working properly', () {
      testWidgets('checks if the upload file button shows correct icon',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of icon button
        /// because their are many icon button

        final finder = find.byKey(const Key('add_post_icon_button4'));

        final icon = find.descendant(
          of: finder,
          matching: find.byIcon(Icons.file_upload),
        );

        expect(finder, findsOneWidget);
        expect(icon, findsOneWidget);
      });

      testWidgets('checks if the upload file button button is pressable',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of icon button
        /// because their are many icon button

        final finder = find.byKey(const Key('add_post_icon_button4'));

        expect(finder, findsOneWidget);

        await tester.tap(finder);
        await tester.pump();
      });
    });

    group('checks if the add hashtag button is working properly', () {
      testWidgets('checks if the add hashtag button shows correct text',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of text button
        /// because their are many text button

        final finder = find.byKey(const Key('add_post_text_btn2'));

        final icon =
            find.descendant(of: finder, matching: find.text('# Add hashtag'));

        expect(finder, findsOneWidget);
        expect(icon, findsOneWidget);
      });

      testWidgets('checks if the add hashtag button is pressable',
          (tester) async {
        await tester.pumpWidget(createAddPostScreen());
        await tester.pump();

        /// using the key of text button
        /// because their are many text button

        final finder = find.byKey(const Key('add_post_text_btn2'));

        expect(finder, findsOneWidget);

        await tester.tap(finder);
        await tester.pump();
      });
    });

//TODO: null
    testWidgets('Check if icon button is pressable.', (tester) async {
      await tester.pumpWidget(createAddPostScreen());
      await tester.pump();

      /// using the key of icon button
      /// because their are many icon button

      final finder = find.byKey(const Key('add_post_icon_button1'));

      expect(finder, findsOneWidget);

      await tester.tap(finder);
      await tester.pump();
    });
  });
}
