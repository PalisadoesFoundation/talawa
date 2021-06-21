//flutter packages are imported here
import 'package:flutter/material.dart';
import 'package:talawa/model/events.dart';
import 'package:talawa/services/app_localization.dart';

//pages are imported here
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/api_functions.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key key,
    @required this.event,
  }) : super(key: key);

  final EventsModel event;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Preferences preferences = Preferences();

  ApiFunctions apiFunctions = ApiFunctions();
  List eventTasks;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  //function to get the task list
  Future<List<dynamic>> getTasks() async {
    final String userID = widget.event.id.toString();

    final Map result = await apiFunctions.gqlquery(
      Queries().getTasksByEvent(
        userID,
      ),
    );

    eventTasks = result == null ? [] : result['tasksByEvent'] as List;
    return eventTasks;
  }

  @override
  Widget build(BuildContext context) {
    final task = getTasks();
    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: task,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data.isEmpty) {
            return Container(
              child: Center(
                child: Text(
                  AppLocalizations.of(context).translate("No Tasks found"),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      snapshot.data[index]['title'].toString(),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
