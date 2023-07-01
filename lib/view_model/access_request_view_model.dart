import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

class AccessScreenViewModel extends BaseModel {
  late OrgInfo selectedOrganization = OrgInfo(id: '-1');
  late List<OrgInfo> organizations = [];
  late String orgId;
  final optionalMessageController = TextEditingController();

  Future<void> initialise(OrgInfo org) async {
    selectedOrganization = org;
  }

  Future<void> sendMembershipRequest() async {
    //TODO: Implement Message arg for below function
    final result = await databaseFunctions.gqlAuthMutation(
      queries.sendMembershipRequest(selectedOrganization.id!),
    );
    if (result != null) {
      final OrgInfo membershipRequest = OrgInfo.fromJson(
        (((result as QueryResult).data!)['sendMembershipRequest']
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
