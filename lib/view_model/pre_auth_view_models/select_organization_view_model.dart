// ignore_for_file: talawa_good_doc_comments, talawa_api_doc
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

/// SelectOrganizationViewModel class helps to interact with model to serve data and react to user's input in Select Organization View.
///
/// Methods include:
/// * `selectOrg`
/// * `onTapJoin`
class SelectOrganizationViewModel extends BaseModel {
  // variables
  /// Organization selection required data.
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  /// Organization selection required data.
  late Barcode result;

  /// Organization selection required data.
  final ScrollController allOrgController = ScrollController();

  /// Organization selection required data.
  final ScrollController controller = ScrollController();

  /// Organization selection required data.
  final FocusNode searchFocus = FocusNode();

  /// Organization selection required data.
  final TextEditingController searchController = TextEditingController();

  /// Organization selection required data.
  late OrgInfo selectedOrganization = OrgInfo(id: '-1');

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

  /// initializer.
  ///
  /// **params**:
  /// * `initialData`: data
  ///
  /// **returns**:
  /// * `Future<void>`: None
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
  /// **params**:
  /// * `item`: Selected organization data.
  ///
  /// **returns**:
  /// * `Future<void>`: None
  Future<void> selectOrg(OrgInfo item) async {
    bool orgAlreadyJoined = false;
    bool orgRequestAlreadyPresent = false;
    // if user session not expirec
    if (userConfig.loggedIn) {
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
        onTapJoin();

        if (selectedOrganization.userRegistrationRequired!) {
          navigationService.pushScreen(
            Routes.requestAccess,
            arguments: selectedOrganization,
          );
        }
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
    if (selectedOrganization.id != '-1') {
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
    // if `selectedOrganization` registrations is not required.
    if (selectedOrganization.userRegistrationRequired == false) {
      try {
        // run the graph QL mutation
        final QueryResult result = await databaseFunctions.gqlAuthMutation(
          queries.joinOrgById(selectedOrganization.id!),
        );

        final List<OrgInfo>? joinedOrg =
            ((result.data!['joinPublicOrganization']
                        as Map<String, dynamic>)['joinedOrganizations']
                    as List<dynamic>?)
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
          'Something went wrong',
          MessageType.error,
        );
      }
    }
    // else {
    //   try {
    //     // navigationService.pushScreen(Routes.requestAccess);
    //   } on Exception catch (e) {
    //     print(e);
    //     navigationService.showTalawaErrorSnackBar(
    //       'SomeThing went wrong',
    //       MessageType.error,
    //     );
    //   }
    // }
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
