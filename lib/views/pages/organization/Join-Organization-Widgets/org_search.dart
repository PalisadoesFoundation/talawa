import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/views/pages/organization/Join-Organization-Widgets/org_tile.dart';
import 'package:talawa/views/widgets/loading.dart';

class OrganizationSearch extends StatefulWidget {
  const OrganizationSearch({
    Key key,
    @required this.fromProfile,
    @required this.fToast,
    @required this.scaffoldKey,
    @required this.query,
    @required this.filter,
  }) : super(key: key);

  final String query;
  final String filter;
  final bool fromProfile;
  final FToast fToast;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _OrganizationSearchState createState() => _OrganizationSearchState();
}

class _OrganizationSearchState extends State<OrganizationSearch> {
  bool isNextPageExist = true;

  @override
  void didUpdateWidget(covariant OrganizationSearch oldWidget) {
    super.didUpdateWidget(oldWidget);
    isNextPageExist = true;
  }

  @override
  Widget build(BuildContext context) {
    final Queries _query = Queries();
    return Query(
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
              return _paginationWidget(
                fetchMore: fetchMore,
                organizations: organizations,
                result: result,
                context: context,
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

  /// WIDGET TO BE DISPLAYED BASED ON THE [PAGINATION] TENDENCY
  Widget _paginationWidget({
    @required QueryResult result,
    @required FetchMore fetchMore,
    @required List organizations,
    @required BuildContext context,
  }) {
    // bool isNextPageExist = organizations.length % 5 == 0;
    // if (isNextPageExist) {
    //   isNextPageExist = organizations.length !=
    //       Provider.of<OrgController>(context).getTotalOrg;
    // }

    if (isNextPageExist) {
      if (result.loading) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: GestureDetector(
              onTap: () => fetchMoreHelper(fetchMore, organizations),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.add_circle_outline_outlined,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Load More',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      return const SizedBox(height: 64);
    }
  }
}
