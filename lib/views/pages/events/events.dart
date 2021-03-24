
//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

//pages are imported here
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/timer.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/events/EventDetailPage.dart';
import 'package:talawa/views/pages/events/addEventPage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/views/pages/events/addTaskDialog.dart';
import 'package:talawa/views/pages/events/editEventDialog.dart';


//pubspec packages are called here
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Events extends StatefulWidget {
  Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List eventList = [];
  List displayedEvents = [];
  List currentFilterEvents = [];
  List eventsToDate = [];
  String dateSelected = 'Today';
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  StickyHeaderController stickyHeaderController = StickyHeaderController();
  CalendarController _calendarController = CalendarController();
  CarouselController carouselController = CarouselController();
  Timer timer = Timer();
  initState() {
    super.initState();
    getEvents();
  }

  //get all events for a given day
  //account for recurring events
  List filterEventsByDay(DateTime currentDate, List events) {
    List currentevents = [];

    for (var event in events) {
      DateTime startTime =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(event['startTime']));
      if (!event['recurring'] && timer.isSameDay(currentDate, startTime)) {
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
    Map<DateTime, List<dynamic>> eventDates = {};
    addDateToMap(DateTime date, Map event) {
      if (eventDates[date] == null) {
        eventDates[date] = [event];
      } else {
        eventDates[date].add(event);
      }
    }

    for (var event in events) {
      if (!event['recurring']) {
        addDateToMap(
            DateTime.fromMicrosecondsSinceEpoch(int.parse(event['startTime'])),
            event);
      } else {
        if (event['recurrance'] == 'DAILY') {
          int day = 1;
          int lastday = DateTime(now.year, now.month + 1, 0).day;
          while (day <= lastday) {
            addDateToMap(DateTime(now.year, now.month, day), event);

            day += 1;
          }
        }
        if (event['recurrance'] == 'WEEKLY') {
          int day =
              DateTime.fromMicrosecondsSinceEpoch(int.parse(event['startTime']))
                      .day %
                  7;
          while (day <= DateTime(now.year, now.month + 1, 0).day) {
            addDateToMap(DateTime(now.year, now.month, day), event);

            day += 7;
          }
        }
        if (event['recurrance'] == 'MONTHLY') {
          DateTime firstDate = DateTime.fromMicrosecondsSinceEpoch(
              int.parse(event['startTime']));
          addDateToMap(DateTime(now.year, now.month, firstDate.day), event);
        }
        if (event['recurrance'] == 'YEARLY') {
          DateTime firstDate = DateTime.fromMicrosecondsSinceEpoch(
              int.parse(event['startTime']));
          if (now.month == firstDate.month) {
            addDateToMap(DateTime(now.year, now.month, firstDate.day), event);
          }
        }
      }
    }
    return eventDates;
  }


  //function called to delete the event
  Future<void> _deleteEvent(context, eventId) async {
    String mutation = Queries().deleteEvent(eventId);
    Map result = await apiFunctions.gqlquery(mutation);
    getEvents();
  }


  //function to called be called for register
  Future<void> _register(context, eventId) async {
    String mutation = Queries().registerForEvent(eventId);
    Map result = await apiFunctions.gqlmutation(mutation);
    print(result);
  }


  //function to get the events
  Future<void> getEvents() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
      Map result =
      await apiFunctions.gqlquery(Queries().fetchOrgEvents(currentOrgID));
      eventList = result == null ? [] : result['events'].reversed.toList();
      eventList.removeWhere((element) =>
          element['title'] == 'Talawa Congress' ||
          element['title'] == 'test' || element['title'] == 'Talawa Conference Test'); //dont know who keeps adding these
      eventList.sort((a, b) {
        return DateTime.fromMicrosecondsSinceEpoch(
          int.parse(a['startTime']))
          .compareTo(
          DateTime.fromMicrosecondsSinceEpoch(int.parse(b['startTime'])));
      });
      eventsToDates(eventList, DateTime.now());
      setState(() {
        displayedEvents = eventList;
      });
      // print(displayedEvents);


    eventList.sort((a, b) => DateTime.fromMicrosecondsSinceEpoch(
        int.parse(a['startTime']))
        .compareTo(
        DateTime.fromMicrosecondsSinceEpoch(int.parse(b['startTime']))));
    eventsToDates(eventList, DateTime.now());
    setState(() {
      displayedEvents = eventList;
    });
  }


  //functions to edit the event
  Future<void> _editEvent(context, event) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditEvent(
          event: event,
        );
      },
    );
  }

  Future<void> addEventTask(context, eventId) async {
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
          title: Text(
            'Events',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: eventFab(),
        body: eventList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  getEvents();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        expandedHeight: 380,
                        flexibleSpace: FlexibleSpaceBar(
                          background: calendar(),
                        )),
                    SliverStickyHeader(
                      header: carouselSliderBar(),
                      sliver: SliverFillRemaining(child: eventListView()),
                    ),
                  ],
                )));
  }

  Widget calendar() {
    DateTime now = DateTime.now();
    Map thisMonthsEvents = eventsToDates(eventList, now);
    return ListView(children: [
      TableCalendar(
        onVisibleDaysChanged: (m, n, b) {
          now = now.add(Duration(days: 22));
          setState(() {
            thisMonthsEvents = eventsToDates(eventList, now);
          });
        },
        calendarStyle: CalendarStyle(markersColor: Colors.black45),
        /* onDaySelected: (day, events) {
          String carouselDay = DateFormat.yMMMd('en_US').format(day);
          if (timer.isSameDay(day, now)) {
            carouselDay = 'Today';
          }
          carouselController.animateToPage(1);
          setState(() {
            _calendarController.setSelectedDay(day);
            dateSelected = carouselDay;
          });
          List currentevents = filterEventsByDay(day, events);
          setState(() {
            currentFilterEvents = currentevents;
            displayedEvents = currentevents;
          });
        },*/
        events: thisMonthsEvents,
        calendarController: _calendarController,
      ),
    ]);
  }

  Widget carouselSliderBar() {
    return Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        color: UIData.secondaryColor,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  carouselController.previousPage();
                },
                icon: Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                )),
            SizedBox(
              width: 230,
              child: CarouselSlider(
                carouselController: carouselController,
                items: [
                  Text(
                    'All',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    dateSelected,
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                  height: 40,
                ),
              ),
            ),
            IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  carouselController.nextPage();
                },
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                )),
          ],
        ));
  }

  Widget eventListView() {
    return displayedEvents.isEmpty
        ? Center(child: CircularProgressIndicator())
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
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                '${displayedEvents.length} Events',
                                style: TextStyle(color: Colors.black45),
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

  Widget eventCard(index) {
    return Container(
      child: Column(
        children: [
          ExpansionTile(
            children: <Widget>[
              displayedEvents[index]['isPublic']
                  ? menueText('This event is Public')
                  : menueText('This event is Private'),
              displayedEvents[index]['isRegistered']
                  ? menueText('You Are Registered')
                  : menueText('You Are Not Registered'),
              // menueText('Starts: ' +
              //     DateFormat.jm('en_US')
              //         .format(DateTime.fromMicrosecondsSinceEpoch(
              //             int.parse(displayedEvents[index]['startTime'])))
              //         .toString()),
              ListTile(
                trailing: RaisedButton(
                  color: UIData.secondaryColor,
                  onPressed: () {
                    pushNewScreen(
                      context,
                      withNavBar: true,
                      screen: EventDetail(event: displayedEvents[index]),
                    );
                  },
                  child: Text(
                    "More",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: StadiumBorder(),
                ),
              ),
            ],
            title: Text(
              displayedEvents[index]['title'],
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              displayedEvents[index]['description'],
              style: TextStyle(color: Colors.black54),
            ),
            trailing: popUpMenue(displayedEvents[index]),
          ),
          // ),
          Divider(
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
          return _register(context, event['_id']);
        } else if (val == 2) {
          return addEventTask(context, event['_id']);
        } else if (val == 3) {
          return _editEvent(context, event);
        } else if (val == 4) {
          return _deleteEvent(context, event['_id']);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
            value: 1,
            child: ListTile(
              leading: Icon(Icons.playlist_add_check, color: Colors.grey),
              title: Text(
                'Register For Event',
                style: TextStyle(color: Colors.black),
              ),
            )),
        const PopupMenuItem<int>(
            value: 2,
            child: ListTile(
              leading: Icon(Icons.note_add, color: Colors.grey),
              title: Text(
                'Add a Task to this Event',
                style: TextStyle(color: Colors.black),
              ),
            )),
        const PopupMenuItem<int>(
            value: 3,
            child: ListTile(
              leading: Icon(Icons.edit, color: Colors.grey),
              title: Text(
                'Edit this event',
                style: TextStyle(color: Colors.black),
              ),
            )),
        const PopupMenuItem<int>(
            value: 4,
            child: ListTile(
              leading: Icon(Icons.delete, color: Colors.grey),
              title: Text(
                'Delete This Event',
                style: TextStyle(color: Colors.black),
              ),
            ))
      ],
    );
  }

  Widget eventFab() {
    return FloatingActionButton(
        backgroundColor: UIData.secondaryColor,
        child: Icon(
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
