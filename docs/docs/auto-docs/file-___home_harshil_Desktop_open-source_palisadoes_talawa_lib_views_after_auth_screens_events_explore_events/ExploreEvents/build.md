




build method - ExploreEvents class - explore\_events library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/events/explore\_events.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_explore_events/)
3. [ExploreEvents](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_explore_events/ExploreEvents-class.html)
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

 


1. [talawa](../../index.html)
2. [explore\_events](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_explore_events/)
3. [ExploreEvents](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_explore_events/ExploreEvents-class.html)
4. build method

##### ExploreEvents class





talawa
1.0.0+1






