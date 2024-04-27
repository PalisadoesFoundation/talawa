


# build method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) build
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>Describes the part of the user interface represented by this widget.</p>
<p>The framework calls this method when this widget is inserted into the tree
in a given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> and when the dependencies of this widget change
(e.g., an <a href="https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html">InheritedWidget</a> referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.</p>
<p>The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling <a href="https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html">Widget.canUpdate</a>.</p>
<p>Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>.</p>
<p>The given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.</p>
<p>The implementation of this method must only depend on:</p>
<ul>
<li>the fields of the widget, which themselves must not change over time,
and</li>
<li>any ambient state obtained from the <code>context</code> using
<a href="https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html">BuildContext.dependOnInheritedWidgetOfExactType</a>.</li>
</ul>
<p>If a widget's <a href="../../widgets_organization_search_list/OrganizationSearchList/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
@override
Widget build(BuildContext context) {
  return GraphQLProvider(
    client: ValueNotifier<GraphQLClient>(graphqlConfig.authClient()),
    child: Query(
      options: QueryOptions(
        document: gql(Queries().fetchJoinInOrgByName),
        variables: {
          'nameStartsWith': model.searchController.text,
          // fetch 30 items only, will fetch more when scrolling index is at the 3rd last item!
          'first': 30,
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
          final isException = databaseFunctions.encounteredExceptionOrError(
            result.exception!,
            showSnackBar: false,
          );
          if (isException!) {
            refetch!();
          } else {
            refetch!();
          }
        } else {
          // If the result is still loading!
          if (!result.isLoading) {
            model.organizations = OrgInfo().fromJsonToList(
              result.data!['organizationsConnection'] as List,
            );
          }
          // return the Scroll bar widget for scrolling down the organizations.
          return Scrollbar(
            thumbVisibility: true,
            interactive: true,
            controller: model.controller,
            // Listview is a scrollable list of widgets arranged linearly.
            child: ListView.separated(
              controller: model.controller,
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
                        print(model.organizations.length);
                        model.fetchMoreHelper(
                          fetchMore!,
                          model.organizations,
                        );
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
                // return CustomeTile that shows a particular item in the list!
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
```







