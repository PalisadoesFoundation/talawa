// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_profile_service.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('EditProfilePageViewModel - updateUserProfile', () {
    setUp(() {
      // Ensure currentUser is stubbed for view model usage

      when(userConfig.currentUser)
          .thenReturn(User(id: 'u1', name: 'John', email: 'john@example.com'));
    });
    test('returns early when no changes (name/email same and no image)',
        () async {
      final model = EditProfilePageViewModel();
      model.initialize();

      // Ensure no snackbar called
      await model.updateUserProfile(
          name: model.user.name, email: model.user.email, newImage: null);
      verifyNever(navigationService.showTalawaErrorSnackBar(
          'Profile updated successfully', MessageType.info));
    });

    test('returns early when no changes are made - noData scenario', () async {
      final model = EditProfilePageViewModel();
      model.initialize();

      // Call with unchanged values - should return early without calling services
      await model.updateUserProfile(
        name: model.user.name,
        email: model.user.email,
        newImage: null,
      );

      // Since no changes were made, no database calls should be made
      verifyNever(userProfileService.updateUserProfile(any));
    });

    test('updates only name and persists new user', () async {
      final model = EditProfilePageViewModel();
      model.initialize();

      // Stub mutation success
      when(userProfileService.updateUserProfile(any))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {'ok': true},
                options: QueryOptions(document: gql('{ __typename }')),
              ));
      // Stub user info fetch result
      when(userProfileService.getUserProfileInfo(model.user))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'user': {
                    'id': model.user.id,
                    'name': 'New Name',
                    'email': model.user.email,
                  }
                },
                options: QueryOptions(document: gql('{ __typename }')),
              ));

      await model.updateUserProfile(name: 'New Name');

      // Verify mutation and fetch called
      verify(userProfileService
          .updateUserProfile(argThat(containsPair('name', 'New Name'))));
      verify(userProfileService.getUserProfileInfo(model.user));
      // Success snackbar
      verify(navigationService.showTalawaErrorSnackBar(
          'Profile updated successfully', MessageType.info));
    });

    test('updates only email and persists new user', () async {
      final model = EditProfilePageViewModel();
      model.initialize();

      when(userProfileService.updateUserProfile(any))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {'ok': true},
                options: QueryOptions(document: gql('{ __typename }')),
              ));
      when(userProfileService.getUserProfileInfo(model.user))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'user': {
                    'id': model.user.id,
                    'name': model.user.name,
                    'email': 'new@example.com',
                  }
                },
                options: QueryOptions(document: gql('{ __typename }')),
              ));

      await model.updateUserProfile(email: 'new@example.com');

      verify(userProfileService.updateUserProfile(
          argThat(containsPair('emailAddress', 'new@example.com'))));
      verify(userProfileService.getUserProfileInfo(model.user));
      verify(navigationService.showTalawaErrorSnackBar(
          'Profile updated successfully', MessageType.info));
    });

    test('updates avatar when newImage provided', () async {
      final model = EditProfilePageViewModel();
      model.initialize();

      when(userProfileService.updateUserProfile(any))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {'ok': true},
                options: QueryOptions(document: gql('{ __typename }')),
              ));
      when(userProfileService.getUserProfileInfo(model.user))
          .thenAnswer((_) async => QueryResult(
                source: QueryResultSource.network,
                data: {
                  'user': {
                    'id': model.user.id,
                    'name': model.user.name,
                    'email': model.user.email,
                  }
                },
                options: QueryOptions(document: gql('{ __typename }')),
              ));

      await model.updateUserProfile(newImage: File('dummy'));

      verify(userProfileService.updateUserProfile(argThat(contains('avatar'))));
      verify(userProfileService.getUserProfileInfo(model.user));
      verify(navigationService.showTalawaErrorSnackBar(
          'Profile updated successfully', MessageType.info));
    });

    test('shows error when action throws', () async {
      final model = EditProfilePageViewModel();
      model.initialize();

      final ups = locator<UserProfileService>();
      final nav = locator<NavigationService>();

      when(ups.updateUserProfile(any)).thenThrow(Exception('boom'));

      await model.updateUserProfile(name: 'X');

      verify(nav.showTalawaErrorSnackBar(
          'Something went wrong', MessageType.error));
    });
  });
}
