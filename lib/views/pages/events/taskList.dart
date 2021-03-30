//flutter packages are imported here
import 'package:flutter/material.dart';

//pages are imported here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFuctions.dart';

// ignore: must_be_immutable
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

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  //function to get the task list
  // ignore: always_declare_return_types
  getTasks() async {
    final String userID = widget.event['_id'];
    var result = await apiFunctions.gqlquery(Queries().getTasksByEvent(userID));
    setState(() {
      eventTasks = result == null ? [] : result['tasksByEvent'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return eventTasks.isNotEmpty
        ? ListView.builder(
            itemCount: eventTasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(eventTasks[index]['description']),
              );
            })
        : Container(
            child: Center(
                child: Text(
              'No Tasks found',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )),
          );
  }
}
