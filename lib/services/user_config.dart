import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';

class UserConfig with ChangeNotifier {
  late User? currentUser = User(id: 'null', authToken: 'null');

  Future<bool> userLoggedIn() async {
    final box = Hive.box<User>('currentUser');
    currentUser = box.get('user');
    if (currentUser == null) {
      currentUser = User(id: 'null', authToken: 'null');
      return false;
    }
    locator<DataBaseMutationFunctions>().init();
    final bool fetchUpdates = await locator<DataBaseMutationFunctions>()
        .fetchCurrentUserInfo(currentUser!.id!);
    if (fetchUpdates) {
      saveUserInHive();
      return true;
    } else {
      print('error');
    }
    return true;
  }

  Future updateUserJoinedOrg(List<OrgInfo> orgDetails) async {
    currentUser!.updateJoinedOrg(orgDetails);
    saveUserInHive();
  }

  Future updateUserCreatedOrg(List<OrgInfo> orgDetails) async {
    currentUser!.updateCreatedOrg(orgDetails);
    saveUserInHive();
  }

  Future updateUserMemberRequestOrg(List<OrgInfo> orgDetails) async {
    currentUser!.updateMemberRequestOrg(orgDetails);
    saveUserInHive();
  }

  Future updateUserAdminOrg(List<OrgInfo> orgDetails) async {
    currentUser!.updateAdminFor(orgDetails);
    saveUserInHive();
  }

  Future updateAccessToken(
      {required String accessToken, required String refreshToken}) async {
    currentUser!.refreshToken = refreshToken;
    currentUser!.authToken = accessToken;
    saveUserInHive();
  }

  Future<bool> updateUser(User updatedUserDetails) async {
    try {
      currentUser = updatedUserDetails;
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
      box.put('user', currentUser!);
    } else {
      box.put('user', currentUser!);
    }
  }
}
