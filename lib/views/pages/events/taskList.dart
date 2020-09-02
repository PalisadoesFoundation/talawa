import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';

class TaskList extends StatefulWidget {
  Map event;
  TaskList({
    Key key,
    @required this.event,
  }) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Preferences preferences = Preferences();

  ApiFunctions apiFunctions = ApiFunctions();
  List eventTasks = [];

  void initState() {
    super.initState();
    getTasks();
  }

  getTasks() async {
    final String userID = widget.event['_id'];
    Map result = await apiFunctions.gqlquery(Queries().getTasksByEvent(userID));
    // print(result);
    setState(() {
      eventTasks = result == null ? [] : result['tasksByEvent'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: eventTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(eventTasks[index]['desctription']),
          );
        });
  }
}
