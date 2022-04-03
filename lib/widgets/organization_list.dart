import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OrganizationList extends StatelessWidget {
  const OrganizationList({required this.model, Key? key}) : super(key: key);
  final SelectOrganizationViewModel model;

  @override
  Widget build(BuildContext context) {
    model.organizations = [];
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(graphqlConfig.clientToQuery()),
      child: Query(
        options: QueryOptions(
          document: gql(queries.fetchJoinInOrg),
          variables: {
            'first': 15,
            'skip': 0,
          },
        ),
        builder: (
          QueryResult result, {
          Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
          Future<QueryResult?> Function()? refetch,
        }) {
          if (result.hasException) {
            final bool? isException =
                databaseFunctions.encounteredExceptionOrError(
              result.exception!,
              showSnackBar: false,
            );
            if (isException!) {
              refetch!();
            } else {
              refetch!();
            }
          } else {
            if (!result.isLoading) {
              model.organizations = OrgInfo().fromJsonToList(
                result.data!['organizationsConnection'] as List,
              );
            }
            return Scrollbar(
              isAlwaysShown: true,
              interactive: true,
              controller: model.allOrgController,
              child: ListView.separated(
                controller: model.allOrgController,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: result.isLoading
                    ? model.organizations.length + 1
                    : model.organizations.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == model.organizations.length) {
                    return ListTile(
                      title: Center(
                        child: CupertinoActivityIndicator(
                          radius: SizeConfig.screenWidth! * 0.065,
                        ),
                      ),
                    );
                  }
                  if (index == model.organizations.length - 3) {
                    return VisibilityDetector(
                      key: const Key('OrgSelItem'),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction > 0) {
                          model.fetchMoreHelper(
                              fetchMore!, model.organizations);
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
