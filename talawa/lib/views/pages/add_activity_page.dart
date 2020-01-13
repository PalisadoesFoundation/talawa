import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:talawa/views/widgets/common_scaffold.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:talawa/views/widgets/forms/add_activity_form.dart';
import 'package:talawa/views/widgets/user_tile.dart';
import 'package:intl/intl.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/model/activity.dart';

class AddActivityPage extends StatefulWidget {
  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  static final ActivityController activityController = new ActivityController();
  final controller = PageController(
    initialPage: 0,
  );
  static bool _progressBarState = false;
  static bool _nameFlag = true;
  static bool _datetimeFlag = true;
  static bool _descriptionFlag = true;
  static final TextEditingController _nameController = TextEditingController();
  static final TextEditingController _datetimeController =
      TextEditingController();
  static final TextEditingController _descriptionController =
      TextEditingController();
  static final List<int> userIds = [];

  static final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  void initState() {
    super.initState();
  }

  bool validateName(String value) {
    return value.length > 7 ? true : false;
  }

  bool validateDateTime(String value) {
    return value.isNotEmpty ? true : false;
  }

  bool validateDescription(String value) {
    return (value.length >= 7 && value.length < 30) && value.isNotEmpty
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return scaffold();
  }

  scaffold() => CommonScaffold(
    appTitle: 'Add Activity',
    bodyData: AddActivityForm(),
  );
  bodyData() => PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Enter Activity Information',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 50),
                TextFormField(
                  onEditingComplete: () {
                    _nameFlag = validateName(_nameController.text);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      labelText: 'Activity Title*',
                      errorText: _nameFlag
                          ? null
                          : 'Name must be longer than 7 character'),
                  controller: _nameController,
                ),
                SizedBox(height: 30),
                DateTimeField(
                  onEditingComplete: () {
                    _datetimeFlag = validateDateTime(_datetimeController.text);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: 'Date/Time for Activity (${format.pattern})*',
                    errorText: _datetimeFlag
                        ? null
                        : 'Name must be longer than 7 character',
                  ),
                  controller: _datetimeController,
                  format: format,
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.combine(date, time);
                    } else {
                      return currentValue;
                    }
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  onEditingComplete: () {
                    _descriptionFlag =
                        validateDescription(_descriptionController.text);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      labelText: 'Description*',
                      errorText: _descriptionFlag
                          ? null
                          : 'Description must be between 7 and 30 characters long'),
                  controller: _descriptionController,
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Text(
                    'Select Users',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  FutureBuilder<List<User>>(
                      future: activityController.getUsers(),
                      builder: (_context, snapshot) {
                        return snapshot.hasData
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (_context, index) {
                                  User user = snapshot.data[index];
                                  return Column(
                                    children: <Widget>[
                                      UserTile(user: user, userIds: userIds)
                                    ],
                                  );
                                },
                              )
                            : Center(child: CircularProgressIndicator());
                      }),
                  new RaisedButton(
                    child: new Text(
                      'Save details',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        _progressBarState = true;
                      });
                      if (validateName(_nameController.text) &&
                          validateDateTime(_datetimeController.text) &&
                          validateDescription(_descriptionController.text)) {
                        // activityController
                        //     .postActivity(
                        //       context,
                        //       Activity(
                        //           title: _nameController.text,
                        //           date: _datetimeController.text,
                        //           description: _descriptionController.text),
                        //       userIds,
                        //     )
                        //     .then((result) {});
                        _nameController.text = '';
                        _datetimeController.text = '';
                        _descriptionController.text = '';
                        userIds.removeRange(0, userIds.length);
                      } else {
                        showAlertDialog(context, 'Validation',
                            'Check if the required fields are valid', 'Close');
                        setState(() {
                          if (_progressBarState) _progressBarState = false;
                        });
                      }
                    },
                    color: Colors.blue,
                  )
                ],
              ))
        ],
      );
}
