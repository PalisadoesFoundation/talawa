import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:intl/intl.dart';
import 'package:talawa/utils/uidata.dart';

class AddEventTask extends StatefulWidget {
  String eventId;
  AddEventTask({Key key, @required this.eventId}) : super(key: key);

  @override
  _AddEventTaskState createState() => _AddEventTaskState();
}

class _AddEventTaskState extends State<AddEventTask> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  ApiFunctions apiFunctions = ApiFunctions();
  DateTime selectedDate = DateTime.now();

  Future<void> addTask() async {
    String mutation = Queries().addEventTask(
        eventId: widget.eventId,
        title: titleController.text,
        description: descriptionController.text,
        deadline: DateTime.now().millisecondsSinceEpoch.toString());
    Map result = await apiFunctions.gqlquery(mutation);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(0),
      title: Text("Add A Task To This Event"),
      content: Container(
          height: 250,
          child: Column(
            children: <Widget>[
              inputField('title', titleController),
              inputField('description', descriptionController),
              dateButton()
            ],
          )),
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
            addTask();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget dateButton() {
    return ListTile(
      onTap: () {
        _selectDate(context);
      },
      leading: Text(
        'Date',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      trailing: Text(
        '${DateFormat.yMMMd().format(selectedDate)}',
        style: TextStyle(fontSize: 16, color: UIData.secondaryColor),
      ),
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
