import 'package:hive/hive.dart';
import 'package:talawa/models/org_info.dart';
import 'package:talawa/models/user_info.dart';

class UserConfig {
  late User? currentUser = User(id: 'null');
  static const tokenKey = "token";
  static const refreshTokenKey = "refreshTokenKey";
  static const userId = "userId";
  static const userFName = "userFirstName";
  static const userLName = "userLastName";
  static const userEmail = "userEmail";
  static const userImage = "userImage";

  Future<bool> userLoggedIn() async {
    final box = Hive.box<User>('currentUser');
    print(box.length);
    box.keys.forEach((element) {
      print(element);
    });
    box.values.forEach((element) {
      element.print();
    });
    currentUser = box.get('user');
    if (currentUser == null) {
      return false;
    }
    return true;
  }

  Future? updateUserJoinedOrg(List<OrgInfo> orgDetails) {
    currentUser!.updateJoinedOrg(orgDetails);
    final box = Hive.box<User>('currentUser');
    if (box.get('user') == null) {
      box.put('user', currentUser!);
    } else {
      box.put('user', currentUser!);
    }
  }

  Future? updateUserCreatedOrg(List<OrgInfo> orgDetails) {
    currentUser!.updateCreatedOrg(orgDetails);
    currentUser!.save();
  }

  Future? updateUserMemberRequestOrg(List<OrgInfo> orgDetails) {
    currentUser!.updateMemberRequestOrg(orgDetails);
    final box = Hive.box<User>('currentUser');
    if (box.get('user') == null) {
      box.put('user', currentUser!);
    } else {
      box.put('user', currentUser!);
    }
  }

  Future? updateUserAdminOrg(List<OrgInfo> orgDetails) {
    currentUser!.updateAdminFor(orgDetails);
    currentUser!.save();
  }

  Future? updateUser(User updatedUserDetails) async {
    currentUser = updatedUserDetails;
    final box = Hive.box<User>('currentUser');
    if (box.get('user') == null) {
      box.put('user', currentUser!);
    } else {
      box.put('user', currentUser!);
    }
  }
}
