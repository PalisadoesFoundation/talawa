//flutter packages are called here
import 'package:flutter/material.dart';
//pages are called here
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/views/pages/chat/chat.dart';

class Groups extends StatefulWidget {
  Groups({Key key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  List eventList = [];
  List displayedEvents = [];
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();
  bool fetched = true;
  var events;

  //variable for organization Id
  String _currOrgId;

  //function to get the events
  Future<void> getEvents() async {
    fetched = false;
    final String currentOrgID = await preferences.getCurrentOrgId();
    _currOrgId = currentOrgID;
    Map result = await apiFunctions.gqlquery(Queries().fetchOrgEvents(currentOrgID));
    // print(result);
    eventList = result == null ? [] : result['events'].reversed.toList();
    eventList.removeWhere((element) =>
        element['title'] == 'Talawa Congress' ||
        element['title'] == 'test' ||
        element['title'] == 'Talawa Conference Test' ||
        element['title'] == 'mayhem' ||
        element['title'] == 'mayhem1' ||
        element['isRegistered'] == false ||
        element['organization']['_id'] != currentOrgID); //dont know who keeps adding these
    // This removes all invalid date formats other than Unix time
    eventList.removeWhere((element) => int.tryParse(element['startTime']) == null);
    eventList.sort((a, b) {
      return DateTime.fromMicrosecondsSinceEpoch(int.parse(a['startTime']))
          .compareTo(DateTime.fromMicrosecondsSinceEpoch(int.parse(b['startTime'])));
    });
    // eventsToDates(eventList, DateTime.now());
    setState(() {
      displayedEvents = eventList;
    });
    fetched = true;

    // print('orgID ==== $currentOrgID');
    // print(displayedEvents);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('GROUPS_APP_BAR'),
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            String groupName = 'Event ${index + 1}';
            return Card(
              child: ListTile(
                title: Text(groupName),
                leading: CircleAvatar(
                  backgroundColor: UIData.secondaryColor,
                  child: Image.asset(UIData.talawaLogo),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: Chat(
                      groupName: groupName,
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
