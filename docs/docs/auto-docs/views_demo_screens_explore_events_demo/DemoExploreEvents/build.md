::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [views/demo_screens/explore_events_demo.dart](../../views_demo_screens_explore_events_demo/)
3.  [DemoExploreEvents](../../views_demo_screens_explore_events_demo/DemoExploreEvents-class.html)
4.  build method

::: self-name
build
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="views_demo_screens_explore_events_demo/DemoExploreEvents-class-sidebar.html" below-sidebar=""}
<div>

# [build]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[build]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#build-param-context .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the
tree in a given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
and when the dependencies of this widget change (e.g., an
[InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
referenced by this widget changes). This method can potentially be
called in every frame and should not have any side effects beyond
building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget\'s
constructor and from the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. A given widget might be built
with multiple different
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

-   the fields of the widget, which themselves must not change over
    time, and
-   any ambient state obtained from the `context` using
    [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget\'s
[build](../../views_demo_screens_explore_events_demo/DemoExploreEvents/build.html)
method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Widget build(BuildContext context) {
  final model = locator<ExploreEventsViewModel>();
  return Scaffold(
    appBar: AppBar(
      // AppBar returns widget for the header.
      backgroundColor: Theme.of(context).primaryColor,
      key: const Key("ExploreEventsAppBar"),
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        AppLocalizations.of(context)!.strictTranslate('Explore Events'),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
      ),
      leading: IconButton(
        // returns a button of menu icon to redirect to home.
        color: Theme.of(context).iconTheme.color,
        icon: const Icon(Icons.menu),
        onPressed: () =>
            MainScreenViewModel.scaffoldKey.currentState!.openDrawer(),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: SizeConfig.screenWidth! * 0.027,
          ),
          // if the events is not empty then renders button for searching the events else renders just a box.
          // child: model.events.isNotEmpty
          //     ? IconButton(
          //         onPressed: () {
          //           showSearch(
          //             context: context,
          //             delegate: EventSearch(
          //               eventList: model.events,
          //               exploreEventsViewModel: model,
          //             ),
          //           );
          //         },
          //         icon: const Icon(Icons.search, size: 20),
          //       )
          //     : const SizedBox(),
          child: const SizedBox(),
        ),
      ],
    ),
    // if the model is still fetching the events list then renders the Circular Progress Indicator
    // else render refresh icon along with the list of searched events for exploration.
    body: Stack(
      children: [
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * 0.010,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Card(
                        color: Theme.of(context).colorScheme.onPrimary,
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          //width: SizeConfig.screenWidth! * 0.45,
                          child: DropdownButtonHideUnderline(
                            child: dropDownList(model, context),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            // on tap open the Explore Event Dialog.
                            context: context,
                            builder: (_) {
                              return const ExploreEventDialog(
                                key: Key('ExploreEvents'),
                              );
                            },
                          );
                        },
                        child: Card(
                          key: homeModel?.keySEDateFilter,
                          color: Theme.of(context).colorScheme.onPrimary,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            // width: SizeConfig.screenWidth! * 0.30,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  color: Color(0xff524F4F),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .strictTranslate(
                                    "Add Date",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: IconButton(
                          onPressed: () {
                            navigationService.pushScreen(
                              Routes.calendar,
                              arguments: model.events,
                            );
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.027,
                ),
                // if the events model is empty then renders a box with text as "Empty List"
                // else renders lists of the all event tile.
                model.events.isEmpty
                    ? SizedBox(
                        height: SizeConfig.screenHeight! * 0.5,
                        child: Center(
                          child: Text(model.emptyListMessage),
                        ),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.events.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              navigationService.pushScreen(
                                "/eventInfo",
                                arguments: {
                                  "event": model.events[index],
                                  "exploreEventViewModel": model,
                                },
                              );
                            },
                            child: EventCard(
                              event: model.events[index],
                              isSearchItem: false,
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ],
    ),

    floatingActionButton: FloatingActionButton.extended(
      key: homeModel?.keySEAdd,
      heroTag: "AddEventFab",
      backgroundColor: Theme.of(context).colorScheme.surface,
      onPressed: () {
        navigationService.pushScreen(
          "/createEventPage",
        );
      },
      icon: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.secondary,
      ),
      label: Text(
        AppLocalizations.of(context)!.strictTranslate("Event"),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Theme.of(context).colorScheme.secondary),
      ),
    ),
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [explore_events_demo](../../views_demo_screens_explore_events_demo/)
3.  [DemoExploreEvents](../../views_demo_screens_explore_events_demo/DemoExploreEvents-class.html)
4.  build method

##### DemoExploreEvents class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
