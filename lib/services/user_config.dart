import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:talawa/models/org_info.dart';
import 'package:talawa/models/user_info.dart';

class UserConfig with ChangeNotifier {
  late User currentUser;

  static const tokenKey = "token";
  static const refreshTokenKey = "refreshTokenKey";
  static const userId = "userId";
  static const userFName = "userFirstName";
  static const userLName = "userLastName";
  static const userEmail = "userEmail";
  static const userImage = "userImage";

  get user => currentUser;

  Future<bool> userLoggedIn() async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    final authToken = await storage.read(key: tokenKey);
    final refreshToken = await storage.read(key: refreshTokenKey);
    if (authToken == null || refreshToken == null) {
      return false;
    }
    final id = await storage.read(key: userId);
    final firstName = await storage.read(key: userFName);
    final lastName = await storage.read(key: userLName);
    final email = await storage.read(key: userEmail);
    final image = await storage.read(key: userImage);

    currentUser = User(
        authToken: authToken,
        refreshToken: refreshToken,
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        image: image);

    return true;
  }

  Future? updateUserJoinedOrg(List<OrgInfo> orgDetails) {
    currentUser.updateJoinedOrg(orgDetails);
    notifyListeners();
  }

  Future? updateUserCreatedOrg(List<OrgInfo> orgDetails) {
    currentUser.updateCreatedOrg(orgDetails);
    notifyListeners();
  }

  Future? updateUserMemberRequestOrg(List<OrgInfo> orgDetails) {
    currentUser.updateMemberRequestOrg(orgDetails);
    notifyListeners();
  }

  Future? updateUserAdminOrg(List<OrgInfo> orgDetails) {
    currentUser.updateAdminFor(orgDetails);
    notifyListeners();
  }

  Future? updateUser(User updatedUserDetails) {
    currentUser.update(updatedUserDetails);
    notifyListeners();
  }
}
