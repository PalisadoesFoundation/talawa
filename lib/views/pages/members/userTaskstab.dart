//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//pages are called here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';

// ignore: must_be_immutable
class UserTasks extends StatefulWidget {
  Map member;

  UserTasks({
    Key key,
    @required this.member,
  }) : super(key: key);

  @override
  _UserTasksState createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> {
  Preferences preferences = Preferences();

  ApiFunctions apiFunctions = ApiFunctions();
  List userTasks = [];

  void initState() {
    super.initState();
    getUserDetails();
  }

  //getting user details
  getUserDetails() async {
    final String userID = widget.member['_id'];
    Map result = await apiFunctions.gqlquery(Queries().tasksByUser(userID));
    // print(result);
    setState(() {
      userTasks = result == null ? [] : result['tasksByUser'];
    });
  }

  //main building starts here
  @override
  Widget build(BuildContext context) {
    return userTasks.length != 0
        ? Container(
            child: ListView.builder(
                itemCount: userTasks.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Text(
                            'Description: ${userTasks[index]["description"]}'),
                      ),
                      userTasks[index]["deadline"] != null
                          ? ListTile(
                              leading: Text(
                                  'Due Date: ${DateFormat("dd-MM-yyyy").format((DateTime.fromMillisecondsSinceEpoch(int.parse(userTasks[index]["deadline"]))))}'),
                            )
                          : ListTile(
                              leading: Text('Due Date: N/A'),
                            )
                    ],
                  ));
                }))
        : Container(
            child: Center(
                child: Text(
              "No Tasks found",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )),
          );
  }
}
