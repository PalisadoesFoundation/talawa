//flutter packages are called here

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:talawa/enums/viewstate.dart';
import 'package:talawa/model/events.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/page_view_model/events_page_view_model.dart';
import 'package:talawa/views/pages/events/event_card_widget.dart';
import 'package:talawa/views/widgets/loading.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../base_view.dart';

class Events extends StatefulWidget {
  const Events({Key key}) : super(key: key);
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final CalendarController _calendarController = CalendarController();
  CarouselController carouselController = CarouselController();
  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseView<EventPageViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          key: const Key('EVENTS_APP_BAR'),
          title: Text(
            AppLocalizations.of(context).translate('Events'),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: eventFab(context),
        body: model.state == ViewState.busy
            ? Center(
                child: Loading(
                key: UniqueKey(),
                isCurrentOrgNull: false,
              ))
            : model.displayEvents.isEmpty
                ? RefreshIndicator(
                    onRefresh: () async {
                      try {
                        await model.getEvents();
                      } catch (e) {
                        CustomToast.exceptionToast(msg: e.toString());
                      }
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          automaticallyImplyLeading: false,
                          expandedHeight: SizeConfig.safeBlockVertical * 47.5,
                          flexibleSpace: FlexibleSpaceBar(
                            background: calendar(model),
                          ),
                        ),
                        SliverStickyHeader(
                          header: carouselSliderBar(model),
                          sliver: SliverFillRemaining(
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('No Event Created'),
                                style: const TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      try {
                        await model.getEvents();
                      } catch (e) {
                        CustomToast.exceptionToast(msg: e.toString());
                      }
                    },
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: calendar(model),
                          ),
                          SlidingUpPanel(
                            backdropEnabled: true,
                            panel: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListView(
                                    controller: listScrollController,
                                    shrinkWrap: true,
                                    children: [carouselSliderBar(model)],
                                  ),
                                  Expanded(
                                    child: model.eventList.isEmpty
                                        ? Center(
                                            child: Text(AppLocalizations.of(
                                                    context)
                                                .translate('No Events Today.')))
                                        : Timeline.builder(
                                            lineColor: UIData.primaryColor,
                                            position: TimelinePosition.Left,
                                            itemCount: model.eventList.length,
                                            itemBuilder: (context, index) {
                                              if (index == 0) {
                                                return TimelineModel(
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.symmetric(
                                                            vertical: SizeConfig
                                                                    .safeBlockVertical *
                                                                0.625),
                                                        child: Text(
                                                          '${model.eventList.length} ${AppLocalizations.of(context).translate("Events")}',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black45),
                                                        ),
                                                      ),
                                                      eventCard(
                                                          index, model, context)
                                                    ],
                                                  ),
                                                  iconBackground:
                                                      UIData.secondaryColor,
                                                );
                                              }
                                              return TimelineModel(
                                                eventCard(
                                                    index, model, context),
                                                iconBackground:
                                                    UIData.secondaryColor,
                                                position:
                                                    TimelineItemPosition.right,
                                              );
                                            },
                                          ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  Widget calendar(EventPageViewModel model) {
    DateTime now = DateTime.now();
    Map thisMonthsEvents = model.eventsToDates(model.eventList, now);
    return ListView(children: [
      TableCalendar(
        onVisibleDaysChanged: (m, n, b) {
          now = now.add(const Duration(days: 22));
          setState(() {
            thisMonthsEvents = model.eventsToDates(model.eventList, now);
          });
        },
        calendarStyle: const CalendarStyle(markersColor: Colors.black45),
        headerStyle: const HeaderStyle(
          formatButtonShowsNext: false,
        ),
        events: thisMonthsEvents as Map<DateTime, List<dynamic>>,
        calendarController: _calendarController,
      ),
    ]);
  }

  Widget carouselSliderBar(EventPageViewModel model) {
    return Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2.5),
        alignment: Alignment.centerLeft,
        color: UIData.secondaryColor,
        height: SizeConfig.safeBlockVertical * 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  carouselController.previousPage();
                },
                icon: const Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                )),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 57.5,
              child: CarouselSlider(
                carouselController: carouselController,
                items: [
                  Text(
                    AppLocalizations.of(context).translate('All'),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    model.dateSelected,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
                options: CarouselOptions(
                  onPageChanged: (item, reason) {
                    final List<EventsModel> _currentFilterEvents =
                        model.filterEventsByDay(
                            _calendarController.selectedDay, model.eventList);
                    if (item == 0) {
                      model.setDisplayEvents(model.eventList);
                    } else if (item == 1) {
                      model.setDisplayEvents(_currentFilterEvents);
                    }
                  },
                  height: SizeConfig.safeBlockVertical * 5,
                ),
              ),
            ),
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  carouselController.nextPage();
                },
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                )),
          ],
        ));
  }

  Widget eventListView(EventPageViewModel model) {
    return model.displayEvents.isEmpty
        ? Center(
            child: Loading(
            key: UniqueKey(),
            isCurrentOrgNull: model.isCurrOrgNull,
            emptyContentIcon: Icons.event,
            emptyContentMsg: AppLocalizations.of(context)
                .translate('No events to show, Create One!'),
            refreshFunction: model.getEvents,
          ))
        : RefreshIndicator(
            onRefresh: () async {
              model.getEvents();
            },
            child: Timeline.builder(
              lineColor: UIData.primaryColor,
              position: TimelinePosition.Left,
              itemCount: model.displayEvents.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? TimelineModel(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '${model.displayEvents.length} ${AppLocalizations.of(context).translate("Events")}',
                                style: const TextStyle(color: Colors.black45),
                              ),
                            ),
                            eventCard(index, model, context)
                          ],
                        ),
                        iconBackground: UIData.secondaryColor)
                    : TimelineModel(
                        eventCard(index, model, context),
                        iconBackground: UIData.secondaryColor,
                        position: TimelineItemPosition.right,
                      );
              },
            ),
          );
  }
}
