import 'package:flutter/material.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/events/EventDetailPage.dart';
import 'package:talawa/views/pages/events/addEventPage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/views/pages/events/addTaskDialog.dart';
import 'package:talawa/views/pages/events/editEventDialog.dart';

import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Events extends StatefulWidget {
  Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List eventList = [];
  int selectedIndex = 0;
  String title = '';
  String description = '';
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  AutoScrollController _scrollController;

  initState() {
    super.initState();
    getEvents();
  }

  Future _scrollToIndex(index) async {
    setState(() {});

    _scrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
  }

  Future<void> _deleteEvent(context, eventId) async {
    String mutation = Queries().deleteEvent(eventId);
    Map result = await apiFunctions.gqlquery(mutation);
    getEvents();
  }

  Future<void> _register(context, eventId) async {
    String mutation = Queries().registerForEvent(eventId);
    Map result = await apiFunctions.gqlmutation(mutation);
  }

  Future<List> getEvents() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    Map result =
        await apiFunctions.gqlquery(Queries().fetchOrgEvents(currentOrgID));
    setState(() {
      eventList = result == null ? [] : result['events'].reversed.toList();
    });
  }

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
        floatingActionButton: FloatingActionButton(
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
            }),
        body: eventList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  getEvents();
                },
                child: (Timeline.builder(
                  controller: _scrollController,
                  position: TimelinePosition.Left,
                  itemCount: eventList.length,
                  itemBuilder: (context, index) {
                    return TimelineModel(eventCard(index),
                        position: TimelineItemPosition.right);
                  },
                )),
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
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      _scrollController.scrollToIndex(index,
                          preferPosition: AutoScrollPosition.begin);
                    },
                    child: ExpansionTile(
                      children: <Widget>[
                        eventList[index]['isPublic']
                            ? menueText('This event is Public')
                            : menueText('This event is Private'),
                        eventList[index]['isRegisterable']
                            ? menueText('You Are Registered')
                            : menueText('You Are Not Registered'),
                        // menueText('Date: ' +
                        //     DateFormat.yMMMd().format(
                        //         DateTime.parse(
                        //             eventList[index]
                        //                 ['date']))),
                        menueText('Starts: ' + eventList[index]['startTime']),
                        ListTile(
                          trailing: RaisedButton(
                            color: UIData.secondaryColor,
                            onPressed: () {
                              pushNewScreen(
                                context,
                                withNavBar: true,
                                screen: EventDetail(event: eventList[index]),
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
                        eventList[index]['title'],
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        eventList[index]['description'],
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: popUpMenue(eventList[index]),
                    ))),
          ],
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
    ;
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
}
