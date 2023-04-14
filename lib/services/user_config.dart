// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

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

  Stream<OrgInfo> get currentOrgInfoStream => _currentOrgInfoStream;
  StreamController<OrgInfo> get currentOrgInfoController =>
      _currentOrgInfoController;

  OrgInfo get currentOrg => _currentOrg!;
  String get currentOrgName => _currentOrg!.name!;
  set currentOrg(OrgInfo org) => _currentOrg = org;
  User get currentUser => _currentUser!;
  set currentUser(User user) {
    _currentUser = user;
  }

  void initialiseStream() {
    _currentOrgInfoStream =
        _currentOrgInfoController.stream.asBroadcastStream();
  }

  /// This function is used to log in the user.
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
        final QueryResult result = await databaseFunctions.gqlAuthQuery(
          queries.fetchUserInfo,
          variables: {'id': currentUser.id},
        ) as QueryResult;
        final User userInfo = User.fromJson(
          result.data!['users'][0] as Map<String, dynamic>,
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
  /// params:
  /// * [orgDetails] : details of the organization that user joined.
  Future updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateJoinedOrg(orgDetails);
    saveUserInHive();
  }

  /// This function is used to update the user created organization.
  ///
  /// params:
  /// * [orgDetails] : details of the organization that user created.
  Future updateUserCreatedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateCreatedOrg(orgDetails);
    saveUserInHive();
  }

  /// This function is used to update the user request to join the organization.
  ///
  /// params:
  /// * [orgDetails] : details of the organization that user requested to join.
  Future updateUserMemberRequestOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateMemberRequestOrg(orgDetails);
    saveUserInHive();
  }

  /// This function is used to update the organization admin.
  ///
  /// params:
  /// * [orgDetails] : details of the organization.
  Future updateUserAdminOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateAdminFor(orgDetails);
    saveUserInHive();
  }

  /// This function is used to updated the access token of the user.
  ///
  /// params:
  /// * [accessToken]
  /// * [refreshToken]
  Future updateAccessToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    _currentUser!.refreshToken = refreshToken;
    _currentUser!.authToken = accessToken;
    saveUserInHive();
  }

  /// This function is used to update the user details.
  ///
  /// params:
  /// * [updatedUserDetails] : `User` type variable containing all the details of an user need to be updated.
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

  // save user in hive.
  void saveUserInHive() {
    final box = Hive.box<User>('currentUser');
    if (box.get('user') == null) {
      box.put('user', _currentUser!);
    } else {
      box.put('user', _currentUser!);
    }
  }

  // save current organization details in hive.
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
