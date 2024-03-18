// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   test('', () {});
// }

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';

import '../../../helpers/test_helpers.dart';

class MockMultiMediaPickerService extends Mock
    implements MultiMediaPickerService {}

void main() {
  setupLocator();
  // // Initialize GetIt instance
  // GetIt locator = GetIt.instance;
  // // Register userConfig with GetIt
  // locator.registerLazySingleton<UserConfig>(() => UserConfig());
  // locator.registerLazySingleton<DataBaseMutationFunctions>(
  //     () => DataBaseMutationFunctions());
  group('EditProfilePageViewModel Tests', () {
    late EditProfilePageViewModel viewModel;
    late MockMultiMediaPickerService mockMultiMediaPickerService;

    setUp(() {
      mockMultiMediaPickerService = MockMultiMediaPickerService();
      viewModel = EditProfilePageViewModel();
      viewModel.multiMediaPickerService = mockMultiMediaPickerService;
    });

    test('Initialization Test', () {
      viewModel.initialize();

      expect(viewModel.imageFile, isNull);
      expect(viewModel.base64Image, isNull);
      expect(viewModel.firstNameTextController, isNotNull);
      expect(viewModel.lastNameTextController, isNotNull);
      expect(viewModel.firstNameFocus, isNotNull);
      expect(viewModel.lastNameFocus, isNotNull);
      expect(viewModel.databaseService, isNotNull);
    });

    test('Get Image from Gallery Test', () async {
      final viewModel = EditProfilePageViewModel();
      final mock = getAndRegisterMultiMediaPickerService();
      viewModel.initialize();
      final File imageFile = File('path/to/image.jpg');
      when(mock.getPhotoFromGallery(camera: false)).thenAnswer((_) async {
        return imageFile;
      });
      await viewModel.getImage();
      expect(viewModel.imageFile, equals(imageFile));
    });

    ///////////////////////////////////////////
  });
}
