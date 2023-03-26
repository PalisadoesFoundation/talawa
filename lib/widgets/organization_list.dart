import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// This class returns the OrganizationList widget.
///
/// which shows the list of all organizations exists in the URL.
/// This widget is used after the authentication.
class OrganizationList extends StatelessWidget {
  const OrganizationList({required this.model, Key? key}) : super(key: key);

  /// [model] is a type of [SelectOrganizationViewModel] which provides methods to handle the data for this component.
  final SelectOrganizationViewModel model;
  @override
  Widget build(BuildContext context) {
    final navigationServiceLocal = locator<NavigationService>();
    model.organizations = [];
    int noOfRefetch = 0;
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(graphqlConfig.clientToQuery()),
      child: Query(
        options: QueryOptions(
          document: gql(queries.fetchJoinInOrg),
          variables: {
            // fetch 15 items only, will fetch more when scrolling index is at the 3rd last item!
            'first': 15,
            'skip': 0,
          },
        ),
        builder: (
          QueryResult result, {
          Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
          Future<QueryResult?> Function()? refetch,
        }) {
          // checking for any errors, if true fetch again!
          if (result.hasException) {
            final isException = databaseFunctions.encounteredExceptionOrError(
              result.exception!,
              showSnackBar: noOfRefetch == 0,
            );
            if (isException != null) {
              if (isException) {
                refetch!();
                noOfRefetch++;
              } else {
                refetch!();
                noOfRefetch++;
              }
            }
          } else {
            // If the result is still loading!
            if (!result.isLoading) {
              model.organizations = OrgInfo().fromJsonToList(
                result.data!['organizationsConnection'] as List,
              );
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (model.organizations.isEmpty) {
                navigationServiceLocal.showTalawaErrorDialog(
                  "No organizations found Please contact your admin",
                  MessageType.error,
                );
              }
            });
            // return the Scroll bar wid  get for scrolling down the organizations.
            return Scrollbar(
              thumbVisibility: true,
              interactive: true,
              controller: model.allOrgController,
              // Listview is a scrollable list of widgets arranged linearly.
              child: ListView.separated(
                controller: model.allOrgController,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: result.isLoading
                    ? model.organizations.length + 1
                    : model.organizations.length,
                itemBuilder: (BuildContext context, int index) {
                  // If the index is at the end of the list!
                  if (index == model.organizations.length) {
                    // return the ListTile showing the loading icon!
                    return ListTile(
                      title: Center(
                        child: CupertinoActivityIndicator(
                          radius: SizeConfig.screenWidth! * 0.065,
                        ),
                      ),
                    );
                  }
                  // If the index is at the 3rd last item in the organization list.
                  if (index == model.organizations.length - 3) {
                    // return VisibilityDetector and fetch more items in the list to show up!
                    return VisibilityDetector(
                      key: const Key('OrgSelItem'),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction > 0) {
                          model.fetchMoreHelper(
                            fetchMore!,
                            model.organizations,
                          );
                        }
                      },
                      child: CustomListTile(
                        index: index,
                        type: TileType.org,
                        orgInfo: model.organizations[index],
                        onTapOrgInfo: (item) => model.selectOrg(item),
                        key: Key('OrgSelItem$index'),
                      ),
                    );
                  }
                  // return CustomeTile that shows a particular item in the list!
                  return CustomListTile(
                    index: index,
                    type: TileType.org,
                    orgInfo: model.organizations[index],
                    onTapOrgInfo: (item) => model.selectOrg(item),
                    key: Key('OrgSelItem$index'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth! * 0.2,
                      right: 12,
                    ),
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
}
