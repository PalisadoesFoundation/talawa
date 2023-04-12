// ignore_for_file: avoid_dynamic_calls
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

/// UserConfig class provides different services in the context of the User.
///
/// Services include:
/// * `userLoggedIn` : helps to make user logged in to the application.
/// * `updateUserJoinedOrg` : helps to update the user joined organization.
/// * `updateUserCreatedOrg` : helps to update the user created organization.
/// * `updateUserMemberRequestOrg` : helps to update the User membership request for the organization.
/// * `updateUserAdminOrg` : helps to update the Admin of the Organization.
/// * `updateAccessToken` : helps to update the access token of an user.
/// * `updateUser` : helps to update the user.
class UserConfig {
  // variables
  late User? _currentUser = User(id: 'null', authToken: 'null');
  late OrgInfo? _currentOrg = OrgInfo(name: 'Organization Name', id: 'null');
  late Stream<OrgInfo> _currentOrgInfoStream;
  final StreamController<OrgInfo> _currentOrgInfoController =
      StreamController<OrgInfo>.broadcast();

  ///getter for the current org information.
  Stream<OrgInfo> get currentOrgInfoStream => _currentOrgInfoStream;

  ///getter for current org info controller.
  StreamController<OrgInfo> get currentOrgInfoController =>
      _currentOrgInfoController;

  ///getter for current org.
  OrgInfo get currentOrg => _currentOrg!;

  ///getter for current org name.
  String get currentOrgName => _currentOrg!.name!;
  set currentOrg(OrgInfo org) => _currentOrg = org;

  ///getter for current org user.
  User get currentUser => _currentUser!;
  set currentUser(User user) {
    _currentUser = user;
  }

  /// function for initialising the stream.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialiseStream() {
    _currentOrgInfoStream =
        _currentOrgInfoController.stream.asBroadcastStream();
  }

  /// This function is used to log in the user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: wether the user has logged in
  Future<bool> userLoggedIn() async {
    initialiseStream();
    final boxUser = Hive.box<User>('currentUser');
    final boxOrg = Hive.box<OrgInfo>('currentOrg');
    _currentOrg =
        boxOrg.get('org') ?? OrgInfo(name: 'Organization Name', id: 'null');
    _currentOrgInfoController.add(_currentOrg!);

    _currentUser = boxUser.get('user');
    // if there is not currentUser then returns false.
    if (_currentUser == null) {
      _currentUser = User(id: 'null', authToken: 'null');
      return false;
    }
    // generate access token
    graphqlConfig.getToken().then((value) async {
      databaseFunctions.init();
      try {
        final QueryResult? result = await databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo,
          variables: {'id': currentUser.id},
        );
        final User userInfo = User.fromJson(
          result?.data!['users'][0] as Map<String, dynamic>,
          fromOrg: true,
        );
        userInfo.authToken = userConfig.currentUser.authToken;
        userInfo.refreshToken = userConfig.currentUser.refreshToken;
        userConfig.updateUser(userInfo);
        _currentOrg ??= _currentUser!.joinedOrganizations![0];
        _currentOrgInfoController.add(_currentOrg!);

        saveUserInHive();
        return true;
      } on Exception catch (e) {
        print(e);
        navigationService.showTalawaErrorSnackBar(
          "Couldn't update User details",
          MessageType.error,
        );
      }
    });

    return true;
  }

  /// This function is used to update the user joined organization.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user joined.
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateJoinedOrg(orgDetails);
    saveUserInHive();
  }

  /// This function is used to update the user created organization.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user created.
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> updateUserCreatedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateCreatedOrg(orgDetails);
    saveUserInHive();
  }

  /// This function is used to update the user request to join the organization.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization that user requested to join.
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> updateUserMemberRequestOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateMemberRequestOrg(orgDetails);
    saveUserInHive();
  }

  /// This function is used to update the organization admin.
  ///
  /// **params**:
  /// * `orgDetails`: details of the organization.
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> updateUserAdminOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateAdminFor(orgDetails);
    saveUserInHive();
  }

  /// This function is used to updated the access token of the user.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `accessToken`: the access token
  /// * `refreshToken`: the refresh token
  ///
  /// **returns**:
  /// * `Future<void>`: void
  Future<void> updateAccessToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    _currentUser!.refreshToken = refreshToken;
    _currentUser!.authToken = accessToken;
    saveUserInHive();
  }

  /// This function is used to update the user details.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `updatedUserDetails`: `User` type variable containing all the details of an user need to be updated.
  ///
  /// **returns**:
  /// * `Future<bool>`: wether user details are updated or not.
  Future<bool> updateUser(User updatedUserDetails) async {
    try {
      _currentUser = updatedUserDetails;
      saveUserInHive();
      graphqlConfig.getToken();
      databaseFunctions.init();
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  /// function to save a user in the hive.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void saveUserInHive() {
    final box = Hive.box<User>('currentUser');
    if (box.get('user') == null) {
      box.put('user', _currentUser!);
    } else {
      box.put('user', _currentUser!);
    }
  }

  ///function to save current organization details in hive.
  ///
  /// **params**:
  /// * `saveOrgAsCurrent`: the current org details to be saved
  ///
  /// **returns**:
  ///   None
  void saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) {
    _currentOrg = saveOrgAsCurrent;
    _currentOrgInfoController.add(_currentOrg!);
    final box = Hive.box<OrgInfo>('currentOrg');
    if (box.get('org') == null) {
      box.put('org', _currentOrg!);
    } else {
      box.put('org', _currentOrg!);
    }
  }
}
