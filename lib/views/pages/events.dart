import 'package:flutter/material.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/views/pages/EventDetailPage.dart';
import 'package:talawa/views/pages/addEventPage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:provider/provider.dart';
import 'package:talawa/controllers/organisation_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/views/pages/editEventDialog.dart';
import 'package:intl/intl.dart';

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
  String currentOrgId = '';
  Preferences preferences = Preferences();
  initState() {
    super.initState();
    getCurrentOrgId();
    getEvents();
  }

  getCurrentOrgId() async {
    final orgId = await preferences.getCurrentOrgId();
    setState(() {
      currentOrgId = orgId;
    });
  }

  Future<void> _deleteEvent(context, eventId) async {
    String mutation = Queries().deleteEvent(eventId);
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlquery(mutation);
    getEvents();
  }

  Future<void> _register(context, eventId) async {
    String mutation = Queries().registerForEvent;
    Map changes = {'id': eventId};
    _gqlMutation(mutation, changes);
  }

  Future<void> _addProject(context, eventId) async {
    String mutation = Queries().addEventProject;
    Map changes = {
      'title': title,
      'description': description,
      'eventId': eventId,
    };
    _gqlMutation(mutation, changes);
  }

  Future<void> _gqlMutation(String mutation, Map changes) async {
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlmutation(mutation);
  }

  Future<List> getEvents() async {
    ApiFunctions apiFunctions = ApiFunctions();
    Map result =
        await apiFunctions.gqlquery(Queries().fetchOrgEvents(currentOrgId));
    setState(() {
      eventList = result == null ? [] : result['events'].reversed.toList();
    });
    print(eventList[0]);
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

  Widget menueText(String text) {
    return ListTile(
        title: Text(
      text,
      style: TextStyle(color: Colors.grey[700]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

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
                child: (ListView.builder(
                  padding: EdgeInsets.only(bottom: 100),
                  itemCount: eventList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: <Widget>[
                        Container(
                          width: width,
                          child: Card(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 0),
                                  child: Theme(
                                      data: ThemeData(
                                          //fix for header color issue
                                          primaryColor: UIData.secondaryColor),
                                      child: ExpansionTile(
                                        children: <Widget>[
                                          eventList[index]['isPublic']
                                              ? menueText(
                                                  'This event is Public')
                                              : menueText(
                                                  'This event is Private'),
                                          eventList[index]['isRegisterable']
                                              ? menueText('You Are Registered')
                                              : menueText(
                                                  'You Are Not Registered'),
                                          // menueText('Date: ' +
                                          //     DateFormat.yMMMd().format(
                                          //         DateTime.parse(
                                          //             eventList[index]
                                          //                 ['date']))),
                                          menueText('Starts: ' +
                                              eventList[index]['startTime']),
                                          ListTile(
                                            trailing: RaisedButton(
                                              color: UIData.secondaryColor,
                                              onPressed: () {
                                                pushNewScreen(
                                                  context,
                                                  withNavBar: true,
                                                  screen: EventDetail(
                                                      event: eventList[index]),
                                                );
                                              },
                                              child: Text(
                                                "More",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: StadiumBorder(),
                                            ),
                                          ),
                                        ],
                                        title: Text(eventList[index]['title']),
                                        subtitle: Text(
                                            eventList[index]['description']),
                                        trailing: popUpMenue(eventList[index]),
                                      )))),
                        ),
                      ],
                    );
                  },
                )),
              ));
  }

  Widget popUpMenue(event) {
    return PopupMenuButton<int>(
      onSelected: (val) async {
        if (val == 1) {
          return _register(context, event['_id']);
        } else if (val == 2) {
          return _addProject(context, event['_id']);
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
              leading: Icon(Icons.playlist_add_check),
              title: Text('Register For Event'),
            )),
        const PopupMenuItem<int>(
            value: 2,
            child: ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Add a Task to this Event'),
            )),
        const PopupMenuItem<int>(
            value: 3,
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit this event'),
            )),
        const PopupMenuItem<int>(
            value: 4,
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete This Event'),
            ))
      ],
    );
  }
}
