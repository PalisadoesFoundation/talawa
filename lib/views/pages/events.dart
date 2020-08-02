import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/views/pages/addEventPage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


import 'package:provider/provider.dart';
import 'package:talawa/controllers/organisation_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';


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
  String orgId = '';

  initState() {
    super.initState();
    getEvents();
  }

  Future<void> _deleteEvent(context, eventId) async {
    String mutation = Queries().deleteEvent;
    Map<String, dynamic> changes = {'id': eventId};
    _gqlMutation(mutation, changes);
  }

  Future<void> _register(context, eventId) async {
    String mutation = Queries().registerForEvent;
    Map changes = {'id': eventId};
    _gqlMutation( mutation, changes);
  }

  Future<void> _addProject(context, eventId) async {
    String mutation = Queries().addEventProject;
    Map changes = {'title':title,'description':description,'eventId':eventId,};
    _gqlMutation(mutation,  changes);
  }


  Future<void> _gqlMutation(String mutation, Map changes) async {
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlmutation(mutation);
  }

  Future<List> getEvents() async {
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlquery(Queries().fetchEvents);
    setState(() {
      eventList = result == null ? [] :result['events'];
    });
  }

  Future<void> _editEvent(context, eventId) async {
  }

  Widget menueText(String text){
    return ListTile(
      title: Text(text,
    style: TextStyle(
      color: Colors.grey[700]

    ),
    ));
  }





  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final OrgController org = Provider.of<OrgController>(context);
    // orgId = org.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      floatingActionButton: FloatingActionButton(
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
      body: eventList.isEmpty ? Center(child: CircularProgressIndicator()) : 
      RefreshIndicator(
        onRefresh: () async {
          getEvents();
        },
        child: (ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Container(
                width: width,
                child: Card(
                   child: Padding(
                     padding: EdgeInsets.only(left: 20, right: 0),
                     child: ExpansionTile(
                  children: <Widget>[
                    eventList[index]['isPublic']?menueText('Public'): menueText('Private'),
                    eventList[index]['isRegisterable']?menueText('Registered'):menueText('Not Registered'),
                  ],
                  title: Text(eventList[index]['title']),
                  subtitle: Text(eventList[index]['description']),
                  trailing: popUpMenue(eventList[index]['_id']),
                ))),
              ),
            ],
          );
        },
      )),
    ));
  }

  Widget popUpMenue(eventId) {
    return PopupMenuButton<int>(
      onSelected: (val) async {
        if (val == 1) {
          return _register(context, eventId);
        } else if (val == 2) {
          return _addProject(context, eventId);
        } else if (val == 3) {
          return _editEvent(context, eventId);
        } else if (val == 4) {
          return _deleteEvent(context, eventId);
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
              title: Text('Add a Project to this Event'),
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
