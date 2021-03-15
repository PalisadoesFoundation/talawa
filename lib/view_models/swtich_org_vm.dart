import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/model/switch_org.dart';
import 'package:talawa/services/API.dart';
import 'package:talawa/view_models/base_model.dart';

import '../locator.dart';

class SwitchOrgModel extends BaseModel {
  API _api = locator<API>();

  List<SwitchOrg> joinedOrgs;

  Future getJoinedOrgs() async {
    setState(ViewState.Busy);
    joinedOrgs = await _api.fetchUserDetails();
    setState(ViewState.Idle);
  }
}
