// ignore_for_file: talawa_good_doc_comments, talawa_api_doc
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// SelectOrganizationViewModel class helps to interact with model to serve data and react to user's input in Select Organization View.
///
/// Methods include:
/// * `selectOrg`
/// * `onTapJoin`
class SelectOrganizationViewModel extends BaseModel {
  /// Organization selection required data.
  final ScrollController allOrgController = ScrollController();

  /// Organization selection required data.
  final ScrollController controller = ScrollController();

  /// Organization selection required data.
  final FocusNode searchFocus = FocusNode();

  /// Organization selection required data.
  final TextEditingController searchController = TextEditingController();

  /// Organization selection required data.
  late OrgInfo? selectedOrganization = OrgInfo(id: '-1');

  /// Organization selection required data.
  late List<OrgInfo> organizations = [];

  /// Organization selection required data.
  bool searching = false;

  /// Organization selection required data.
  late Widget showSearchOrgList = Container();

  /// Organization selection required data.
  late String orgId;

  /// if search is enabled.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void searchActive() {
    if (searchFocus.hasFocus) {
      organizations = [];
      searching = true;
      setState(ViewState.idle);
    }
  }

  /// This function select the organization.
  ///
  /// **params**:
  /// * `item`: Selected organization data.
  ///
  /// **returns**:
  /// * `Future<void>`: None
  Future<void> selectOrg(OrgInfo? item) async {
    bool orgRequestAlreadyPresent = false;
    // if user session not expirec
    if (userConfig.loggedIn) {
      // check if user has already joined the selected organization.
      userConfig.currentUser.joinedOrganizations?.forEach((element) {
        if (item != null && element.id == item.id) {
          navigationService.showTalawaErrorSnackBar(
            'Organisation already joined',
            MessageType.warning,
          );
          return;
        }
      });

      // check if user has already send the membership request to the selected organization.
      userConfig.currentUser.membershipRequests ??= [];
      userConfig.currentUser.membershipRequests?.forEach((orgId) {
        if (item != null && orgId == item.id) {
          orgRequestAlreadyPresent = true;
        }
      });

      // if not already joined and not memebrship request.
      if (!orgRequestAlreadyPresent) {
        selectedOrganization = item;
        notifyListeners();
        onTapJoin();

        if (selectedOrganization?.userRegistrationRequired == true) {
          navigationService.pushScreen(
            Routes.requestAccess,
            arguments: selectedOrganization,
          );
        }
      } else {
        navigationService.showTalawaErrorSnackBar(
          'Membership request already sent',
          MessageType.warning,
        );
      }
    } else {
      selectedOrganization = item;
      notifyListeners();
      navigationService.pushScreen(
        Routes.signupDetailScreen,
        arguments: selectedOrganization,
      );
    }
  }

  /// Helper for listener to check if user can tap on continue option or not.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void onTapContinue() {
    // if user selected any organization.
    if (selectedOrganization?.id != '-1') {
      navigationService.pushScreen(
        Routes.signupDetailScreen,
        arguments: selectedOrganization,
      );
    } else {
      navigationService.showTalawaErrorSnackBar(
        'Select one organization to continue',
        MessageType.warning,
      );
    }
  }

  /// This function make user to join the selected organization.
  ///
  ///
  /// The function uses `joinOrgById` graph QL query
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: None
  Future<void> onTapJoin() async {
    if (selectedOrganization == null) {
      navigationService.showTalawaErrorSnackBar(
        'Please select an organization to join',
        MessageType.warning,
      );
      return;
    } else if (selectedOrganization?.userRegistrationRequired == null) {
      navigationService.showTalawaErrorSnackBar(
        'Organization registration requirement is not set',
        MessageType.warning,
      );
      return;
    }
    // if `selectedOrganization` registrations is not required.
    else if (selectedOrganization?.userRegistrationRequired == false) {
      try {
        // run the graph QL mutation
        final QueryResult result = await databaseFunctions.gqlAuthMutation(
          queries.joinOrgById(),
          variables: {
            'organizationId': selectedOrganization!.id,
          },
        );

        final Map<String, dynamic>? resultData = result.data;
        if (resultData == null) {
          throw Exception('No data received');
        }

        final Map<String, dynamic>? joinData =
            resultData['joinPublicOrganization'] as Map<String, dynamic>?;
        if (joinData == null) {
          throw Exception('Join operation failed');
        }

        final String? memberId = joinData["memberId"] as String?;
        if (memberId != userConfig.currentUser.id) {
          throw Exception('Member ID mismatch');
        }

        final QueryResult joinedOrgData = await databaseFunctions
            .gqlAuthQuery(queries.fetchOrgById(selectedOrganization?.id ?? ''));

        final OrgInfo joinedOrg = OrgInfo.fromJson(
          joinedOrgData.data!['organization'] as Map<String, dynamic>,
        );
        await userConfig.updateUserJoinedOrg(joinedOrg);

        navigationService.pop();
        navigationService.showSnackBar(
          'Joined ${selectedOrganization?.name} successfully',
          duration: const Duration(seconds: 2),
        );
        navigationService.pushReplacementScreen(
          Routes.mainScreen,
          arguments: MainScreenArgs(
            mainScreenIndex: 0,
            fromSignUp: false,
          ),
        );
      } on Exception catch (e) {
        navigationService.showTalawaErrorSnackBar(
          'Something went wrong $e',
          MessageType.error,
        );
      }
    } else {
      try {
        navigationService.pushScreen(Routes.requestAccess);
      } on Exception catch (e) {
        navigationService.showTalawaErrorSnackBar(
          'Something went wrong $e',
          MessageType.error,
        );
      }
    }
  }

  /// This function fetch more option.
  ///
  ///
  /// **params**:
  /// * `fetchMore`: client function
  /// * `organizations`: org list
  ///
  /// **returns**:
  ///   None
  void fetchMoreHelper(FetchMore fetchMore, List organizations) {
    fetchMore(
      FetchMoreOptions(
        variables: {
          "first": organizations.length + 15,
          "skip": organizations.length,
        },
        updateQuery: (existingOrganizations, newOrganizations) {
          return {
            'organizationsConnection':
                (existingOrganizations!["organizationsConnection"]
                        as List<Object?>) +
                    (newOrganizations!['organizationsConnection']
                        as List<dynamic>),
          };
        },
      ),
    );
  }
}
