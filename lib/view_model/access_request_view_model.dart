import 'package:flutter/cupertino.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// AccessScreenViewModel widget.
class AccessScreenViewModel extends BaseModel {
  /// selectedOrganization list.
  late OrgInfo selectedOrganization = OrgInfo(id: '-1');

  /// organizations list.
  late List<OrgInfo> organizations = [];

  /// org identifier.
  late String orgId;

  /// text controller for optional message during the request.
  final optionalMessageController = TextEditingController();

  /// Initialization function.
  ///
  /// **params**:
  /// * `org`: Org to send request to.
  ///
  /// **returns**:
  ///   None
  Future<void> initialise(OrgInfo org) async {
    selectedOrganization = org;
  }

  /// Sending member ship request function.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> sendMembershipRequest() async {
    //TODO: Implement Message arg for below function
    final result = await databaseFunctions.gqlAuthMutation(
      queries.sendMembershipRequest(selectedOrganization.id!),
    );
    if (result.data != null) {
      final OrgInfo membershipRequest = OrgInfo.fromJson(
        ((result.data!)['sendMembershipRequest']
            as Map<String, dynamic>)['organization'] as Map<String, dynamic>,
      );
      userConfig.updateUserMemberRequestOrg([membershipRequest]);
      if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
        );
      } else {
        navigationService.pop();
        navigationService.showTalawaErrorSnackBar(
          'Join in request sent to ${selectedOrganization.name} successfully',
          MessageType.info,
        );
      }
    }
  }
}
