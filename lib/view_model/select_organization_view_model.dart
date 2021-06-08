import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/join_org_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../locator.dart';

class SelectOrganizationViewModel extends BaseModel {
  final databaseService = locator<DataBaseMutationFunctions>();
  final ScrollController controller = ScrollController();
  final navigatorService = locator<NavigationService>();
  late OrgInfo selectedOrganization = OrgInfo(id: '-1');
  late List<OrgInfo> organizations = [];

  initialise(String initialData) async {
    if (!initialData.contains('-1')) {
      final fetch = await databaseService.fetchOrgById(initialData);
      if (fetch.runtimeType == OrgInfo) {
        selectedOrganization = fetch as OrgInfo;
        setState(ViewState.idle);
        navigatorService.pushScreen('/signupDetails',
            arguments: selectedOrganization);
      }
    }
  }

  selectOrg(OrgInfo item) {
    selectedOrganization = item;
    setState(ViewState.idle);
  }

  onTapContinue() {
    if (selectedOrganization.id != '-1') {
      navigatorService.pushScreen('/signupDetails',
          arguments: selectedOrganization);
    } else {
      navigatorService.showSnackBar('Select one organization to continue',
          duration: const Duration(milliseconds: 750));
    }
  }

  Widget showOrganizationList() {
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(
          locator<GraphqlConfig>().clientToQuery()),
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
                databaseService.encounteredExceptionOrError(
              result.exception!,
            );
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
                            fetchMoreHelper(fetchMore!, organizations);
                          }
                        },
                        child: JoinOrgTile(
                          index: index,
                          item: organizations[index],
                          onTap: (item) => selectOrg(item),
                          key: Key('OrgSelItem$index'),
                          showIcon: false,
                        ));
                  }
                  return JoinOrgTile(
                    index: index,
                    item: organizations[index],
                    onTap: (item) => selectOrg(item),
                    key: Key('OrgSelItem$index'),
                    showIcon: false,
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
