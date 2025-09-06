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
    if (selectedOrganization.id == null || selectedOrganization.id == '-1') {
      navigationService.showTalawaErrorSnackBar(
        'Please select an organization',
        MessageType.error,
      );
      return;
    }

    final result = await databaseFunctions.gqlAuthMutation(
      queries.sendMembershipRequest(),
      variables: {"organizationId": selectedOrganization.id},
    );
    if (result.data != null) {
      final data =
          result.data!['sendMembershipRequest'] as Map<String, dynamic>;
      final organizationId = data['organizationId'] as String?;

      if (organizationId != selectedOrganization.id) {
        navigationService.showTalawaErrorSnackBar(
          'Some error occurred. Please try again later.',
          MessageType.error,
        );
        return;
      }

      userConfig.updateUserMemberRequestOrg([selectedOrganization.id!]);
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
