import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_filter_bottomsheet.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_card.dart';
import 'package:talawa/widgets/event_search_delegate.dart';

/// Shows the list of events with options to categorize them.
class ExploreEvents extends StatelessWidget {
  const ExploreEvents({
    required Key key,
    this.homeModel,
  }) : super(key: key);

  /// Represents the view model for the home screen.
  final MainScreenViewModel? homeModel;

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
              onPressed: () => Scaffold.maybeOf(context)?.openDrawer(),
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
                  onRefresh: () => model.refreshEvents(),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        controller: model.scrollController,
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
                              if (model.isPaginating &&
                                  model.eventService.hasMoreEvents)
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
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
}
