// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// WaitingViewModel class helps to interact with model to serve data
/// and react to user's input for Waiting section.
///
/// Methods include:
/// * `logout`
class WaitingViewModel extends BaseModel {
  late List<Map<String, dynamic>> greeting;
  late List<String> pendingRequestOrg;
  late User currentUser;

  // initialiser
  void initialise(BuildContext context) {
    currentUser = userConfig.currentUser;
    pendingRequestOrg = currentUser.membershipRequests ?? [];
    // greetings
    greeting = [
      {
        'text': "Please wait",
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
      {
        'text': " ${currentUser.firstName} ",
        'textStyle':
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
      },
      {
        'text': "for organisation(s) to accept your invitation.",
        'textStyle': Theme.of(context).textTheme.headlineSmall,
      },
    ];
  }

  /// This function ends the session for the user or logout the user from the application.
  void settingPageNavigation() {
    navigationService.pushScreen(
      Routes.appSettings,
    );
  }

  Future<OrgInfo?> getOrgInfo(String orgId) async {
    try {
      final QueryResult joinedOrgData =
          await databaseFunctions.gqlAuthQuery(queries.fetchOrgById(orgId));

      final OrgInfo orgInfo = OrgInfo.fromJson(
        joinedOrgData.data!['organization'] as Map<String, dynamic>,
      );
      return orgInfo;
    } on Exception catch (e) {
      print(e);
      navigationService.showTalawaErrorSnackBar(
        'Some error occurred. Please try again later.',
        MessageType.error,
      );
    }
    return null;
  }

  void joinOrg() {
    navigationService.pushScreen(Routes.joinOrg, arguments: '-1');
  }
}
