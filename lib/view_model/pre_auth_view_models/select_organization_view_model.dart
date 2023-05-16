// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// SelectOrganizationViewModel class helps to interact with model to serve data
/// and react to user's input in Select Organization View.
///
/// Methods include:
/// * `selectOrg`
/// * `onTapJoin`
class SelectOrganizationViewModel extends BaseModel {
  // variables
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  final ScrollController allOrgController = ScrollController();
  final ScrollController controller = ScrollController();
  final FocusNode searchFocus = FocusNode();
  final TextEditingController searchController = TextEditingController();
  late OrgInfo selectedOrganization = OrgInfo(id: '-1');
  late List<OrgInfo> organizations = [];
  bool searching = false;
  late Widget showSearchOrgList = Container();
  late String orgId;

  // if the search box is on tap
  void searchActive() {
    if (searchFocus.hasFocus) {
      organizations = [];
      searching = true;
      setState(ViewState.idle);
    }
  }

  // initialiser
  Future<void> initialise(String initialData) async {
    searchFocus.addListener(searchActive);
    if (!initialData.contains('-1')) {
      databaseFunctions.init();
      final fetch = await databaseFunctions.fetchOrgById(initialData);
      if (fetch.runtimeType == OrgInfo) {
        selectedOrganization = fetch as OrgInfo;
        if (userConfig.currentUser.refreshToken?.isEmpty ?? true) {
          navigationService.pushScreen(
            Routes.signupDetailScreen,
            arguments: selectedOrganization,
          );
        } else {
          selectOrg(selectedOrganization);
        }
        setState(ViewState.idle);
      }
    }
  }

  /// This function select the organization.
  ///
  /// params:
  /// * [item] : Selected organization data.
  Future<void> selectOrg(OrgInfo item) async {
    print(item.id);
    bool orgAlreadyJoined = false;
    bool orgRequestAlreadyPresent = false;
    final bool userLoggedIn = await userConfig.userLoggedIn();
    // if user session not expirec
    if (userLoggedIn) {
      // check if user has already joined the selected organization.
      userConfig.currentUser.joinedOrganizations!.forEach((element) {
        if (element.id! == item.id) {
          orgAlreadyJoined = true;
        }
      });
      // check if user has already send the membership request to the selected organization.
      userConfig.currentUser.membershipRequests!.forEach((element) {
        if (element.id! == item.id) {
          orgRequestAlreadyPresent = true;
        }
      });
      // if not already joined and not memebrship request.
      if (!orgAlreadyJoined && !orgRequestAlreadyPresent) {
        selectedOrganization = item;
        notifyListeners();
      } else if (orgAlreadyJoined) {
        selectedOrganization = OrgInfo(id: '-1');
        navigationService.showTalawaErrorSnackBar(
          'Organisation already joined',
          MessageType.warning,
        );
      } else {
        navigationService.showTalawaErrorSnackBar(
          'Membership request already sent',
          MessageType.warning,
        );
      }
    } else {
      selectedOrganization = item;
      notifyListeners();
    }
  }

  // Helper for listener to check if user can tap on continue option or not.
  void onTapContinue() {
    // if user selected any organization.
    if (selectedOrganization.id != '-1') {
      navigationService.pushScreen(
        Routes.signupDetailScreen,
        arguments: selectedOrganization,
      );
    } else {
      navigationService.showTalawaErrorSnackBar(
        'Select one organization to continue',
        MessageType.warning,
        duration: const Duration(milliseconds: 750),
      );
    }
  }

  /// This function make user to join the selected organization.
  /// The function uses `joinOrgById` graph QL query.
  Future<void> onTapJoin() async {
    // if `selectedOrganization` is public.
    if (selectedOrganization.isPublic == true) {
      try {
        // run the graph QL mutation
        final QueryResult result = await databaseFunctions.gqlAuthMutation(
          queries.joinOrgById(selectedOrganization.id!),
        ) as QueryResult;

        final List<OrgInfo>? joinedOrg = (result.data!['joinPublicOrganization']
                ['joinedOrganizations'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList();
        userConfig.updateUserJoinedOrg(joinedOrg!);
        // if user joined organization length is 1
        if (userConfig.currentUser.joinedOrganizations!.length == 1) {
          userConfig.saveCurrentOrgInHive(
            userConfig.currentUser.joinedOrganizations![0],
          );
          navigationService.removeAllAndPush(
            Routes.mainScreen,
            Routes.splashScreen,
            arguments: MainScreenArgs(mainScreenIndex: 0),
          );
        } else {
          navigationService.pop();
          navigationService.showTalawaErrorSnackBar(
            'Joined ${selectedOrganization.name} successfully',
            MessageType.info,
          );
        }
      } on Exception catch (e) {
        print(e);
        navigationService.showTalawaErrorSnackBar(
          'SomeThing went wrong',
          MessageType.error,
        );
      }
    } else {
      try {
        final result = await databaseFunctions.gqlAuthMutation(
          queries.sendMembershipRequest(selectedOrganization.id!),
        );
        if (result != null) {
          final OrgInfo membershipRequest = OrgInfo.fromJson(
            result.data!['sendMembershipRequest']['organization']
                as Map<String, dynamic>,
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
      } on Exception catch (e) {
        print(e);
        navigationService.showTalawaErrorSnackBar(
          'SomeThing went wrong',
          MessageType.error,
        );
      }
    }
  }

  /// This function fetch more option.
  void fetchMoreHelper(FetchMore fetchMore, List organizations) {
    fetchMore(
      FetchMoreOptions(
        variables: {
          "first": organizations.length + 15,
          "skip": organizations.length,
        },
        updateQuery: (existingOrganizations, newOrganizations) {
          return {
            'organizationsConnection': [
              ...existingOrganizations!["organizationsConnection"],
              ...newOrganizations!['organizationsConnection'],
            ],
          };
        },
      ),
    );
  }
}
