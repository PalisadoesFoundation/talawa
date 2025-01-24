




build method - OrganizationList class - organization\_list library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/organization\_list.dart](../../widgets_organization_list/widgets_organization_list-library.html)
3. [OrganizationList](../../widgets_organization_list/OrganizationList-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @override

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
build(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)
override

Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the tree
in a given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) and when the dependencies of this widget change
(e.g., an [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling [Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

* the fields of the widget, which themselves must not change over time,
  and
* any ambient state obtained from the `context` using
  [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget's [build](../../widgets_organization_list/OrganizationList/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

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
2. [organization\_list](../../widgets_organization_list/widgets_organization_list-library.html)
3. [OrganizationList](../../widgets_organization_list/OrganizationList-class.html)
4. build method

##### OrganizationList class





talawa
1.0.0+1






