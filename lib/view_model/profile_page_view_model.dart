import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

class ProfilePageViewModel extends BaseModel {
  late final Box<User> user;
  late final Box<dynamic> url;
  late final Box<OrgInfo> orgization;
  late OrgInfo currentOrg;
  final _userConfig = locator<UserConfig>();

  initialize() {
    setState(ViewState.busy);
    currentOrg = _userConfig.currentOrg;
    print('page refreshed');
    user = Hive.box<User>('currentUser');
    url = Hive.box('url');
    orgization = Hive.box<OrgInfo>('currentOrg');
    setState(ViewState.idle);
  }

  Future<void> logout(BuildContext context) async {
    print('Logging out');
    user.clear();
    url.clear();
    orgization.clear();
    locator<NavigationService>()
        .removeAllAndPush('/selectLang', '/', arguments: '0');
  }
}
