// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';

import '../../../helpers/test_helpers.dart';

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  setUp(() {
    registerServices();
  });

  group('EditProfilePageViewModel Test -', () {
    test("Check if it's initialized correctly", () {
      final model = EditProfilePageViewModel();
      model.initialize();

      expect(model.imageFile, null);
    });

    test(
        'Check if getImageFromGallery() is working fine when no image is return',
        () async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = EditProfilePageViewModel()
        ..addListener(notifyListenerCallback);

      when(locator<MultiMediaPickerService>().getPhotoFromGallery())
          .thenAnswer((realInvocation) async {
        return null;
      });

      model.initialize();
      await model.getImageFromGallery();

      expect(model.imageFile, null);
      verifyNever(notifyListenerCallback());
    });

    test('Check if getImageFromGallery() is working fine when iamge is return',
        () async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = EditProfilePageViewModel()
        ..addListener(notifyListenerCallback);

      final file = File('fakePath');
      when(locator<MultiMediaPickerService>().getPhotoFromGallery())
          .thenAnswer((realInvocation) async {
        return file;
      });

      model.initialize();
      await model.getImageFromGallery();

      expect(model.imageFile, file);
      verify(notifyListenerCallback()).called(1);
    });

    test('Check if removeImage() is working fine', () async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = EditProfilePageViewModel()
        ..addListener(notifyListenerCallback);

      model.removeImage();

      expect(model.imageFile, null);
      verify(notifyListenerCallback()).called(1);
    });
  });
}
