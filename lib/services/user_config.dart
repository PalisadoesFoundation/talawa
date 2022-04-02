import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

class UserConfig {
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

  Future<bool> userLoggedIn() async {
    initialiseStream();
    final boxUser = Hive.box<User>('currentUser');
    final boxOrg = Hive.box<OrgInfo>('currentOrg');
    _currentOrg =
        boxOrg.get('org') ?? OrgInfo(name: 'Organization Name', id: 'null');
    _currentOrgInfoController.add(_currentOrg!);

    _currentUser = boxUser.get('user');
    if (_currentUser == null) {
      _currentUser = User(id: 'null', authToken: 'null');
      return false;
    }
    graphqlConfig.getToken().then((value) async {
      databaseFunctions.init();
      try {
        final QueryResult result = await databaseFunctions.gqlNonAuthMutation(
          queries.fetchUserInfo,
          variables: {'id': currentUser.id!},
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
        navigationService.showSnackBar("Couldn't update User details");
      }
    });
    return true;
  }

  Future updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateJoinedOrg(orgDetails);
    saveUserInHive();
  }

  Future updateUserCreatedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateCreatedOrg(orgDetails);
    saveUserInHive();
  }

  Future updateUserMemberRequestOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateMemberRequestOrg(orgDetails);
    saveUserInHive();
  }

  Future updateUserAdminOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateAdminFor(orgDetails);
    saveUserInHive();
  }

  Future updateAccessToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    _currentUser!.refreshToken = refreshToken;
    _currentUser!.authToken = accessToken;
    saveUserInHive();
  }

  Future<bool> updateUser(User updatedUserDetails) async {
    try {
      _currentUser = updatedUserDetails;
      saveUserInHive();
      databaseFunctions.init();
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  saveUserInHive() {
    final box = Hive.box<User>('currentUser');
    if (box.get('user') == null) {
      box.put('user', _currentUser!);
    } else {
      box.put('user', _currentUser!);
    }
  }

  saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) {
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
