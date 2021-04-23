import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/model/switch_org.dart';
import 'package:talawa/services/api_.dart';
import 'package:talawa/view_models/base_model.dart';

import '../locator.dart';

//class to switch the model base model
class SwitchOrgModel extends BaseModel {
  final API _api = locator<API>();

  List<SwitchOrg> joinedOrgs;

  Future getJoinedOrgs() async {
    setState(ViewState.busy);
    joinedOrgs = await _api.fetchUserDetails();
    setState(ViewState.idle);
  }
}
