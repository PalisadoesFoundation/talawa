import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/members/memberDetails.dart';
import 'package:talawa/views/pages/members/memberRegEvents.dart';
import 'package:talawa/views/pages/members/userTasks.dart';

class Organizations extends StatefulWidget {
  Organizations({Key key}) : super(key: key);

  @override
  _OrganizationsState createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations> {
  List organizationsList = [];
  List membersList = [];
  int isSelected = 0;
  Preferences preferences = Preferences();

  initState() {
    super.initState();
    getEvents();
  }

  Future<List> getEvents() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    ApiFunctions apiFunctions = ApiFunctions();
    var result =
        await apiFunctions.gqlquery(Queries().fetchOrgById(currentOrgID));
    // print(result);
    setState(() {
      organizationsList = result == null ? [] : result['organizations'];
      membersList = organizationsList[0]['members'];
      membersList.sort((a, b) => a['firstName'].compareTo(b['firstName']));
    });
  }

  //returns a random color based on the user id (1 of 8)
  Color idToColor(String id) {
    int colorint = int.parse(id.replaceAll(RegExp('[a-z]'), ''));
    colorint = (colorint % 18);
    return Color.alphaBlend(
      Colors.black45,
      Colors.primaries[colorint],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Members',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: membersList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: membersList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Color color = idToColor(membersList[index]['_id']);
                  return GestureDetector(
                      onTap: () {
                        pushNewScreen(context,
                            screen: MemberDetail(
                                member: membersList[index], color: color));
                      },
                      child: Card(
                          color: idToColor(membersList[index]['_id']),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: GridTile(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.black12,
                                        child: Icon(
                                          Icons.person,
                                          size: 40,
                                          color: Colors.white70,
                                        )),
                                    Text(
                                      membersList[index]['firstName']
                                              .toString() +
                                          ' ' +
                                          membersList[index]['lastName']
                                              .toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),

                                // trailing: popUpMenue(membersList[index]),
                              ))));
                }));
  }

  Widget popUpMenue(Map member) {
    return PopupMenuButton<int>(
      onSelected: (val) async {
        if (val == 1) {
          pushNewScreen(
            context,
            withNavBar: true,
            screen: UserTasks(),
          );
        } else if (val == 2) {
          pushNewScreen(
            context,
            withNavBar: true,
            screen: RegisterdEvents(),
          );
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
            value: 1,
            child: ListTile(
              leading: Icon(Icons.playlist_add_check),
              title: Text('View Assigned Tasks'),
            )),
        const PopupMenuItem<int>(
            value: 2,
            child: ListTile(
              leading: Icon(Icons.playlist_add_check),
              title: Text('View Registered Events'),
            )),
      ],
    );
  }
}
