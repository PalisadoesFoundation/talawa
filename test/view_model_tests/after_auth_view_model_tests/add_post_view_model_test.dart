import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';

import '../../helpers/test_helpers.dart';

class MockCallbackFunction extends Mock {
  call();
}

void main() {
  setUp(() {
    registerServices();
  });
  group("AddPostViewModel Test - ", () {
    test("Check if it's initialized correctly", () {
      final model = AddPostViewModel();
      model.initialise();

      expect(model.imageFile, null);
      expect(model.orgName, userConfig.currentOrg.name);
      expect(
        model.userName,
        userConfig.currentUser.firstName! + userConfig.currentUser.lastName!,
      );
    });
    test("Check if getImageFromGallery() is working fine", () async {
      final model = AddPostViewModel();
      model.initialise();

      when(locator<MultiMediaPickerService>().getPhotoFromGallery())
          .thenAnswer((_) async {
        return null;
      });

      await model.getImageFromGallery();
      verify(locator<MultiMediaPickerService>().getPhotoFromGallery());
      expect(model.imageFile, null);
    });
    test("Check if getImageFromGallery() is working fine (camera is true)",
        () async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = AddPostViewModel()..addListener(notifyListenerCallback);
      model.initialise();

      final file = File('fakePath');
      when(locator<MultiMediaPickerService>().getPhotoFromGallery(camera: true))
          .thenAnswer((_) async {
        return file;
      });

      await model.getImageFromGallery(camera: true);

      verify(
          locator<MultiMediaPickerService>().getPhotoFromGallery(camera: true));

      expect(model.imageFile, file);

      verify(notifyListenerCallback());
    });
    test("Check if uploadPost() is working fine", () {
      final notifyListenerCallback = MockCallbackFunction();
      final model = AddPostViewModel()..addListener(notifyListenerCallback);
      model.initialise();

      when(navigationService.showSnackBar("Post is uploaded"))
          .thenAnswer((_) {});

      model.uploadPost();

      expect(model.imageFile, null);
      verify(notifyListenerCallback());
      expect(model.controller.text, "");
      verify(navigationService.showSnackBar("Post is uploaded"));
    });
  });
}
