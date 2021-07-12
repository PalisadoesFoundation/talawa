import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

class ProfilePageViewModel extends BaseModel {
  // Services
  final _userConfig = locator<UserConfig>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late final Box<User> user;
  late final Box<dynamic> url;
  late final Box<OrgInfo> organisation;
  late OrgInfo currentOrg;
  late User currentUser;

  initialize() {
    setState(ViewState.busy);
    currentOrg = _userConfig.currentOrg;
    currentUser = _userConfig.currentUser;
    setState(ViewState.idle);
  }

  Future<void> logout(BuildContext context) async {
    navigationService.pushDialog(CustomAlertDialog(
      reverse: true,
      dialogSubTitle: 'Are you sure you want to logout?',
      successText: 'Logout',
      success: () {
        navigationService.pop();
        navigationService.pushDialog(const CustomProgressDialog(
          key: Key('LogoutProgress'),
        ));
        Future.delayed(const Duration(seconds: 1)).then((value) {
          user = Hive.box<User>('currentUser');
          url = Hive.box('url');
          organisation = Hive.box<OrgInfo>('currentOrg');
          user.clear();
          url.clear();
          organisation.clear();
          navigationService.removeAllAndPush('/selectLang', '/',
              arguments: '0');
        });
      },
    ));
  }
}
