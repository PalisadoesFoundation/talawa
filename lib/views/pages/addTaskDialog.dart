import 'package:flutter/material.dart';

class AddEventTask extends StatefulWidget {
  String eventId;
  AddEventTask({Key key, @required this.eventId}) : super(key: key);

  @override
  _AddEventTaskState createState() => _AddEventTaskState();
}

class _AddEventTaskState extends State<AddEventTask> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add A Task To This Event"),
      content: Column(
        children: <Widget>[
          inputField('title', titleController),
          inputField('description', descriptionController),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Add"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget inputField(String name, TextEditingController controller) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          maxLines: name == 'Description' ? null : 1,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Colors.teal)),
              hintText: name),
        ));
  }
}
