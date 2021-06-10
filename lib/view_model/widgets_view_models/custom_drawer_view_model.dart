import 'package:flutter/cupertino.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

class CustomDrawerViewModel extends BaseModel {
  final ScrollController controller = ScrollController();
  final _userConfig = locator<UserConfig>();
  final _navigationService = locator<NavigationService>();
  late User _currentUser;
  late List<OrgInfo> _switchAbleOrg;
  late OrgInfo _selectedOrg;

  OrgInfo get selectedOrg => _selectedOrg;
  List<OrgInfo> get switchAbleOrg => _switchAbleOrg;

  initialize() {
    _currentUser = _userConfig.currentUser;
    _selectedOrg = _userConfig.currentOrg;
    _switchAbleOrg = _currentUser.joinedOrganizations!;
  }

  switchOrg(OrgInfo switchToOrg) {
    if (selectedOrg == switchToOrg) {
      // _navigationService.pop();
      _navigationService.showSnackBar('${switchToOrg.name} already selected');
    } else {
      _userConfig.saveCurrentOrgInHive(switchToOrg);
      // _navigationService.pop();
      _navigationService.showSnackBar('Switched to ${switchToOrg.name}');
    }
  }
}
