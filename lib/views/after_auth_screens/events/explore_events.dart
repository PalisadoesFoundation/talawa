import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_card.dart';
import 'package:talawa/widgets/event_search_delegate.dart';

class ExploreEvents extends StatelessWidget {
  const ExploreEvents({
    required Key key,
    this.homeModel,
  }) : super(key: key);
  final MainScreenViewModel? homeModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreEventsViewModel>(
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              key: const Key("ExploreEventsAppBar"),
              elevation: 0.0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                AppLocalizations.of(context)!.strictTranslate('Explore Events'),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
              ),
              leading: IconButton(
                color: Theme.of(context).iconTheme.color,
                icon: const Icon(Icons.menu),
                onPressed: () =>
                    homeModel!.scaffoldKey.currentState!.openDrawer(),
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
                                    exploreEventsViewModel: model));
                          },
                          icon: const Icon(Icons.search, size: 20))
                      : const SizedBox(),
                )
              ],
            ),
            body: model.isBusy
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async => model.fetchNewEvents(),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth! * 0.027),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      elevation: 2,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: SizeConfig.screenWidth! * 0.55,
                                        child: DropdownButtonHideUnderline(
                                            child:
                                                dropDownList(model, context)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return const ExploreEventDialog(
                                                  key: Key('ExploreEvents'));
                                            });
                                      },
                                      child: Card(
                                        key: homeModel?.keySEDateFilter,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        child: SizedBox(
                                          height:
                                              SizeConfig.screenHeight! * 0.068,
                                          width: SizeConfig.screenWidth! * 0.27,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Icon(
                                                Icons.calendar_today,
                                                color: Color(0xff524F4F),
                                                size: 19,
                                              ),
                                              SizedBox(
                                                width: SizeConfig.screenWidth! *
                                                    0.17,
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .strictTranslate(
                                                          "Add Date"),
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: SizeConfig.screenHeight! * 0.027),
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
                                                    "event":
                                                        model.events[index],
                                                    "exploreEventViewModel":
                                                        model
                                                  });
                                            },
                                            child: EventCard(
                                              event: model.events[index],
                                              isSearchItem: false,
                                            ),
                                          );
                                        }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            floatingActionButton: FloatingActionButton.extended(
              key: homeModel?.keySEAdd,
              backgroundColor: Theme.of(context).primaryColor,
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
                    .headline5!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          );
        });
  }

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
                .headline6!
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
