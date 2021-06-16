import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SelectOrganizationViewModel extends BaseModel {
  final ScrollController allOrgController = ScrollController();
  final ScrollController controller = ScrollController();
  final FocusNode searchFocus = FocusNode();
  final TextEditingController searchController = TextEditingController();
  late OrgInfo selectedOrganization = OrgInfo(id: '-1');
  late List<OrgInfo> organizations = [];
  bool searching = false;
  late Widget showSearchOrgList = Container();

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
      final fetch = await databaseFunctions.fetchOrgById(initialData);
      if (fetch.runtimeType == OrgInfo) {
        selectedOrganization = fetch as OrgInfo;
        setState(ViewState.idle);
        navigationService.pushScreen('/signupDetails',
            arguments: selectedOrganization);
      }
    }
  }

  selectOrg(OrgInfo item) {
    bool orgAlreadyJoined = false;
    bool orgRequestAlreadyPresent = false;
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
      setState(ViewState.idle);
    } else if (orgAlreadyJoined) {
      navigationService.showSnackBar('Organisation already joined');
    } else {
      navigationService.showSnackBar('Membership request already sent');
    }
  }

  onTapContinue() {
    if (selectedOrganization.id != '-1') {
      navigationService.pushScreen('/signupDetails',
          arguments: selectedOrganization);
    } else {
      navigationService.showSnackBar('Select one organization to continue',
          duration: const Duration(milliseconds: 750));
    }
  }

  onTapJoin() async {
    if (selectedOrganization.isPublic == true) {
      final bool successJoin =
          await databaseFunctions.joinPublicOrg(selectedOrganization.id!);
      if (successJoin) {
        if (userConfig.currentUser.joinedOrganizations!.length == 1) {
          userConfig.saveCurrentOrgInHive(
              userConfig.currentUser.joinedOrganizations![0]);
          navigationService.removeAllAndPush(
              Routes.mainScreen, Routes.splashScreen);
        } else {
          navigationService.pop();
          navigationService
              .showSnackBar('Joined ${selectedOrganization.name} successfully');
        }
      } else {
        navigationService.showSnackBar('SomeThing went wrong');
      }
    } else {
      final bool successRequest = await databaseFunctions
          .sendMembershipRequest(selectedOrganization.id!);
      if (successRequest) {
        if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
          navigationService.removeAllAndPush(
              Routes.waitingScreen, Routes.splashScreen);
        } else {
          navigationService.showSnackBar(
              'Join in request sent to ${selectedOrganization.name} successfully');
        }
      } else {
        navigationService.showSnackBar('SomeThing went wrong');
      }
    }
  }

  Widget showOrganizationList() {
    organizations = [];
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(graphqlConfig.clientToQuery()),
      child: Query(
        options:
            QueryOptions(document: gql(Queries().fetchJoinInOrg), variables: {
          'first': 15,
          'skip': 0,
        }),
        builder: (QueryResult result,
            {Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
            Future<QueryResult?> Function()? refetch}) {
          if (result.hasException) {
            final bool? isException =
                databaseFunctions.encounteredExceptionOrError(result.exception!,
                    showSnackBar: false);
            if (isException!) {
              refetch!();
            } else {
              refetch!();
            }
          } else {
            if (!result.isLoading) {
              organizations = OrgInfo().fromJsonToList(
                  result.data!['organizationsConnection'] as List);
            }
            return Scrollbar(
              isAlwaysShown: true,
              interactive: true,
              controller: allOrgController,
              child: ListView.separated(
                controller: allOrgController,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: result.isLoading
                    ? organizations.length + 1
                    : organizations.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == organizations.length) {
                    return ListTile(
                        title: Center(
                            child: CupertinoActivityIndicator(
                      radius: SizeConfig.screenWidth! * 0.065,
                    )));
                  }
                  if (index == organizations.length - 3) {
                    return VisibilityDetector(
                        key: const Key('OrgSelItem'),
                        onVisibilityChanged: (VisibilityInfo info) {
                          if (info.visibleFraction > 0) {
                            fetchMoreHelper(fetchMore!, organizations);
                          }
                        },
                        child: CustomListTile(
                          index: index,
                          type: TileType.org,
                          orgInfo: organizations[index],
                          onTapOrgInfo: (item) => selectOrg(item),
                          key: Key('OrgSelItem$index'),
                        ));
                  }
                  return CustomListTile(
                    index: index,
                    type: TileType.org,
                    orgInfo: organizations[index],
                    onTapOrgInfo: (item) => selectOrg(item),
                    key: Key('OrgSelItem$index'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth! * 0.2, right: 12),
                    child: const Divider(
                      color: Color(0xFFE5E5E5),
                      thickness: 0.5,
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget showSearchList(String searchOrgWithName) {
    print(searchOrgWithName);
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(graphqlConfig.authClient()),
      child: Query(
        options: QueryOptions(
            document: gql(Queries().fetchJoinInOrgByName),
            variables: {
              'nameStartsWith': searchOrgWithName,
              'first': 30,
              'skip': 0,
            }),
        builder: (QueryResult result,
            {Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
            Future<QueryResult?> Function()? refetch}) {
          if (result.hasException) {
            final bool? isException =
                databaseFunctions.encounteredExceptionOrError(result.exception!,
                    showSnackBar: false);
            if (isException!) {
              refetch!();
            } else {
              refetch!();
            }
          } else {
            if (!result.isLoading) {
              organizations = OrgInfo().fromJsonToList(
                  result.data!['organizationsConnection'] as List);
            }
            return Scrollbar(
              isAlwaysShown: true,
              interactive: true,
              controller: controller,
              child: ListView.separated(
                controller: controller,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: result.isLoading
                    ? organizations.length + 1
                    : organizations.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == organizations.length) {
                    return ListTile(
                        title: Center(
                            child: CupertinoActivityIndicator(
                      radius: SizeConfig.screenWidth! * 0.065,
                    )));
                  }
                  if (index == organizations.length - 3) {
                    return VisibilityDetector(
                        key: const Key('OrgSelItem'),
                        onVisibilityChanged: (VisibilityInfo info) {
                          if (info.visibleFraction > 0) {
                            print(organizations.length);
                            fetchMoreHelper(fetchMore!, organizations);
                            print(organizations.length);
                          }
                        },
                        child: CustomListTile(
                          index: index,
                          type: TileType.org,
                          orgInfo: organizations[index],
                          onTapOrgInfo: (item) => selectOrg(item),
                          key: Key('OrgSelItem$index'),
                        ));
                  }
                  return CustomListTile(
                    index: index,
                    type: TileType.org,
                    orgInfo: organizations[index],
                    onTapOrgInfo: (item) => selectOrg(item),
                    key: Key('OrgSelItem$index'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth! * 0.2, right: 12),
                    child: const Divider(
                      color: Color(0xFFE5E5E5),
                      thickness: 0.5,
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
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
