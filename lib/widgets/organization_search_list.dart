// ignore_for_file: talawa_good_doc_comments, talawa_api_doc
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// This widget displays a list of organizations searched via the search bar.
class OrganizationSearchList extends StatefulWidget {
  const OrganizationSearchList({required this.model, super.key});

  /// Model constructor for the select organization widget.
  final SelectOrganizationViewModel model;

  @override
  _OrganizationSearchListState createState() => _OrganizationSearchListState();
}

class _OrganizationSearchListState extends State<OrganizationSearchList> {
  final ValueNotifier<int> _refetchCount = ValueNotifier<int>(0);
  final int _maxRefetch = 10;

  @override
  void initState() {
    super.initState();
    _refetchCount.value = 0; // Initialize the refetch counter.
  }

  @override
  void dispose() {
    _refetchCount.dispose();
    super.dispose();
  }

  /// Builds a list tile for the organization list.
  Widget _buildListTile(BuildContext context, int index) {
    return CustomListTile(
      index: index,
      type: TileType.org,
      orgInfo: widget.model.organizations[index],
      onTapOrgInfo: widget.model.selectOrg,
      key: Key('orgTile_${widget.model.organizations[index].id}'),
    );
  }

  /// Builds a visibility tile to handle fetching more data when scrolled to the end.
  Widget _buildVisibilityTile(
    BuildContext context,
    int index,
    Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
  ) {
    return VisibilityDetector(
      key: Key('orgTile_${widget.model.organizations[index].id}'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (fetchMore != null) {
          widget.model.fetchMoreHelper(fetchMore, widget.model.organizations);
        }
      },
      child: _buildListTile(context, index),
    );
  }

  /// Builds the main list view with organization tiles.
  Widget _buildListView(
    QueryResult result,
    Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
  ) {
    return ListView.separated(
      controller: widget.model.controller,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: result.isLoading
          ? widget.model.organizations.length + 1
          : widget.model.organizations.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == widget.model.organizations.length) {
          return ListTile(
            title: Center(
              child: CupertinoActivityIndicator(
                radius: SizeConfig.screenWidth! * 0.065,
              ),
            ),
          );
        } else if (index == widget.model.organizations.length - 3) {
          return _buildVisibilityTile(context, index, fetchMore);
        }
        return _buildListTile(context, index);
      },
      separatorBuilder: (BuildContext context, int index) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.2),
        child: const Divider(
          color: Color(0xFFE5E5E5),
          thickness: 0.5,
        ),
      ),
    );
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
            if (_refetchCount.value < _maxRefetch) {
              _refetchCount.value++;
              refetch?.call();
            } else {
              print('Max refetch attempts reached.');
            }
            // } else if (!result.isLoading) {
            //   widget.model.organizations = OrgInfo().fromJsonToList(
            //     result.data!['organizationsConnection'],
            //   );
          }

          return Scrollbar(
            thumbVisibility: true,
            interactive: true,
            controller: widget.model.controller,
            child: _buildListView(result, fetchMore),
          );
        },
      ),
    );
  }
}
