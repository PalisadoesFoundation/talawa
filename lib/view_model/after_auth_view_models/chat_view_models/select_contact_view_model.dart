// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// SelectContactViewModel class have different functions to interact with model.
///
/// Functions include:
/// * `getCurrentOrgUsersList` : to get all users of current organization.
class SelectContactViewModel extends BaseModel {
  late OrganizationService _organizationService;
  late List<User> orgMembersList = [];

  // initialisation
  void initialise() {
    _organizationService = locator<OrganizationService>();
  }

  /// This function is used to get all users list of an current organization.
  Future<void> getCurrentOrgUsersList() async {
    if (orgMembersList.isEmpty) {
      orgMembersList = await _organizationService
          .getOrgMembersList(userConfig.currentOrg.id!);
    }

    //return orgMembersList;
  }
}
