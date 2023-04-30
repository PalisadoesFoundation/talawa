// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/after_auth_view_models/add_post_view_models/add_post_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
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
        locator<MultiMediaPickerService>().getPhotoFromGallery(camera: true),
      );
      verify(
        locator<NavigationService>().showTalawaErrorSnackBar(
          "Image is added",
          MessageType.info,
        ),
      );

      expect(model.imageFile, file);

      verify(notifyListenerCallback());
    });
    test("Check if upload post works correctly", () async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = AddPostViewModel()..addListener(notifyListenerCallback);
      final query = PostQueries().uploadPost();
      model.initialise();

      await model.uploadPost();
      verify(
        locator<NavigationService>().showTalawaErrorSnackBar(
          "Post is uploaded",
          MessageType.info,
        ),
      );
      verify(
        locator<DataBaseMutationFunctions>().gqlAuthMutation(
          query,
          variables: {
            "text": "",
            "organizationId": "XYZ",
            "title": "",
          },
        ),
      );
      verify(notifyListenerCallback());
    });
    test("Check if remove_image method works correctly", () async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = AddPostViewModel()..addListener(notifyListenerCallback);

      model.initialise();

      final file = File('fakePath');
      when(locator<MultiMediaPickerService>().getPhotoFromGallery(camera: true))
          .thenAnswer((_) async {
        return file;
      });

      await model.getImageFromGallery(camera: true);
      model.removeImage();
      expect(model.imageFile, null);
    });

    test('getCurrentString returns correct string', () {
      final model = AddPostViewModel();
      model.initialise();
      model.postController.text = 'Hello world';
      model.postController.selection = const TextSelection(
        baseOffset: 6,
        extentOffset: 11,
      );
      final currentString = model.getCurrentString();
      expect(currentString.left, equals(6));
      expect(currentString.right, equals(11));
      expect(
        model.postController.text
            .substring(currentString.left, currentString.right),
        equals('world'),
      );
    });

    // test('onTagClick should update postController with selected tag', () {
    //   final viewModel = AddPostViewModel();
    //   viewModel.initialise();
    //   const tag = 'CodeNewbie';
    //   const expectedText = '#CodeNewbie ';

    //   viewModel.postController.text = 'This is a post about Flutter.';

    //   // Get the current cursor position in the text field
    //   final currentPosition = viewModel.postController.selection.baseOffset;
    //   print(curentPosition);

    //   // Create a new StringRange object that contains the left and right indices of the current word
    //   final range = viewModel.getCurrentString();

    //   // Move the cursor to the left of the current word
    //   viewModel.postController.selection = TextSelection(
    //     baseOffset: range.left,
    //     extentOffset: range.left,
    //   );

    //   // Call onTagClick with the selected tag
    //   viewModel.onTagClick(tag);

    //   // Check if the postController text has been updated with the selected tag
    //   expect(viewModel.postController.text, expectedText);

    //   // Check if the cursor position has been updated correctly
    //   expect(
    //     viewModel.postController.selection.baseOffset,
    //     currentPosition + expectedText.length,
    //   );
    // });

    test(
        'AddPostViewModel Test - handleTextChange should bring relevant hashtags',
        () async {
      final addPostViewModel = AddPostViewModel();
      const hashtag = '#test';

      // Simulate user input
      addPostViewModel.controller.text = hashtag;
      addPostViewModel.postController.selection = const TextSelection(
        baseOffset: 0,
        extentOffset: 4,
      );

      addPostViewModel.handleTextChange(null);

      // Expect that the hashtag list is shown and contains the correct hashtag
      expect(addPostViewModel.showHashtagList, true);
      expect(addPostViewModel.fetchedhashtags, contains('TestAutomation'));
    });
    test(
        'AddPostViewModel Test - handleTextChange should bring relevant hashtags',
        () async {
      final addPostViewModel = AddPostViewModel();
      const hashtag = '#fla';

      // Simulate user input
      addPostViewModel.controller.text = hashtag;
      addPostViewModel.postController.selection = const TextSelection(
        baseOffset: 0,
        extentOffset: 3,
      );

      addPostViewModel.handleTextChange(null);

      // Expect that the hashtag list is shown and contains the correct hashtag
      expect(addPostViewModel.showHashtagList, true);
      expect(addPostViewModel.fetchedhashtags, contains('Flask'));
    });
  });
}
