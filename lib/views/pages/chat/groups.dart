//flutter packages are called here
import 'package:flutter/material.dart';

//pages are called here
import 'package:provider/provider.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/services/preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/views/pages/chat/chat.dart';

class Groups extends StatefulWidget {
  const Groups({Key key}) : super(key: key);

  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  List eventList = [];
  List displayedEvents = [];
  Preferences preferences = Preferences();
  ApiFunctions apiFunctions = ApiFunctions();

  //variable to monitor fetching of events
  bool fetched = true;

  // ignore: prefer_typing_uninitialized_variables
  var events;

  //variable for organization Id
  String _currOrgId;

  @override
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
    final Map result =
        await apiFunctions.gqlquery(Queries().fetchOrgEvents(currentOrgID));
    // print(result);
    eventList = result == null
        ? []
        : result['events'].reversed.toList() as List<dynamic>;
    eventList.removeWhere((element) =>
        element['title'] == 'Talawa Congress' ||
        element['title'] == 'test' ||
        element['title'] == 'Talawa Conference Test' ||
        element['title'] == 'mayhem' ||
        element['title'] == 'mayhem1' ||
        element['isRegistered'] == false ||
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
        key: const Key('GROUPS_APP_BAR'),
        title: const Text(
          'Chats',
          style: const TextStyle(color: Colors.white),
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
                    //Text for empty chat groups
                    child: const Text(
                      "Register in an event to start chatting",
                      key: Key('empty_chat_group'),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Spacer(),
                  //Shows spinner while fetching is performed
                  //else shows a refresh text button with icon
                  !fetched
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : TextButton.icon(
                          key: const Key('click_to_refresh_button'),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Click to Refresh..'),
                          onPressed: () {
                            setState(() {
                              try {
                                getEvents();
                              } catch (e) {
                                CustomToast.exceptionToast(msg: e.toString());
                              }
                            });
                          },
                        ),
                ],
              ),
            )
          //Refresh indicator for calling getEvents
          : RefreshIndicator(
              onRefresh: () async {
                try {
                  await getEvents();
                } catch (e) {
                  CustomToast.exceptionToast(msg: e.toString());
                }
              },
              //List of chat groups
              child: ListView.builder(
                  itemCount: displayedEvents.length,
                  itemBuilder: (context, index) {
                    final String groupName =
                        '${displayedEvents[index]['title']}';
                    final String _imgSrc = displayedEvents[index]
                        ['organization']['image'] as String;
                    return Card(
                      child: ListTile(
                        title: Text(groupName),
                        leading: CircleAvatar(
                          backgroundColor: UIData.secondaryColor,
                          child: _imgSrc == null
                              ? Image.asset(UIData.talawaLogo)
                              : NetworkImage(
                                  Provider.of<GraphQLConfiguration>(context)
                                          .displayImgRoute +
                                      _imgSrc) as Widget,
                        ),
                        trailing: const Icon(Icons.arrow_right),
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
}
