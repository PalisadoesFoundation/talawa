//flutter packages are imported here
import 'package:flutter/material.dart';

//pages are imported here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/apiFunctions.dart';

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

  void initState() {
    super.initState();
    getTasks();
  }

  //function to get the task list
  Future<List<dynamic>> getTasks() async {
    final String userID = widget.event['_id'];
    print("ishan");

    Map result = await apiFunctions.gqlquery(Queries().getTasksByEvent(userID));
    //setState(() {

    //});
    eventTasks = result == null ? [] : result['tasksByEvent'];
    return eventTasks;
  }

  @override
  Widget build(BuildContext context) {
    var task = getTasks();
    return Container(
      child: FutureBuilder<List<dynamic>>(
          future: task,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.data.length == 0) {
              return Container(
                child: Center(
                    child: Text(
                  "No Tasks found",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )),
              );
            } else {
              return SingleChildScrollView(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(snapshot.data[index]['title']),
                      );
                    }),
              );
            }
          }),
    );
  }
}
