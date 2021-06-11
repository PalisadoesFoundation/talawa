import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';

import 'navigation_service.dart';

class UserConfig with ChangeNotifier {
  late User? _currentUser = User(id: 'null', authToken: 'null');
  late OrgInfo? _currentOrg = OrgInfo(name: 'Organization Name', id: 'null');

  OrgInfo get currentOrg => _currentOrg!;
  set currentOrg(OrgInfo org) => _currentOrg = org;
  User get currentUser => _currentUser!;

  Future<bool> userLoggedIn() async {
    final boxUser = Hive.box<User>('currentUser');
    final boxOrg = Hive.box<OrgInfo>('currentOrg');
    _currentOrg = boxOrg.get('org');
    _currentUser = boxUser.get('user');
    if (_currentUser == null) {
      _currentUser = User(id: 'null', authToken: 'null');
      return false;
    }
    locator<GraphqlConfig>().getToken().then((value) async {
      locator<DataBaseMutationFunctions>().init();
      final bool fetchUpdates = await locator<DataBaseMutationFunctions>()
          .fetchCurrentUserInfo(_currentUser!.id!);
      if (fetchUpdates) {
        _currentOrg ??= _currentUser!.joinedOrganizations![0];
        saveUserInHive();
        return true;
      } else {
        locator<NavigationService>()
            .showSnackBar("Couldn't update User details");
      }
    });
    return true;
  }

  Future updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
    _currentUser!.updateJoinedOrg(orgDetails);
    saveUserInHive();
    notifyListeners();
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

  Future updateAccessToken(
      {required String accessToken, required String refreshToken}) async {
    _currentUser!.refreshToken = refreshToken;
    _currentUser!.authToken = accessToken;
    saveUserInHive();
  }

  Future<bool> updateUser(User updatedUserDetails) async {
    try {
      _currentUser = updatedUserDetails;
      saveUserInHive();
      locator<DataBaseMutationFunctions>().init();
      return true;
    } on Exception catch (e) {
      print(e.toString());
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
    final box = Hive.box<OrgInfo>('currentOrg');
    if (box.get('org') == null) {
      box.put('org', _currentOrg!);
    } else {
      box.put('org', _currentOrg!);
    }
    notifyListeners();
  }
}
