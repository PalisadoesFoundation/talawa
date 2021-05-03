import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/views/pages/organization/Join-Organization-Widgets/org_tile.dart';
import 'package:talawa/views/widgets/loading.dart';
import 'package:talawa/views/widgets/pagination_display.dart';

class OrganizationBody extends StatefulWidget {
  const OrganizationBody({
    Key key,
    @required this.fromProfile,
    @required this.fToast,
    @required this.scaffoldKey,
    @required this.filter,
    this.query,
  }) : super(key: key);

  final String query;
  final bool fromProfile;
  final String filter;
  final FToast fToast;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _OrganizationBodyState createState() => _OrganizationBodyState();
}

class _OrganizationBodyState extends State<OrganizationBody> {
  bool isNextPageExist = true;

  @override
  void didUpdateWidget(covariant OrganizationBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    isNextPageExist = true;
  }

  @override
  Widget build(BuildContext context) {
    final Queries _query = Queries();
    return widget.query != null && widget.query.isNotEmpty
        ? Query(
            options: QueryOptions(
              documentNode: gql(_query.getOrganizationsConnectionFilter),
              variables: {
                'nameContains': widget.query,
                'first': 15,
                'skip': 0,
                'isPublic': !(widget.filter == "Private Org"),
              },
            ),
            builder: (
              QueryResult result, {
              Future<QueryResult> Function() refetch,
              FetchMore fetchMore,
            }) {
              if (result.hasException) {
                print(result.exception);
                return const Loading(isShowingError: true);
              }

              ///WIDGET TO SHOW WHEN [LOADING] DATA
              if (result.loading && result.data == null) {
                return Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ],
                  ),
                );
              }

              final List organizations =
                  result.data['organizationsConnection'] as List;

              if (organizations.isEmpty) {
                return Center(
                  child: Loading(
                    key: UniqueKey(),
                  ),
                );
              }

              return ListView.builder(
                itemCount: organizations.length + 1,
                itemBuilder: (context, index) {
                  // Pagination Widget
                  if (index == organizations.length) {
                    return PaginationIcon(
                      result: result,
                      fetchMoreHelper: () => fetchMoreHelper(
                        fetchMore,
                        organizations,
                      ),
                      isNextPageExist:
                          // ignore: avoid_bool_literals_in_conditional_expressions
                          organizations.length % 15 != 0
                              ? false
                              : isNextPageExist,
                    );
                  }

                  final organization = organizations[index] as Map;

                  return OrganisationTile(
                    fToast: widget.fToast,
                    fromProfile: widget.fromProfile,
                    index: index,
                    organization: organization,
                    scaffoldKey: widget.scaffoldKey,
                  );
                },
              );
            },
          )
        : Query(
            options: QueryOptions(
              documentNode: gql(
                widget.filter == "Show All"
                    ? _query.getOrganizationsConnection
                    : _query.getFilteredOrganizationsConnection,
              ),
              variables: widget.filter == "Show All"
                  ? {
                      'first': 15,
                      'skip': 0,
                    }
                  : {
                      'first': 15,
                      'skip': 0,
                      'isPublic': widget.filter == "Public Org",
                    },
            ),
            builder: (
              QueryResult result, {
              Future<QueryResult> Function() refetch,
              FetchMore fetchMore,
            }) {
              if (result.hasException) {
                print(result.exception);
                return const Loading(isShowingError: true);
              }

              ///WIDGET TO SHOW WHEN [LOADING] DATA
              if (result.loading && result.data == null) {
                return Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ],
                  ),
                );
              }

              final List organizations =
                  result.data['organizationsConnection'] as List;

              if (organizations.isEmpty) {
                return Center(
                  child: Loading(
                    key: UniqueKey(),
                  ),
                );
              }

              return ListView.builder(
                itemCount: organizations.length + 1,
                itemBuilder: (context, index) {
                  // Pagination Widget
                  if (index == organizations.length) {
                    return PaginationIcon(
                      result: result,
                      fetchMoreHelper: () =>
                          fetchMoreHelper(fetchMore, organizations),
                      isNextPageExist: isNextPageExist,
                    );
                  }

                  final organization = organizations[index] as Map;

                  return OrganisationTile(
                    fToast: widget.fToast,
                    fromProfile: widget.fromProfile,
                    index: index,
                    organization: organization,
                    scaffoldKey: widget.scaffoldKey,
                  );
                },
              );
            },
          );
  }

  /// FUNCTION TO FETCH DATA BASED ON USER PAGINATION CHOICE
  void fetchMoreHelper(FetchMore fetchMore, List organizations) {
    fetchMore(
      FetchMoreOptions(
        variables: {
          "first": 15,
          "skip": organizations.length,
        },
        updateQuery: (existingOrganizations, newOrganizations) {
          isNextPageExist =
              (newOrganizations["organizationsConnection"] as List).isNotEmpty;
          return {
            'organizationsConnection': [
              ...existingOrganizations["organizationsConnection"],
              ...newOrganizations['organizationsConnection'],
            ],
          };
        },
      ),
    );
  }
}
