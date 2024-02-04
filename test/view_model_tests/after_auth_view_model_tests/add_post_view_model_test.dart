// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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

final demoJson = {
  'createPost': {
    '__typename': 'Post',
    '_id': '1',
    'text': 'text #hastag',
    'createdAt': '2023-11-13T19:28:21.095Z',
    'imageUrl': 'https://imageurl',
    'videoUrl': 'https://videoUrl',
    'title': 'demo title',
    'commentCount': 0,
    'likeCount': 0,
    'creator': {
      '__typename': 'User',
      '_id': '1',
      'firstName': 'Ayush',
      'lastName': 'Raghuwanshi',
      'image': 'https://imageUrl',
    },
    'organization': {'__typename': 'Organization', '_id': '1'},
    'likedBy': [],
    'comments': [],
  },
};

void main() {
  testSetupLocator();
  setUp(() {
    registerServices();
    getAndRegisterImageService();
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

    test('Test for imageInBase64 getter', () async {
      final model = AddPostViewModel();
      model.initialise();
      expect(model.imageInBase64, null);
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
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final notifyListenerCallback = MockCallbackFunction();
      final model = AddPostViewModel()..addListener(notifyListenerCallback);
      model.initialise();
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          PostQueries().uploadPost(),
          variables: {
            "text": " #",
            "organizationId": 'XYZ',
            "title": '',
          },
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(PostQueries().uploadPost())),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );

      await model.uploadPost();
      verify(
        locator<NavigationService>().showTalawaErrorSnackBar(
          "Post is uploaded",
          MessageType.info,
        ),
      );
      // verify(
      //   locator<DataBaseMutationFunctions>().gqlAuthMutation(
      //     query,
      //     variables: {
      //       "text": "",
      //       "organizationId": "XYZ",
      //       "title": "",
      //       "file":"",
      //     },
      //   ),
      // );
      verify(notifyListenerCallback());
    });
    test('uploadPost with _imageFile != null and throws no exception',
        () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final viewModel = AddPostViewModel();
      viewModel.initialise();
      final mockImageFile = File(
        'path/to/mockImage.png',
      );
      viewModel.setImageFile(mockImageFile);

      await viewModel.setImageInBase64(mockImageFile);

      viewModel.controller.text = "Some post content";
      viewModel.textHashTagController.text = "hashtag";
      viewModel.titleController.text = "Post Title";
      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          PostQueries().uploadPost(),
          variables: {
            "text": 'Some post content',
            "organizationId": 'XYZ',
            "title": 'Post Title',
            "file": 'data:image/png;base64,',
          },
        ),
      ).thenAnswer(
        (realInvocation) async => QueryResult(
          options: QueryOptions(document: gql(PostQueries().uploadPost())),
          data: demoJson,
          source: QueryResultSource.network,
        ),
      );

      await viewModel.uploadPost();
      verify(
        locator<NavigationService>().showTalawaErrorSnackBar(
          "Post is uploaded",
          MessageType.info,
        ),
      ).called(1);
    });
    test('uploadPost with _imageFile == null', () async {
      final viewModel = AddPostViewModel();
      viewModel.initialise();
      viewModel.controller.text = "Some post content";
      viewModel.textHashTagController.text = "hashtag";
      viewModel.titleController.text = "Post Title";
      when(
        locator<DataBaseMutationFunctions>().gqlAuthMutation(
          PostQueries().uploadPost(),
          variables: anyNamed('variables'),
        ),
      ).thenThrow(Exception("exception"));

      await viewModel.uploadPost();
      verify(
        locator<NavigationService>().showTalawaErrorSnackBar(
          "Something went wrong",
          MessageType.error,
        ),
      ).called(1);
    });
    test('uploadPost with _imageFile != null', () async {
      final viewModel = AddPostViewModel();
      viewModel.initialise();
      final mockImageFile = File(
        'path/to/mockImage.png',
      );
      viewModel.setImageFile(mockImageFile);

      await viewModel.setImageInBase64(mockImageFile);
      viewModel.controller.text = "Some post content";
      viewModel.textHashTagController.text = "hashtag";
      viewModel.titleController.text = "Post Title";
      when(
        locator<DataBaseMutationFunctions>().gqlAuthMutation(
          PostQueries().uploadPost(),
          variables: anyNamed('variables'),
        ),
      ).thenThrow(Exception("exception"));

      await viewModel.uploadPost();
      verify(
        locator<NavigationService>().showTalawaErrorSnackBar(
          "Something went wrong",
          MessageType.error,
        ),
      ).called(1);
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
  });
}
