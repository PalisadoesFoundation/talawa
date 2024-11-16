import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/exceptions/graphql_exception_resolver.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OrganizationSearchList extends StatelessWidget {
  const OrganizationSearchList({required this.model, super.key});

  final SelectOrganizationViewModel model;

  @override
  Widget build(BuildContext context) {
    int noOfRefetch = 0;
    const int maxRefetch = 10;

    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(graphqlConfig.authClient()),
      child: Query(
        options: QueryOptions(
          document: gql(Queries().fetchJoinInOrgByName),
          variables: {
            'nameStartsWith': model.searchController.text,
            'first': 30,
            'skip': 0,
          },
        ),
        builder: (
          QueryResult result, {
          Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
          Future<QueryResult?> Function()? refetch,
        }) {
          if (result.hasException) {
            if (noOfRefetch <= maxRefetch) {
              noOfRefetch++;
              refetch?.call();
            }
          } else if (!result.isLoading) {
            model.organizations = OrgInfo().fromJsonToList(
              result.data!['organizationsConnection'],
            );
          }

          return _buildListView(context, result, fetchMore);
        },
      ),
    );
  }

  Widget _buildListView(BuildContext context, QueryResult result,
      Future<QueryResult> Function(FetchMoreOptions)? fetchMore) {
    return Scrollbar(
      thumbVisibility: true,
      interactive: true,
      controller: model.controller,
      child: ListView.separated(
        controller: model.controller,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: result.isLoading
            ? model.organizations.length + 1
            : model.organizations.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == model.organizations.length) {
            return const ListTile(
              title: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }

          return VisibilityDetector(
            key: Key('OrgSelItem$index'),
            onVisibilityChanged: (VisibilityInfo info) {
              if (info.visibleFraction > 0 &&
                  index == model.organizations.length - 3) {
                model.fetchMoreHelper(fetchMore!, model.organizations);
              }
            },
            child: CustomListTile(
              index: index,
              type: TileType.org,
              orgInfo: model.organizations[index],
              onTapOrgInfo: model.selectOrg,
              key: const Key('test'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 0.5,
          );
        },
      ),
    );
  }
}
