import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/signup_progress_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SelectOrganization extends StatefulWidget {
  const SelectOrganization({required Key key, required this.selectedOrgId})
      : super(key: key);
  final String selectedOrgId;

  @override
  _SelectOrganizationState createState() => _SelectOrganizationState();
}

class _SelectOrganizationState extends State<SelectOrganization> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SelectOrganizationViewModel>(
      onModelReady: (model) => model.initialise(widget.selectedOrgId),
      builder: (context, model, child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                navigationService.pop();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignupProgressIndicator(
                  key: const Key('SelectOrg'),
                  currentPageIndex: 0,
                ),
                model.selectedOrganization.id != '-1'
                    ? Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          AppLocalizations.of(context)!
                              .strictTranslate('Selected Organization'),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      )
                    : const SizedBox(),
                model.selectedOrganization.id != '-1'
                    ? CustomListTile(
                        index: model.organizations
                            .indexOf(model.selectedOrganization),
                        type: TileType.org,
                        orgInfo: model.selectedOrganization,
                        onTapOrgInfo: (item) => model.selectOrg(item),
                        key: const Key('OrgSelItem'),
                        showIcon: false,
                      )
                    : const SizedBox(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2.0,
                  ),
                ),
                Expanded(child: showOrganizationList(model)),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.0215,
                ),
                RaisedRoundedButton(
                  buttonLabel:
                      AppLocalizations.of(context)!.strictTranslate('Continue'),
                  onTap: model.onTapContinue,
                  textColor: const Color(0xFF008A37),
                  key: const Key('SignUpLoginDetailsButton'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.0215,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

 Widget showOrganizationList(SelectOrganizationViewModel model) {
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
                          model.fetchMoreHelper(fetchMore!, model.organizations);
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

   Widget showSearchList(SelectOrganizationViewModel model) {
    print(model.searchController.text);
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
                          print(model.organizations.length);
                          model.fetchMoreHelper(
                              fetchMore!, model.organizations);
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

