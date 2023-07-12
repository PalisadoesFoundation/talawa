import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
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

  /// [homeModal] is a type of [MainScreenViewModel] which provides methods to handle the data for this component.
  final MainScreenViewModel? homeModel;

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

  /// Shows a list of dropdown taken from  `model` and `context`.
  ///
  /// **params**:
  /// * `model`: contains the events data
  /// * `context`: the overall context of UI
  ///
  /// **returns**:
  /// * `Widget`: the dropdown
  Widget dropDownList(ExploreEventsViewModel model, BuildContext context) {
    return DropdownButton<String>(
      key: homeModel?.keySECategoryMenu,
      value: model.chosenValue,
      isExpanded: true,
      items: <String>[
        'All Events',
        'Created Events',
        'Registered Events',
        'Public Events',
        'Private Events',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            AppLocalizations.of(context)!.strictTranslate(value),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        );
      }).toList(),
      onChanged: (value) {
        model.choseValueFromDropdown(value!);
      },
    );
  }
}
