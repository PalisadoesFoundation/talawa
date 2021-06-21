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
<<<<<<< HEAD
  String notFetched = 'No Events Created';
  bool fetched = true;
  Future<void> events;
  Timer timer = Timer();
  String userId;

  FToast fToast;

  //variable for organization Id
  // ignore: unused_field
  String _currOrgId;

  @override
  void initState() {
    super.initState();
    setState(() {
      events = getEvents();
    });
  }

  //get all events for a given day
  //account for recurring events
  List filterEventsByDay(DateTime currentDate, List events) {
    final List currentevents = [];

    for (final event in events) {
      final DateTime startTime = DateTime.fromMicrosecondsSinceEpoch(
          int.parse(event['startTime'].toString()));
      if (!(event['recurring'] as bool) &&
          timer.isSameDay(currentDate, startTime)) {
        currentevents.add(event);
      }
      if (event['recurrance'] == 'DAILY') {
        currentevents.add(event);
      } else if (event['recurrance'] == 'WEEKLY' &&
          timer.isSameWeekDay(currentDate, startTime)) {
        currentevents.add(event);
      } else if (event['recurrance'] == 'MONTHLY' &&
          currentDate.day == startTime.day) {
        currentevents.add(event);
      } else if (event['recurrance'] == 'YEARLY' &&
          currentDate.month == startTime.month &&
          currentDate.day == startTime.day) {
        currentevents.add(event);
      }
    }
    return currentevents;
  }

  //return events in calendar display format ''Map<DateTime, List<dynamic>>''
  //account for recurring events
  Map eventsToDates(List events, DateTime now) {
    final Map<DateTime, List<dynamic>> eventDates = {};
    addDateToMap(DateTime date, Map event) {
      if (eventDates[date] == null) {
        eventDates[date] = [event];
      } else {
        eventDates[date].add(event);
      }
    }

    for (final event in events) {
      if (!(event['recurring'] as bool)) {
        addDateToMap(
            DateTime.fromMicrosecondsSinceEpoch(
                int.parse(event['startTime'].toString())),
            event as Map);
      } else {
        if (event['recurrance'] == 'DAILY') {
          int day = DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(event['startTime'].toString()))
              .day;
          final int lastday = DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(event['endTime'].toString()))
              .day;
          while (day <= lastday) {
            addDateToMap(DateTime(now.year, now.month, day), event as Map);
            day += 1;
          }
        }
        if (event['recurrance'] == 'WEEKLY') {
          int day = DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(event['startTime'].toString()))
              .day;
          final int lastday = DateTime.fromMicrosecondsSinceEpoch(
                  int.parse(event['endTime'].toString()))
              .day;
          while (day <= lastday) {
            addDateToMap(DateTime(now.year, now.month, day), event as Map);

            day += 7;
          }
        }
        if (event['recurrance'] == 'MONTHLY') {
          final DateTime firstDate = DateTime.fromMicrosecondsSinceEpoch(
              int.parse(event['startTime'].toString()));
          addDateToMap(
              DateTime(now.year, now.month, firstDate.day), event as Map);
        }
        if (event['recurrance'] == 'YEARLY') {
          final DateTime firstDate = DateTime.fromMicrosecondsSinceEpoch(
              int.parse(event['startTime'].toString()));
          if (now.month == firstDate.month) {
            addDateToMap(
                DateTime(now.year, now.month, firstDate.day), event as Map);
          }
        }
      }
    }
    return eventDates;
  }

  //function called to delete the event
  Future<void> _deleteEvent(BuildContext context, String eventId) async {
    showProgress(context, 'Deleting Event . . .', isDismissible: false);
    final String mutation = Queries().deleteEvent(eventId);
    final Map result = await apiFunctions.gqlquery(mutation);
    if (result["exception"] != null) {
      _exceptionToast("Could not delete event! Please try again later");
    }
    await getEvents();
    hideProgress();
  }

  //function to called be called for register
  Future<void> _register(BuildContext context, String eventId) async {
    final Map result = await Queries().registerForEvent(eventId) as Map;
    print(result);
  }

  //function to get the events
  Future<void> getEvents() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    _currOrgId = currentOrgID;
    final Map result =
        await apiFunctions.gqlquery(Queries().fetchOrgEvents(currentOrgID));
    eventList =
        result == null ? [] : (result['events'] as List).reversed.toList();
    eventList.removeWhere((element) =>
        element['title'] == 'Talawa Congress' ||
        element['title'] == 'test' ||
        element['title'] == 'Talawa Conference Test' ||
        element['title'] == 'mayhem' ||
        element['title'] == 'mayhem1' ||
        element['organization']['_id'] !=
            currentOrgID); //dont know who keeps adding these
    // This removes all invalid date formats other than Unix time
    eventList.removeWhere(
        (element) => int.tryParse(element['startTime'] as String) == null);
    eventList.sort((a, b) {
      return DateTime.fromMicrosecondsSinceEpoch(
              int.parse(a['startTime'] as String))
          .compareTo(DateTime.fromMicrosecondsSinceEpoch(
              int.parse(b['startTime'] as String)));
    });
    eventsToDates(eventList, DateTime.now());
    setState(() {
      displayedEvents = eventList;
    });
    userId = await preferences.getUserId();
  }

  //functions to edit the event
  Future<void> _editEvent(BuildContext context, Map event) async {
    if (event['creator']['_id'] != userId) {
      Fluttertoast.showToast(msg: "You cannot edit events you didn't create");
    } else {
      pushNewScreen(context,
          withNavBar: true,
          screen: EditEvent(
            event: event,
          ));
    }
  }

  Future<void> addEventTask(BuildContext context, String eventId) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddEventTask(
          eventId: eventId,
        );
      },
    );
  }
=======
  ScrollController listScrollController = ScrollController();
>>>>>>> origin/master

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
                                    child: model.displayEvents.isEmpty
                                        ? Center(
                                            child: Text(AppLocalizations.of(
                                                    context)
                                                .translate('No Events Today.')))
                                        : Timeline.builder(
                                            lineColor: UIData.primaryColor,
                                            position: TimelinePosition.Left,
                                            itemCount:
                                                model.displayEvents.length,
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
                                                          '${model.displayEvents.length} ${AppLocalizations.of(context).translate("Events")}',
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
                    if (item == 0) {
                      model.setDisplayEvents(model.eventList);
                    } else if (item == 1) {
                      final List<EventsModel> _currentFilterEvents =
                          model.filterEventsByDay(
                              _calendarController.selectedDay, model.eventList);
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
