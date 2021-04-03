//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//pages are called here
import 'package:provider/provider.dart';
import 'package:talawa/utils/GQLClient.dart';
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
  FToast fToast;

  //variable for organization Id
  String _currOrgId;

  initState() {
    super.initState();
    setState(() {
      events = getEvents();
    });
  }

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
    print(displayedEvents);
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
      body: (_currOrgId == null || displayedEvents.isEmpty)
          ? Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Register in an event to start chatting",
                      key: Key('empty_chat_group'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Spacer(),
                  !fetched
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: const CircularProgressIndicator(),
                          ),
                        )
                      : TextButton.icon(
                          key: Key('click_to_refresh_button'),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Click to Refresh..'),
                          onPressed: () {
                            setState(() {
                              try{
                                getEvents();
                              }catch(e){
                                _exceptionToast(e);
                              }
                            });
                          },
                        ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                try{
                  await getEvents();
                }catch(e){
                  _exceptionToast(e);
                }
              },
              child: ListView.builder(
                  itemCount: displayedEvents.length,
                  itemBuilder: (context, index) {
                    String groupName = '${displayedEvents[index]['title']}';
                    String _imgSrc = displayedEvents[index]['organization']['image'];
                    return Card(
                      child: ListTile(
                        title: Text(groupName),
                        leading: CircleAvatar(
                          backgroundColor: UIData.secondaryColor,
                          child: _imgSrc == null ? 
                                    Image.asset(UIData.talawaLogo):
                                    NetworkImage(
                                        Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                                          _imgSrc
                                    ),
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
            ),
    );
  }

  //function to show exceptions
  _exceptionToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
    );
  }
}
