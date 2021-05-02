//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//pages are called here
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:intl/intl.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';

// ignore: must_be_immutable
class AddEventTask extends StatefulWidget {
  AddEventTask({Key key, @required this.eventId}) : super(key: key);
  String eventId;

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
    final String mutation = Queries().addEventTask(
        eventId: widget.eventId,
        title: titleController.text,
        description: descriptionController.text,
        deadline: DateTime.now().millisecondsSinceEpoch.toString()) as String;

    final Map<dynamic, dynamic> result = await apiFunctions.gqlquery(mutation);
    if (result["exception"] != null) {
      CustomToast.exceptionToast(msg: "Failed to add task!Try again later");
    }
  }

  //function to select the date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(0),
      title: const Text("Add A Task To This Event"),
      // ignore: sized_box_for_whitespace
      content: Container(
          height: SizeConfig.safeBlockVertical * 37.5,
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: inputField('Title', titleController, (value) {
                    if (titleController.text == "") {
                      return "This Field is Required";
                    }
                    if (titleController.text.length > 30) {
                      return "title cannot be longer than 30 letters";
                    }
                    return null;
                  }, 30),
                ),
                Flexible(
                  child:
                      inputField('Description', descriptionController, (value) {
                    if (descriptionController.text == "") {
                      return "This Field is Required";
                    }
                    if (descriptionController.text.length > 10000) {
                      return "description cannot be longer than 10000 letters";
                    }
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
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            if (_formkey.currentState.validate()) {
              addTask();
              Navigator.of(context).pop();
            }
          },
          child: const Text("Add"),
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
        DateFormat.yMMMd().format(selectedDate),
        style: const TextStyle(fontSize: 16, color: UIData.secondaryColor),
      ),
    );
  }

  //widget to use input field
  Widget inputField(String name, TextEditingController controller,
      String Function(String) validate, int maxLength) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        key: Key(name),
        inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
        validator: validate,
        maxLines: name == 'Description' ? null : 1,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Colors.teal)),
            hintText: name),
      ),
    );
  }
}
