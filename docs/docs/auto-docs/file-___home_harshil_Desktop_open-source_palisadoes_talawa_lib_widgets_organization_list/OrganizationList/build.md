




build method - OrganizationList class - organization\_list library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/organization\_list.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_organization_list/)
3. [OrganizationList](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_organization_list/OrganizationList-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  final navigationServiceLocal = locator<NavigationService>();
  model.organizations = [];
  int noOfRefetch = 0;
  const int maxRefetch = 10;
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
          final isException =
              GraphqlExceptionResolver.encounteredExceptionOrError(
            result.exception!,
            showSnackBar: noOfRefetch == 0,
          );
          if (isException != null && noOfRefetch <= maxRefetch) {
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
            // print(result.data!['organizationsConnection']);
            model.organizations = OrgInfo().fromJsonToList(
              result.data!['organizationsConnection'],
            );
          }

          Timer(const Duration(seconds: TimeOuts.small), () {
            if (model.organizations.isEmpty) {
              navigationServiceLocal.showTalawaErrorDialog(
                "No organizations found Please contact your admin",
                MessageType.error,
              );
            }
          });
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
                      onTapOrgInfo: (item) => Navigator.pushNamed(
                        context,
                        '/OrganisationInfoScreen',
                        arguments: model.organizations[index],
                      ),
                      key: Key('OrgSelItem$index'),
                    ),
                  );
                }
                // return CustomeTile that shows a particular item in the list!
                return CustomListTile(
                  index: index,
                  type: TileType.org,
                  orgInfo: model.organizations[index],
                  onTapOrgInfo: (item) => Navigator.pushNamed(
                    context,
                    '/OrganisationInfoScreen',
                    arguments: model.organizations[index],
                  ),
                  key: Key('OrgSelItem$index'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container();
              },
            ),
          );
        }
        return Container();
      },
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [organization\_list](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_organization_list/)
3. [OrganizationList](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_organization_list/OrganizationList-class.html)
4. build method

##### OrganizationList class





talawa
1.0.0+1






