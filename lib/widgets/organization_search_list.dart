import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OrganizationSearchList extends StatefulWidget {
  const OrganizationSearchList({required this.model, super.key});

  final SelectOrganizationViewModel model;

  @override
  _OrganizationSearchListState createState() => _OrganizationSearchListState();
}

class _OrganizationSearchListState extends State<OrganizationSearchList> {
  static const int maxRefetch = 10;
  final ValueNotifier<int> _refetchCount = ValueNotifier<int>(0);

  @override
  void dispose() {
    _refetchCount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(graphqlConfig.authClient()),
      child: Query(
        options: QueryOptions(
          document: gql(Queries().fetchJoinInOrgByName),
          variables: {
            'nameStartsWith': widget.model.searchController.text,
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
            if (_refetchCount.value < maxRefetch) {
              _refetchCount.value++;
              refetch?.call();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Failed to load organizations. Please try again later.',
                  ),
                ),
              );
            }
          } else if (!result.isLoading) {
            final data = result.data;
            if (data != null && data['organizationsConnection'] != null) {
              try {
                widget.model.organizations = OrgInfo().fromJsonToList(
                  data['organizationsConnection'],
                );
              } catch (e) {
                debugPrint('Error parsing organization data: $e');
                widget.model.organizations = [];
              }
            }
          }

          return _buildListView(context, result, fetchMore);
        },
      ),
    );
  }

  Widget _buildListView(
    BuildContext context,
    QueryResult result,
    Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
  ) {
    return Scrollbar(
      thumbVisibility: true,
      interactive: true,
      controller: widget.model.controller,
      child: ListView.separated(
        controller: widget.model.controller,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: result.isLoading
            ? widget.model.organizations.length + 1
            : widget.model.organizations.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == widget.model.organizations.length) {
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
                  index == widget.model.organizations.length - 3) {
                if (fetchMore != null) {
                  widget.model
                      .fetchMoreHelper(fetchMore, widget.model.organizations);
                }
              }
            },
            child: CustomListTile(
              index: index,
              type: TileType.org,
              orgInfo: widget.model.organizations[index],
              onTapOrgInfo: widget.model.selectOrg,
              key: Key('orgTile_${widget.model.organizations[index].id}'),
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
