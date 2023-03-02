import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/base_view.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

Widget createAddPostPage({
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
          home: Scaffold(
            body: AddPost(
              key: const Key('AddPost'),
              drawerKey: MainScreenViewModel.scaffoldKey,
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

  locator.unregister<MultiMediaPickerService>();

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  testWidgets("checks if the upload photo from  gallery works", (tester) async {
    await tester.pumpWidget(
      createAddPostPage(
        themeMode: ThemeMode.dark,
        theme: TalawaTheme.darkTheme,
      ),
    );
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
    final multimediaPickerServices = locator<MultiMediaPickerService>();

    /// when is function provided by mockito lib
    when(multimediaPickerServices.getPhotoFromGallery()).thenAnswer((_) async {
      return file;
    });

    await tester.tap(finder);
    await tester.pump();

    /// once the image is selected it get displayed on the screen and the buttons to pick
    /// image gets disappear
    expect(finder, findsNothing);
  });

  testWidgets("checks if the upload photo from  camera works & check if image shows on screen, Check if image is removed", (tester) async {
    await tester.pumpWidget(
      createAddPostPage(
        themeMode: ThemeMode.dark,
        theme: TalawaTheme.darkTheme,
      ),
    );
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
    final multimediaPickerServices = locator<MultiMediaPickerService>();

    /// when is function provided by mockito lib
    when(multimediaPickerServices.getPhotoFromGallery(camera: true))
        .thenAnswer((_) async {
      return file;
    });

    await tester.tap(finder);
    await tester.pump();

    /// once the image is selected it get displayed on the screen and the buttons to pick
    /// image gets disappear
    expect(finder, findsNothing);

    /// finding the cross image button
    final findRemoveImageIcon = find.byKey(const Key('remove_image_post_page'));
    expect(findRemoveImageIcon, findsOneWidget);

    /// click on cross button to remove the image
    await tester.tap(findRemoveImageIcon);
    await tester.pump();

    /// once selected is crossed the cross button on image disappears
    expect(findRemoveImageIcon, findsNothing);
  });
}
