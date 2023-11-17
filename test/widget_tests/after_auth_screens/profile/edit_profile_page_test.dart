// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/profile/edit_profile_page.dart';
import 'package:talawa/views/base_view.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  void call();
}

Widget createChangePassScreenLight({ThemeMode themeMode = ThemeMode.light}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: TalawaTheme.lightTheme,
          home: const EditProfilePage(),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

Widget createChangePassScreenDark({ThemeMode themeMode = ThemeMode.dark}) =>
    BaseView<AppLanguage>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: [
            const AppLocalizationsDelegate(isTest: true),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          key: const Key('Root'),
          themeMode: themeMode,
          theme: TalawaTheme.darkTheme,
          home: const EditProfilePage(),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  final Directory dir = Directory('temporaryPath');
  Hive
    ..init(dir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(OrgInfoAdapter());
  await Hive.openBox<User>('currentUser');
  await Hive.openBox<OrgInfo>('currentOrg');
  await Hive.openBox('url');
  group('Edit Profile Screen Widget Test in light mode', () {
    testWidgets("Testing if Edit Profile Screen shows up", (tester) async {
      userConfig.updateUser(
        User(firstName: 'Test', lastName: 'Test', email: 'test@test.com'),
      );
      await tester.pumpWidget(createChangePassScreenLight());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('EditProfileScreenScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.lightTheme.scaffoldBackgroundColor,
      );
      final appBarText = find.byKey(
        const Key('ProfileText'),
      );
      expect(appBarText, findsOneWidget);
    });
    testWidgets("Testing if Edit Screen shows image when not exist in database",
        (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(firstName: 'Test', lastName: 'Test', email: 'test@test.com'),
        );
        await tester.pumpWidget(createChangePassScreenLight());
        await tester.pumpAndSettle();
        final screenScaffoldWidget = find.byKey(
          const Key('EditProfileScreenScaffold'),
        );
        expect(screenScaffoldWidget, findsOneWidget);
        expect(
          (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
              .theme!
              .scaffoldBackgroundColor,
          TalawaTheme.lightTheme.scaffoldBackgroundColor,
        );
        final imageWidgetWithPicture = find.byKey(
          const Key('UserImageNotInDb'),
        );
        expect(imageWidgetWithPicture, findsOneWidget);
      });
    });
    testWidgets(
        "Testing if Edit Screen shows image when already exist in database",
        (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(
            firstName: 'Test',
            lastName: 'Test',
            email: 'test@test.com',
            image: 'https://via.placeholder.com/150',
          ),
        );
        await tester.pumpWidget(createChangePassScreenLight());
        await tester.pumpAndSettle();
        final screenScaffoldWidget = find.byKey(
          const Key('EditProfileScreenScaffold'),
        );
        expect(screenScaffoldWidget, findsOneWidget);
        expect(
          (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
              .theme!
              .scaffoldBackgroundColor,
          TalawaTheme.lightTheme.scaffoldBackgroundColor,
        );
        final imageWidgetWithPicture = find.byKey(
          const Key('UserImageInDb'),
        );
        expect(imageWidgetWithPicture, findsOneWidget);
      });
    });
    testWidgets("Testing if image selection and removal works", (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(firstName: 'Test', lastName: 'Test', email: 'test@test.com'),
        );
        await tester.pumpWidget(createChangePassScreenLight());
        await tester.pumpAndSettle();
        final screenScaffoldWidget = find.byKey(
          const Key('EditProfileScreenScaffold'),
        );
        expect(screenScaffoldWidget, findsOneWidget);
        expect(
          (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
              .theme!
              .scaffoldBackgroundColor,
          TalawaTheme.lightTheme.scaffoldBackgroundColor,
        );
        final imageAvatar = find.byKey(
          const Key('AddRemoveImageButton'),
        );
        expect(imageAvatar, findsOneWidget);
        tester.tap(imageAvatar);
      });
    });
  });
  group('Edit Profile Screen Widget Test in dark mode', () {
    testWidgets("Testing if Edit Profile Screen shows up", (tester) async {
      userConfig.updateUser(
        User(firstName: 'Test', lastName: 'Test', email: 'test@test.com'),
      );
      await tester.pumpWidget(createChangePassScreenDark());
      await tester.pumpAndSettle();
      final screenScaffoldWidget = find.byKey(
        const Key('EditProfileScreenScaffold'),
      );
      expect(screenScaffoldWidget, findsOneWidget);
      expect(
        (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
            .theme!
            .scaffoldBackgroundColor,
        TalawaTheme.darkTheme.scaffoldBackgroundColor,
      );
      final appBarText = find.byKey(
        const Key('ProfileText'),
      );
      expect(appBarText, findsOneWidget);
    });
    testWidgets("Testing if Edit Screen shows image when not exist in database",
        (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(firstName: 'Test', lastName: 'Test', email: 'test@test.com'),
        );
        await tester.pumpWidget(createChangePassScreenDark());
        await tester.pumpAndSettle();
        final screenScaffoldWidget = find.byKey(
          const Key('EditProfileScreenScaffold'),
        );
        expect(screenScaffoldWidget, findsOneWidget);
        expect(
          (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
              .theme!
              .scaffoldBackgroundColor,
          TalawaTheme.darkTheme.scaffoldBackgroundColor,
        );
        final imageWidgetWithPicture = find.byKey(
          const Key('UserImageNotInDb'),
        );
        expect(imageWidgetWithPicture, findsOneWidget);
      });
    });
    testWidgets(
        "Testing if Edit Screen shows image when already exist in database",
        (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());

        userConfig.updateUser(
          User(
            firstName: 'Test',
            lastName: 'Test',
            email: 'test@test.com',
            image: 'https://via.placeholder.com/150',
          ),
        );
        await tester.pumpWidget(createChangePassScreenDark());
        await tester.pumpAndSettle();
        final screenScaffoldWidget = find.byKey(
          const Key('EditProfileScreenScaffold'),
        );
        expect(screenScaffoldWidget, findsOneWidget);
        expect(
          (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
              .theme!
              .scaffoldBackgroundColor,
          TalawaTheme.darkTheme.scaffoldBackgroundColor,
        );
        final imageWidgetWithPicture = find.byKey(
          const Key('UserImageInDb'),
        );
        expect(imageWidgetWithPicture, findsOneWidget);
      });
    });
    testWidgets("Testing if image selection and removal works", (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(firstName: 'Test', lastName: 'Test', email: 'test@test.com'),
        );
        await tester.pumpWidget(createChangePassScreenDark());
        await tester.pumpAndSettle();
        final screenScaffoldWidget = find.byKey(
          const Key('EditProfileScreenScaffold'),
        );
        expect(screenScaffoldWidget, findsOneWidget);
        expect(
          (tester.firstWidget(find.byKey(const Key('Root'))) as MaterialApp)
              .theme!
              .scaffoldBackgroundColor,
          TalawaTheme.darkTheme.scaffoldBackgroundColor,
        );
        final imageAvatar = find.byKey(
          const Key('AddRemoveImageButton'),
        );
        expect(imageAvatar, findsOneWidget);
        tester.tap(imageAvatar);
      });
    });
  });
  group('Testing image selection and removal in Edit Profile Screen', () {
    setUp(() {
      registerServices();
      //locator<SizeConfig>().test();
    });

    tearDown(() {
      unregisterServices();
    });
    testWidgets('Testing image selection and removal in Edit Profile Screen',
        (tester) async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = EditProfilePageViewModel()
        ..addListener(notifyListenerCallback);
      model.initialize();

      // testing getImageFromGallery
      // with camera false
      when(multimediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((realInvocation) async {
        return null;
      });

      await model.getImageFromGallery();
      verify(multimediaPickerService.getPhotoFromGallery(camera: false));
      expect(model.imageFile, null);

      // with camera true
      final file = File('fakePath');
      when(multimediaPickerService.getPhotoFromGallery(camera: true))
          .thenAnswer((_) async {
        return file;
      });
      await model.getImageFromGallery(camera: true);
      verify(multimediaPickerService.getPhotoFromGallery(camera: true));
      expect(model.imageFile, file);
      verify(notifyListenerCallback());

      // testing removeImage
      model.removeImage();
      expect(model.imageFile, null);
      verify(notifyListenerCallback());
    });
  });
}
