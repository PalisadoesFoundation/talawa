//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//pages are called here
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:intl/intl.dart';
import 'package:talawa/utils/uidata.dart';

// ignore: must_be_immutable
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
  final _formkey = GlobalKey<FormState>();

  //function to add the task
  Future<void> addTask() async {
    String mutation = Queries().addEventTask(
        eventId: widget.eventId,
        title: titleController.text,
        description: descriptionController.text,
        deadline: DateTime.now().millisecondsSinceEpoch.toString());
    Map result = await apiFunctions.gqlquery(mutation);
  }

  //function to select the date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(0),
      title: Text("Add A Task To This Event"),
      content: Container(
          height: 250,
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: inputField('title', titleController, (value) {
                    if (titleController.text == "")
                      return "This Field is Required";
                    if (titleController.text.length > 30)
                      return "title cannot be longer than 30 letters";
                    return null;
                  }, 30),
                ),
                Flexible(
                  child:
                      inputField('description', descriptionController, (value) {
                    if (descriptionController.text == "")
                      return "This Field is Required";
                    if (descriptionController.text.length > 10000)
                      return "description cannot be longer than 10000 letters";
                    return null;
                  }, 10000),
                ),
                Flexible(
                  child: dateButton(),
                ),
              ],
            ),
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
          onPressed: () async {
            if (_formkey.currentState.validate()) {
              addTask();
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }

  //widget to use date button
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

  //widget to use input field
  Widget inputField(String name, TextEditingController controller,
      Function validate, int maxLength) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          validator: validate,
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
