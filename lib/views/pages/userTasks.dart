import 'package:flutter/material.dart';

class UserTasks extends StatefulWidget {
  UserTasks({Key key}) : super(key: key);

  @override
  _UserTasksState createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'This Users Tasks',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
                child: Column(
              children: <Widget>[
                ListTile(
                  leading: Text('Description:'),
                ),
                ListTile(
                  leading: Text('Due Date:'),
                )
              ],
            ));
          }),
    );
  }
}
