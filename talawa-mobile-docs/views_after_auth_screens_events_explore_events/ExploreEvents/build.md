


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
<p>If a widget's <a href="../../views_after_auth_screens_events_explore_events/ExploreEvents/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
@override
Widget build(BuildContext context) {
  return BaseView<ExploreEventsViewModel>(
    onModelReady: (model) => model.initialise(),
    builder: (context, model, child) {
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
                      icon: const Icon(Icons.search, size: 20),
                    )
                  : const SizedBox(),
            )
          ],
        ),
        // if the model is still fetching the events list then renders the Circular Progress Indicator
        // else render refresh icon along with the list of searched events for exploration.
        body: model.isBusy
            ? const Center(child: CircularProgressIndicator())
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
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Card(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary,
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
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
                                              "exploreEventViewModel": model
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
          backgroundColor: Theme.of(context).colorScheme.background,
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
    },
  );
}
```







