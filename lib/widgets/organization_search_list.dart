// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// OrganizationSearchList class return a widget that shows all
/// the matching organizations searched on the search bar.
class OrganizationSearchList extends StatelessWidget {
  const OrganizationSearchList({required this.model, Key? key})
      : super(key: key);
  final SelectOrganizationViewModel model;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(graphqlConfig.authClient()),
      child: Query(
        options: QueryOptions(
          document: gql(Queries().fetchJoinInOrgByName),
          variables: {
            'nameStartsWith': model.searchController.text,
            // fetch 30 items only, will fetch more when scrolling index is at the 3rd last item!
            'first': 30,
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
              showSnackBar: false,
            );
            if (isException!) {
              refetch!();
            } else {
              refetch!();
            }
          } else {
            // If the result is still loading!
            if (!result.isLoading) {
              model.organizations = OrgInfo().fromJsonToList(
                result.data!['organizationsConnection'] as List,
              );
            }
            // return the Scroll bar widget for scrolling down the organizations.
            return Scrollbar(
              thumbVisibility: true,
              interactive: true,
              controller: model.controller,
              // Listview is a scrollable list of widgets arranged linearly.
              child: ListView.separated(
                controller: model.controller,
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
                          print(model.organizations.length);
                          model.fetchMoreHelper(
                            fetchMore!,
                            model.organizations,
                          );
                          print(model.organizations.length);
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
