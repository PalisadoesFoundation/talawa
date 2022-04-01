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

class SelectOrganizationViewModel extends BaseModel {
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

  searchActive() {
    if (searchFocus.hasFocus) {
      organizations = [];
      searching = true;
      setState(ViewState.idle);
    }
  }

  initialise(String initialData) async {
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

  selectOrg(OrgInfo item) async {
    print(item.id);
    bool orgAlreadyJoined = false;
    bool orgRequestAlreadyPresent = false;
    final bool userLoggedIn = await userConfig.userLoggedIn();
    if (userLoggedIn) {
      userConfig.currentUser.joinedOrganizations!.forEach((element) {
        if (element.id! == item.id) {
          orgAlreadyJoined = true;
        }
      });
      userConfig.currentUser.membershipRequests!.forEach((element) {
        if (element.id! == item.id) {
          orgRequestAlreadyPresent = true;
        }
      });
      if (!orgAlreadyJoined && !orgRequestAlreadyPresent) {
        selectedOrganization = item;
        notifyListeners();
      } else if (orgAlreadyJoined) {
        selectedOrganization = OrgInfo(id: '-1');
        navigationService.showSnackBar('Organisation already joined');
      } else {
        navigationService.showSnackBar('Membership request already sent');
      }
    } else {
      selectedOrganization = item;
      notifyListeners();
    }
  }

  onTapContinue() {
    if (selectedOrganization.id != '-1') {
      navigationService.pushScreen(
        Routes.signupDetailScreen,
        arguments: selectedOrganization,
      );
    } else {
      navigationService.showSnackBar(
        'Select one organization to continue',
        duration: const Duration(milliseconds: 750),
      );
    }
  }

  onTapJoin() async {
    if (selectedOrganization.isPublic == true) {
      try {
        final QueryResult result = await databaseFunctions.gqlAuthMutation(
          queries.joinOrgById(selectedOrganization.id!),
        ) as QueryResult;

        final List<OrgInfo>? joinedOrg = (result.data!['joinPublicOrganization']
                ['joinedOrganizations'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList();
        userConfig.updateUserJoinedOrg(joinedOrg!);
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
          navigationService
              .showSnackBar('Joined ${selectedOrganization.name} successfully');
        }
      } on Exception catch (e) {
        print(e);
        navigationService.showSnackBar('SomeThing went wrong');
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
            navigationService.showSnackBar(
              'Join in request sent to ${selectedOrganization.name} successfully',
            );
          }
        }
      } on Exception catch (e) {
        print(e);
        navigationService.showSnackBar('SomeThing went wrong');
      }
    }
  }

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
