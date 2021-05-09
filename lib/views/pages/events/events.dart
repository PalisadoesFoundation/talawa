//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

//pages are imported here
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/timer.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/events/event_detail_page.dart';
import 'package:talawa/views/pages/events/add_event_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/views/pages/events/add_task_dialog.dart';
import 'package:talawa/views/pages/events/edit_event_dialog.dart';
import 'package:talawa/views/widgets/loading.dart';
import 'package:talawa/views/widgets/show_progress.dart';

//pubspec packages are called here
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Events extends StatefulWidget {
  const Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List eventList = [];
  List displayedEvents = [];
  List currentFilterEvents = [];
  List eventsToDate = [];
  List myEvents = [];
  String dateSelected = 'Today';
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  StickyHeaderController stickyHeaderController = StickyHeaderController();
  final CalendarController _calendarController = CalendarController();
  CarouselController carouselController = CarouselController();
  String notFetched = 'No Events Created';
  bool fetched = true;
  Future<void> events;
  Timer timer = Timer();
  String userId;
  ScrollController listScrollController = ScrollController();

  //variable for organization Id
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
      final DateTime endTime = DateTime.fromMicrosecondsSinceEpoch(
          int.parse(event['endTime'].toString()));
      if (!(event['recurring'] as bool) &&
          timer.isSameDay(currentDate, startTime)) {
        currentevents.add(event);
      }
      if ((event['recurrance'] == 'DAILY') &&
          timer.liesBetween(currentDate, startTime, endTime)) {
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
      CustomToast.exceptionToast(
          msg: "Could not delete event! Please try again later");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key: const Key('EVENTS_APP_BAR'),
          title: const Text(
            'Events',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: eventFab(),
        body: FutureBuilder(
          future: events,
          // ignore: missing_return
          builder: (context, snapshot) {
            final state = snapshot.connectionState;
            if (state == ConnectionState.done) {
              if (eventList.isEmpty) {
                return RefreshIndicator(
                    onRefresh: () async {
                      try {
                        await getEvents();
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
                              background: calendar(),
                            )),
                        SliverStickyHeader(
                          header: carouselSliderBar(),
                          sliver: const SliverFillRemaining(
                              child: Center(
                            child: Text(
                              'No Event Created',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          )),
                        ),
                      ],
                    ));
              } else {
                return RefreshIndicator(
                    onRefresh: () async {
                      try {
                        await getEvents();
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
                            child: calendar(),
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
                                    children: [carouselSliderBar()],
                                  ),
                                  Expanded(
                                    child: displayedEvents.isEmpty
                                        ? const Center(
                                            child: Text('No Events Today.'))
                                        : Timeline.builder(
                                            lineColor: UIData.primaryColor,
                                            position: TimelinePosition.Left,
                                            itemCount: displayedEvents.length,
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
                                                          '${displayedEvents.length} Events',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black45),
                                                        ),
                                                      ),
                                                      eventCard(index)
                                                    ],
                                                  ),
                                                  iconBackground:
                                                      UIData.secondaryColor,
                                                );
                                              }
                                              return TimelineModel(
                                                eventCard(index),
                                                iconBackground:
                                                    UIData.secondaryColor,
                                                position:
                                                    TimelineItemPosition.right,
                                              );
                                            },
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              }
            } else if (state == ConnectionState.waiting) {
              print(snapshot.data);
              return Center(
                  child: Loading(
                key: UniqueKey(),
              ));
            } else if (state == ConnectionState.none) {
              return const Text('Could Not Fetch Data.');
            }
          },
        ));
  }

  Widget calendar() {
    DateTime now = DateTime.now();
    Map thisMonthsEvents = eventsToDates(eventList, now);
    return ListView(children: [
      TableCalendar(
        onVisibleDaysChanged: (m, n, b) {
          now = now.add(const Duration(days: 22));
          setState(() {
            thisMonthsEvents = eventsToDates(eventList, now);
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

  Widget carouselSliderBar() {
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
                  const Text(
                    'All',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    dateSelected,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
                options: CarouselOptions(
                  onPageChanged: (item, reason) {
                    currentFilterEvents = filterEventsByDay(
                        _calendarController.selectedDay, eventList);
                    if (item == 0) {
                      setState(() {
                        displayedEvents = eventList;
                      });
                    } else if (item == 1) {
                      setState(() {
                        displayedEvents = currentFilterEvents;
                      });
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

  Widget eventListView() {
    return displayedEvents.isEmpty
        ? Center(
            child: Loading(
            key: UniqueKey(),
          ))
        : RefreshIndicator(
            onRefresh: () async {
              getEvents();
            },
            child: Timeline.builder(
              lineColor: UIData.primaryColor,
              position: TimelinePosition.Left,
              itemCount: displayedEvents.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? TimelineModel(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '${displayedEvents.length} Events',
                                style: const TextStyle(color: Colors.black45),
                              ),
                            ),
                            eventCard(index)
                          ],
                        ),
                        iconBackground: UIData.secondaryColor)
                    : TimelineModel(eventCard(index),
                        iconBackground: UIData.secondaryColor,
                        position: TimelineItemPosition.right);
              },
            ));
  }

  Widget menueText(String text) {
    return ListTile(
        title: Text(
      text,
      style: TextStyle(color: Colors.grey[700]),
    ));
  }

  Widget eventCard(int index) {
    return Container(
      child: Column(
        children: [
          ExpansionTile(
            title: Text(
              displayedEvents[index]['title'].toString(),
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              displayedEvents[index]['description'].toString(),
              style: const TextStyle(color: Colors.black54),
            ),
            trailing: popUpMenue(displayedEvents[index]),
            children: <Widget>[
              displayedEvents[index]['isPublic'] as bool
                  ? menueText('This event is Public')
                  : menueText('This event is Private'),
              displayedEvents[index]['isRegistered'] as bool
                  ? menueText('You Are Registered')
                  : menueText('You Are Not Registered'),
              ListTile(
                trailing: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(UIData.secondaryColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const StadiumBorder()),
                  ),
                  onPressed: () {
                    pushNewScreen(
                      context,
                      withNavBar: true,
                      screen: EventDetail(event: displayedEvents[index] as Map),
                    );
                  },
                  child: const Text(
                    "More",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          // ),
          const Divider(
            height: 0,
            thickness: 1,
          )
        ],
      ),
    );
  }

  Widget popUpMenue(event) {
    return PopupMenuButton<int>(
      onSelected: (val) async {
        if (val == 1) {
          return _register(context, event['_id'].toString());
        } else if (val == 2) {
          return addEventTask(context, event['_id'].toString());
        } else if (val == 3) {
          return _editEvent(context, event as Map);
        } else if (val == 4) {
          return _deleteEvent(context, event['_id'].toString());
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
            value: 1,
            child: const ListTile(
              leading: const Icon(Icons.playlist_add_check, color: Colors.grey),
              title: const Text(
                'Register For Event',
                style: const TextStyle(color: Colors.black),
              ),
            )),
        const PopupMenuItem<int>(
            value: 2,
            child: const ListTile(
              leading: const Icon(Icons.note_add, color: Colors.grey),
              title: const Text(
                'Add a Task to this Event',
                style: const TextStyle(color: Colors.black),
              ),
            )),
        const PopupMenuItem<int>(
            value: 3,
            child: const ListTile(
              leading: const Icon(Icons.edit, color: Colors.grey),
              title: const Text(
                'Edit this event',
                style: const TextStyle(color: Colors.black),
              ),
            )),
        const PopupMenuItem<int>(
            value: 4,
            child: const ListTile(
              leading: const Icon(Icons.delete, color: Colors.grey),
              title: const Text(
                'Delete This Event',
                style: const TextStyle(color: Colors.black),
              ),
            ))
      ],
    );
  }

  Widget eventFab() {
    return FloatingActionButton(
        backgroundColor: UIData.secondaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          pushNewScreen(
            context,
            withNavBar: true,
            screen: AddEvent(),
          );
        });
  }
}
