//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//pages are called here
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/widgets/loading.dart';

// ignore: must_be_immutable
class UserTasks extends StatefulWidget {
  UserTasks({
    Key key,
    @required this.member,
  }) : super(key: key);

  Map member;

  @override
  _UserTasksState createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> {
  Preferences preferences = Preferences();

  ApiFunctions apiFunctions = ApiFunctions();
  List userTasks;

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  //getting user details
  getUserDetails() async {
    final String userID = widget.member['_id'].toString();
    final Map result =
        await apiFunctions.gqlquery(Queries().tasksByUser(userID));
    print(result);
    setState(() {
      userTasks = result == null ? [] : result['tasksByUser'] as List;
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    } else {
      return;
    }
  }

  //main building starts here
  @override
  Widget build(BuildContext context) {
    return userTasks == null
        ? Container(
            key: const Key("User Task Loading"),
            child: const Center(
              child: Loading(),
            ),
          )
        : userTasks.isNotEmpty
            ? Container(
                key: const Key("User Task Exists"),
                child: ListView.builder(
                    itemCount: userTasks.length,
                    itemBuilder: (context, index) {
                      String title = "Title: ${userTasks[index]["title"]}";
                      title += userTasks[index]["event"] != null
                          ? '\nEvent: ${userTasks[index]["event"]["title"]}'
                          : "";
                      String description =
                          userTasks[index]["description"].toString();
                      description += userTasks[index]["deadline"] != null
                          ? ' \nDue Date: ${DateFormat("dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(int.parse(userTasks[index]["deadline"].toString())))}'
                          : '\nDue Date: N/A';
                      return Card(
                          child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              title,
                            ),
                            subtitle: Text(
                              'Description: $description',
                            ),
                            contentPadding: EdgeInsets.fromLTRB(
                                SizeConfig.safeBlockHorizontal * 2,
                                SizeConfig.safeBlockVertical,
                                SizeConfig.safeBlockHorizontal * 2,
                                SizeConfig.safeBlockVertical),
                          ),
                        ],
                      ));
                    }))
            : Container(
                key: const Key("User Task Not Exists"),
                child: const Center(
                  child: Text(
                    "No Tasks found",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
  }
}
