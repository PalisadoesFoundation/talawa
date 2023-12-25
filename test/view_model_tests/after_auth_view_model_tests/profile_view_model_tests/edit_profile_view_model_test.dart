// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  testSetupLocator();
  SizeConfig().test();
  setUpAll(() {
    registerServices();
    graphqlConfig.test();
    sizeConfig.test();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('EditProfilePageViewModel Test -', () {
    test("Check if it's initialized correctly", () {
      final model = EditProfilePageViewModel();
      model.initialize();
      expect(model.imageFile, null);
    });
    test('Profile shoud be edited if new values are given', () async {
      final model = EditProfilePageViewModel();
      model.initialize();
      final Map<String, dynamic> mockData = {
        'updateUserProfile': {
          '_id': '64378abd85008f171cf2990d',
        },
      };
      final String a = await model.convertToBase64(File('path/to/newImage'));
      final Map<String, dynamic> data = {
        'users': [
          {
            '_id': '1234567890',
            'firstName': 'John',
            'lastName': 'Doe',
            'email': 'johndoe@example.com',
            'image': 'https://example.com/profile.jpg',
            'accessToken': 'exampleAccessToken',
            'refreshToken': 'exampleRefreshToken',
          }
        ],
      };
      when(
        databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: {
            'firstName': 'NewFirstName',
            'lastName': 'NewLastName',
            'newImage': 'data:image/png;base64,$a',
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: mockData,
          source: QueryResultSource.network,
          options: QueryOptions(document: gql(queries.updateUserProfile())),
        ),
      );
      when(
        databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo,
          variables: {'id': model.user.id},
        ),
      ).thenAnswer((_) async {
        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.fetchUserInfo)),
        );
      });
      await model.updateUserProfile(
        firstName: 'NewFirstName',
        lastName: 'NewLastName',
        newImage: File('path/to/newImage'),
      );

      verify(
        databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: {
            "firstName": "NewFirstName",
            "lastName": "NewLastName",
            "file": 'data:image/png;base64,$a',
          },
        ),
      ).called(1);
      verify(
        navigationService.showTalawaErrorSnackBar(
          "Profile updated successfully",
          MessageType.info,
        ),
      );
    });

    test('Test UpdateUserProfile when throwing exception', () async {
      final model = EditProfilePageViewModel();
      model.initialize();
      final String b = await model.convertToBase64(File('path/to/newIma'));
      when(
        databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: {
            'firstName': 'NewFirstNa',
            'lastName': 'NewLastNa',
            'newImage': 'data:image/png;base64,$b',
          },
        ),
      ).thenThrow(Exception());
      when(
        databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo,
          variables: {'id': model.user.id},
        ),
      ).thenThrow(Exception());
      await model.updateUserProfile(
        firstName: 'NewFirstNa',
        lastName: 'NewLastNa',
        newImage: File('path/to/newIma'),
      );
      verify(
        navigationService.showTalawaErrorSnackBar(
          "Something went wrong",
          MessageType.error,
        ),
      );
    });
    testWidgets('Test if SelectImage from camera method works',
        (WidgetTester tester) async {
      final model = EditProfilePageViewModel();
      model.initialize();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  key: const Key('btn1'),
                  onPressed: () => model.selectImage(camera: true),
                  child: const Text('listner'),
                );
              },
            ),
          ),
        ),
      );
      final file = File('fakePath');
      when(locator<MultiMediaPickerService>().getPhotoFromGallery(camera: true))
          .thenAnswer((realInvocation) async {
        return file;
      });
      await tester.tap(find.byKey(const Key('btn1')));
      await tester.pumpAndSettle();
      verify(multimediaPickerService.getPhotoFromGallery(camera: true))
          .called(1);
      expect(model.imageFile, file);
    });

    testWidgets('Test if selectImage from gallery method works',
        (WidgetTester tester) async {
      final model = EditProfilePageViewModel();
      model.initialize();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  key: const Key('btn1'),
                  onPressed: () => model.selectImage(),
                  child: const Text('listner'),
                );
              },
            ),
          ),
        ),
      );
      final file = File('fakePath');
      when(locator<MultiMediaPickerService>().getPhotoFromGallery())
          .thenAnswer((realInvocation) async {
        return file;
      });
      await tester.tap(find.byKey(const Key('btn1')));
      await tester.pumpAndSettle();

      expect(model.imageFile, file);
    });
    testWidgets(
        'Test if SelectImage from camera method works if null is returned',
        (WidgetTester tester) async {
      final model = EditProfilePageViewModel();
      model.initialize();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  key: const Key('btn1'),
                  onPressed: () => model.selectImage(camera: true),
                  child: const Text('listner'),
                );
              },
            ),
          ),
        ),
      );
      when(locator<MultiMediaPickerService>().getPhotoFromGallery(camera: true))
          .thenAnswer((realInvocation) async {
        return null;
      });
      await tester.tap(find.byKey(const Key('btn1')));
      await tester.pumpAndSettle();
      verify(multimediaPickerService.getPhotoFromGallery(camera: true))
          .called(1);
      expect(model.imageFile, null);
    });
    testWidgets(
        'Test if selectImage from gallery method works when null is returned',
        (WidgetTester tester) async {
      final model = EditProfilePageViewModel();
      model.initialize();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  key: const Key('btn1'),
                  onPressed: () => model.selectImage(),
                  child: const Text('listner'),
                );
              },
            ),
          ),
        ),
      );
      when(locator<MultiMediaPickerService>().getPhotoFromGallery())
          .thenAnswer((realInvocation) async {
        return null;
      });
      await tester.tap(find.byKey(const Key('btn1')));
      await tester.pumpAndSettle();
      expect(model.imageFile, null);
    });

    test('No update performed if inputs are the same as existing data',
        () async {
      final model = EditProfilePageViewModel();
      model.initialize();
      await model.updateUserProfile(
        firstName: model.user.firstName,
        lastName: model.user.lastName,
        newImage: null,
      );
      verifyNever(
        databaseFunctions.gqlAuthMutation(
          queries.updateUserProfile(),
          variables: {'id': 'xzy1'},
        ),
      );
    });

    test('convertToBase64 converts file to base64 string', () async {
      final model = EditProfilePageViewModel();
      model.initialize();
      //using this asset as the test asset
      final file = File('assets/images/Group 8948.png');
      final fileString = await model.convertToBase64(file);
      expect(model.base64Image, fileString);
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
