import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/controllers/organisation_controller.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/memberDetails.dart';
import 'package:talawa/views/pages/memberRegEvents.dart';
import 'package:talawa/views/pages/userTasks.dart';

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
    print(result);
    setState(() {
      organizationsList = result == null ? [] : result['organizations'];
      membersList = organizationsList[0]['members'];
    });
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
          : ListView.builder(
              itemCount: membersList.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(membersList[index]['firstName'].toString() +
                      ' ' +
                      membersList[index]['lastName'].toString()),
                  subtitle: Text(membersList[index]['email'].toString()),
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white54,
                    ),
                    backgroundColor: UIData.secondaryColor,
                  ),
                  trailing: popUpMenue(membersList[index]),
                  onTap: () {
                    pushNewScreen(
                      context,
                      withNavBar: true,
                      screen: MemberDetail(member: membersList[index]),
                    );
                    ;
                  },
                ));
              },
            ),
    );
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
