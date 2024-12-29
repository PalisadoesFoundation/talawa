import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';
import 'package:talawa/views/after_auth_screens/profile/edit_profile_page.dart';
import 'package:talawa/views/base_view.dart';
import '../../../helpers/test_locator.dart';

Widget createEditProfilePage({required EditProfilePageViewModel viewModel}) {
  return BaseView<EditProfilePageViewModel>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          key: Key('EditProfileScreenScaffold'),
          body: EditProfilePage(),
        ),
      );
    },
  );
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();

    // Mock ViewModel methods
    final mockViewModel = locator<EditProfilePageViewModel>();
    when(mockViewModel.initialize()).thenAnswer((_) async {});
    when(
      mockViewModel.updateUserProfile(
        firstName: anyNamed('firstName'),
        lastName: anyNamed('lastName'),
        newImage: anyNamed('newImage'),
      ),
    ).thenAnswer((_) async {});
  });

  tearDownAll(() {
    locator.reset();
  });

  group('EditProfilePage Tests', () {
    testWidgets('Check if profile image and button are displayed',
        (tester) async {
      await tester.pumpWidget(
        createEditProfilePage(
          viewModel: locator<EditProfilePageViewModel>(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('profilepic')), findsOneWidget);
      expect(find.byKey(const Key('AddRemoveImageButton')), findsOneWidget);
    });

    testWidgets('Test Add/Remove Image Button functionality', (tester) async {
      await tester.pumpWidget(
        createEditProfilePage(
          viewModel: locator<EditProfilePageViewModel>(),
        ),
      );
      await tester.pumpAndSettle();

      final addRemoveButton = find.byKey(const Key('AddRemoveImageButton'));
      await tester.tap(addRemoveButton);
      await tester.pumpAndSettle();

      expect(find.byType(BottomSheet), findsOneWidget);
      final cameraButton = find.byKey(const Key('selectCamera'));
      final galleryButton = find.byKey(const Key('selectGallery'));
      expect(cameraButton, findsOneWidget);
      expect(galleryButton, findsOneWidget);

      await tester.tap(cameraButton);
      await tester.pumpAndSettle();
    });

    testWidgets('Check if first and last name text fields are present',
        (tester) async {
      await tester.pumpWidget(
        createEditProfilePage(
          viewModel: locator<EditProfilePageViewModel>(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('FirstNameTextField')), findsOneWidget);
      expect(find.byType(TextFormField), findsWidgets);
    });

    testWidgets('Test Update button functionality', (tester) async {
      await tester.pumpWidget(
        createEditProfilePage(
          viewModel: locator<EditProfilePageViewModel>(),
        ),
      );
      await tester.pumpAndSettle();

      final updateButton = find.byKey(const Key('updatebtn'));
      expect(updateButton, findsOneWidget);

      await tester.tap(updateButton);
      await tester.pump();
      verify(
        locator<EditProfilePageViewModel>().updateUserProfile(
          firstName: 'Test',
          lastName: 'User',
          newImage: null,
        ),
      );
    });

    testWidgets('Check if Email section is displayed', (tester) async {
      await tester.pumpWidget(
        createEditProfilePage(
          viewModel: locator<EditProfilePageViewModel>(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Email'), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
    });
  });
}
