import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/constants/custom_theme.dart';
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

/// MockBuildContext class helps to mock the BuildContext class.
class MockBuildContext extends Mock implements BuildContext {}

/// MockEditProfilePageViewModel class helps to mock the EditProfilePageViewModel class.
class MockEditProfilePageViewModel extends Mock
    implements EditProfilePageViewModel {}

/// MockCallbackFunction class helps to mock the callback function.
class MockCallbackFunction extends Mock {
  /// call function helps to mock the call function.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void call();
}

/// 'createEditProfilePage' is used to create the EditProfilePage widget in light mode.
///
/// **params**:
/// * `themeMode`: Represents the theme mode of the widget.
///
/// **returns**:
/// * `Widget`: Returns the EditProfilePage widget.
Widget createEditProfilePage({ThemeMode themeMode = ThemeMode.light}) =>
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
          theme: themeMode == ThemeMode.light
              ? TalawaTheme.lightTheme
              : TalawaTheme.darkTheme,
          home: const EditProfilePage(),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
        );
      },
    );
Future<void> main() async {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
  });
  group('Edit Profile Screen Widget Test in light mode', () {
    testWidgets("Testing if Edit Profile Screen shows up", (tester) async {
      userConfig.updateUser(
        User(name: 'Test Test', email: 'test@test.com'),
      );
      await tester
          .pumpWidget(createEditProfilePage(themeMode: ThemeMode.light));
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
          User(name: 'Test Test', email: 'test@test.com'),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.light));
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
          const Key('profilepic'),
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
            name: 'Test Test',
            email: 'test@test.com',
            image: 'https://via.placeholder.com/150',
          ),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.light));
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
          const Key('profilepic'),
        );
        expect(imageWidgetWithPicture, findsOneWidget);
      });
    });
    testWidgets("Testing if image selection and removal works", (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(name: 'Test Test', email: 'test@test.com'),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.light));
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
        await tester.tap(imageAvatar);
        await tester.pumpAndSettle();
      });
    });
    testWidgets("Testing user initials display when no image exists",
        (tester) async {
      await mockNetworkImages(() async {
        // Set up user with name but no image
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(name: 'Test Test', email: 'test@test.com'),
        );

        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.light));
        await tester.pumpAndSettle();

        final screenScaffoldWidget = find.byKey(
          const Key('EditProfileScreenScaffold'),
        );
        expect(screenScaffoldWidget, findsOneWidget);

        // Find the CircleAvatar and verify initials are displayed
        final profilePic = find.byKey(const Key('profilepic'));
        expect(profilePic, findsOneWidget);

        // Verify the initials 'TT' are displayed (first letter of first and last name)
        expect(find.text('TT'), findsOneWidget);
      });
    });
  });

  group('Edit Profile Screen Widget Test in dark mode', () {
    testWidgets("Testing if Edit Profile Screen shows up", (tester) async {
      userConfig.updateUser(
        User(name: 'Test Test', email: 'test@test.com'),
      );
      await tester.pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
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
    const Key('profilepic');
    testWidgets(
        "Testing if Edit Screen shows image when already exist in database",
        (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());

        userConfig.updateUser(
          User(
            name: 'Test Test',
            email: 'test@test.com',
            image: 'https://via.placeholder.com/150',
          ),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
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
          const Key('profilepic'),
        );
        expect(imageWidgetWithPicture, findsOneWidget);
      });
    });
    testWidgets("Testing if modalSheet appears when changing profile picture",
        (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());

        userConfig.updateUser(
          User(
            name: 'Test Test',
            email: 'test@test.com',
            image: 'https://via.placeholder.com/150',
          ),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
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
        await tester.tap(find.byKey(const Key('AddRemoveImageButton')));
        await tester.pumpAndSettle();
        expect(find.text('Camera'), findsOneWidget);
        expect(find.text('Gallery'), findsOneWidget);
        expect(find.byIcon(Icons.camera_alt), findsOneWidget);
        expect(find.byIcon(Icons.photo_library), findsOneWidget);
      });
    });
    testWidgets("Testing if image selection from camera work fine",
        (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());

        userConfig.updateUser(
          User(
            name: 'Test Test',
            email: 'test@test.com',
            image: 'https://via.placeholder.com/150',
          ),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
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
        await tester.tap(find.byKey(const Key('AddRemoveImageButton')));
        await tester.pumpAndSettle();
        expect(find.text('Camera'), findsOneWidget);
        expect(find.text('Gallery'), findsOneWidget);
        expect(find.byIcon(Icons.camera_alt), findsOneWidget);
        expect(find.byIcon(Icons.photo_library), findsOneWidget);

        await tester.ensureVisible(find.byIcon(Icons.camera_alt));
        await tester.tap(find.byIcon(Icons.camera_alt));
      });
    });
    testWidgets("Testing if image selection from gallery work fine",
        (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());

        userConfig.updateUser(
          User(
            name: 'Test Test',
            email: 'test@test.com',
            image: 'https://via.placeholder.com/150',
          ),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
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
        await tester.tap(find.byKey(const Key('AddRemoveImageButton')));
        await tester.pumpAndSettle();
        expect(find.text('Camera'), findsOneWidget);
        expect(find.text('Gallery'), findsOneWidget);
        expect(find.byIcon(Icons.camera_alt), findsOneWidget);
        expect(find.byIcon(Icons.photo_library), findsOneWidget);

        await tester.ensureVisible(find.byIcon(Icons.photo_library));
        await tester.tap(find.byIcon(Icons.photo_library));
      });
    });
    testWidgets("Testing if image selection and removal works", (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(name: 'Test Test', email: 'test@test.com'),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
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
    testWidgets("Testing Update butoon", (tester) async {
      await mockNetworkImages(() async {
        userConfig.updateUser(User());
        userConfig.updateUser(
          User(name: 'Test Test', email: 'test@test.com'),
        );
        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
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
        final updateButtonFinder = find.byKey(const Key('updatebtn'));
        expect(updateButtonFinder, findsOneWidget);
        await tester.tap(updateButtonFinder);
        await tester.pumpAndSettle();
      });
    });
  });
  group('Testing image selection and removal in Edit Profile Screen', () {
    setUp(() {
      registerServices();
      locator<SizeConfig>().test();
    });

    tearDown(() {
      unregisterServices();
    });

    testWidgets(
        'Testing image selection when user is selecting image from device',
        (tester) async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = EditProfilePageViewModel()
        ..addListener(notifyListenerCallback);
      model.initialize();

      // with camera true
      final file = File('fakePath');
      when(multimediaPickerService.getPhotoFromGallery(camera: true))
          .thenAnswer((_) async {
        return file;
      });
      await model.selectImage(camera: true);
      verify(multimediaPickerService.getPhotoFromGallery(camera: true));
      expect(model.imageFile, file);
      verify(notifyListenerCallback());
      await tester.pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('AddRemoveImageButton')), findsOneWidget);
      await tester.tap(find.byKey(const Key('AddRemoveImageButton')));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.camera_alt));
      await tester.pumpAndSettle();
      expect(model.imageFile, isNotNull);
    });
    testWidgets('Testing if image removal work properly', (tester) async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = EditProfilePageViewModel()
        ..addListener(notifyListenerCallback);
      model.initialize();

      // testing removeImage
      model.removeImage();
      expect(model.imageFile, null);
      verify(notifyListenerCallback());
    });

    testWidgets("Testing if name text field gets focus on onPressed",
        (tester) async {
      // Mock or set up user data
      userConfig.updateUser(
        User(name: 'Test Test', email: 'test@test.com'),
      );

      // Render the widget
      await tester.pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();

      // Find the 'Name' text field and its suffix icon
      final nameTextField = find.byKey(const Key('NameTextField'));
      final editIconButton = find.descendant(
        of: nameTextField,
        matching: find.byIcon(Icons.edit),
      );

      // Ensure the text field and icon exist
      expect(nameTextField, findsOneWidget);
      expect(editIconButton, findsOneWidget);

      // Tap on the edit icon button to trigger focus
      await tester.tap(editIconButton);
      await tester.pumpAndSettle();

      // Verify that the nameFocus is focused
      final focusedElement =
          FocusScope.of(tester.element(nameTextField)).focusedChild;
      expect(focusedElement, isNotNull); // Ensure there is a focused child
      expect(
        focusedElement!.hasPrimaryFocus,
        isTrue,
      ); // Ensure it has primary focus
    });

    testWidgets("Testing if email text field gets focus on onPressed",
        (tester) async {
      // Mock or set up user data
      userConfig.updateUser(
        User(name: 'Test Test', email: 'test@test.com'),
      );

      // Render the widget
      await tester.pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();

      // Find the 'Email' text field and its suffix icon
      final emailTextField = find.byKey(const Key('emailTextField'));
      final editIconButton = find.descendant(
        of: emailTextField,
        matching: find.byIcon(Icons.edit),
      );

      // Ensure the text field and icon exist
      expect(emailTextField, findsOneWidget);
      expect(editIconButton, findsOneWidget);

      // Tap on the edit icon button to trigger focus
      await tester.tap(editIconButton);
      await tester.pumpAndSettle();

      // Verify that the emailFocus is focused
      final focusedElement =
          FocusScope.of(tester.element(emailTextField)).focusedChild;
      expect(focusedElement, isNotNull); // Ensure there is a focused child
      expect(
        focusedElement!.hasPrimaryFocus,
        isTrue,
      ); // Ensure it has primary focus
    });

    testWidgets(
        "Testing EditProfilePageViewModel.removeImage clears imageFile and notifies listeners",
        (tester) async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = EditProfilePageViewModel()
        ..addListener(notifyListenerCallback);
      model.initialize();

      // Directly set imageFile (bypassing the mocked selectImage)
      final file = File('fakePath');
      model.imageFile = file;
      expect(model.imageFile, file);

      // Now remove the image via model (simulates the UI tap calling removeImage)
      model.removeImage();
      expect(model.imageFile, isNull);
      // Verify notifyListeners was called for removeImage
      verify(notifyListenerCallback()).called(greaterThanOrEqualTo(1));
    });

    testWidgets(
        "Testing removeImage via widget UI after selecting image from camera",
        (tester) async {
      await mockNetworkImages(() async {
        // Mock the multimedia picker service to return a file for both camera variants
        final file = File('fakePath');
        when(multimediaPickerService.getPhotoFromGallery(camera: true))
            .thenAnswer((_) async => file);
        when(multimediaPickerService.getPhotoFromGallery(camera: false))
            .thenAnswer((_) async => file);

        userConfig.updateUser(
          User(name: 'Test Test', email: 'test@test.com'),
        );

        await tester
            .pumpWidget(createEditProfilePage(themeMode: ThemeMode.dark));
        await tester.pumpAndSettle();

        // Step 1: Tap the AddRemoveImageButton to open modal
        await tester.tap(find.byKey(const Key('AddRemoveImageButton')));
        await tester.pumpAndSettle();

        // Step 2: Tap camera icon to select image
        expect(find.byIcon(Icons.camera_alt), findsOneWidget);
        await tester.tap(find.byIcon(Icons.camera_alt));

        // Wait for the async image selection to complete and UI to settle
        await tester.pumpAndSettle();

        // Step 3: Tap AddRemoveImageButton again - this should call removeImage (line 118)
        await tester.tap(find.byKey(const Key('AddRemoveImageButton')));
        await tester.pumpAndSettle();
      });
    });
  });
}
