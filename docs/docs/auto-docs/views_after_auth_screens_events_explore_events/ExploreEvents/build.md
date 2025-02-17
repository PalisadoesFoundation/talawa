::::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_explore_events/ExploreEvents-class-sidebar.html" below-sidebar=""}
<div>

# [build]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
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
:::::

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
[build](../../views_after_auth_screens_events_explore_events/ExploreEvents/build.html)
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
  return BaseView<ExploreEventsViewModel>(
    onModelReady: (model) => model.initialise(),
    builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          key: const Key(
            "ExploreEventsAppBar",
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.strictTranslate(
              'Explore Events',
            ),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
          ),
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () =>
                MainScreenViewModel.scaffoldKey.currentState!.openDrawer(),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.screenWidth! * 0.027,
              ),
              child: model.events.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: EventSearch(
                            eventList: model.events,
                            exploreEventsViewModel: model,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        body: model.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async => model.refreshEvents(),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth! * 0.010,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.013,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () => showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      context: context,
                                      builder: (_) => dropDownList(
                                        model,
                                        context,
                                      ),
                                    ),
                                    child: Card(
                                      surfaceTintColor: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: SizeConfig
                                                  .safeBlockHorizontal,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .strictTranslate(
                                                "Filters",
                                              ),
                                            ),
                                            SizedBox(
                                              width: SizeConfig
                                                  .safeBlockHorizontal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: () => showDialog(
                                      context: context,
                                      builder: (_) =>
                                          const ExploreEventDialog(
                                        key: Key('ExploreEvents'),
                                      ),
                                    ),
                                    child: Card(
                                      surfaceTintColor: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                      key: homeModel?.keySEDateFilter,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: SizeConfig
                                                  .safeBlockHorizontal,
                                            ),
                                            const Icon(
                                              Icons.calendar_today,
                                              color: Color(0xff524F4F),
                                            ),
                                            SizedBox(
                                              width: SizeConfig
                                                  .safeBlockHorizontal,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .strictTranslate(
                                                "Filter by Date",
                                              ),
                                            ),
                                            SizedBox(
                                              width: SizeConfig
                                                  .safeBlockHorizontal,
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
                                    surfaceTintColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
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
                              height: SizeConfig.screenHeight! * 0.020,
                            ),
                            model.events.isEmpty
                                ? SizedBox(
                                    height: SizeConfig.screenHeight! * 0.5,
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .strictTranslate(
                                          model.emptyListMessage,
                                        ),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: model.events.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
              ),
        floatingActionButton: FloatingActionButton.extended(
          key: homeModel?.keySEAdd,
          heroTag: "AddEventFab",
          backgroundColor: Theme.of(context).colorScheme.surface,
          onPressed: () => navigationService.pushScreen("/createEventPage"),
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
    },
  );
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [explore_events](../../views_after_auth_screens_events_explore_events/)
3.  [ExploreEvents](../../views_after_auth_screens_events_explore_events/ExploreEvents-class.html)
4.  build method

##### ExploreEvents class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
