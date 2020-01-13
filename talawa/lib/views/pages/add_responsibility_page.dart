import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talawa/controllers/responsibility_controller.dart';
import 'package:talawa/model/responsibility.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:talawa/views/widgets/common_scaffold.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:talawa/views/widgets/user_tile.dart';
import 'package:intl/intl.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/model/activity.dart';

class AddResponsibilityPage extends StatefulWidget {
  @override
  _AddResponsibilityPageState createState() => _AddResponsibilityPageState();
}

class _AddResponsibilityPageState extends State<AddResponsibilityPage> {
  int activityId;
  static final ResponsibilityController responsibilityController =
      new ResponsibilityController();
  final controller = PageController(
    initialPage: 0,
  );
  static Future<List<User>> _userList;
  static bool _progressBarState = false;
  static bool _nameFlag = true;
  static bool _datetimeFlag = true;
  static bool _descriptionFlag = true;
  static final TextEditingController _nameController = TextEditingController();
  static final TextEditingController _datetimeController =
      TextEditingController();
  static final TextEditingController _descriptionController =
      TextEditingController();
  static int userId = 0;

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
    activityId = ModalRoute.of(context).settings.arguments;
    _userList = fetchUsersByActivity(activityId);
    return scaffold();
  }

  Future<List<User>> fetchUsersByActivity(int activityId) async {
    return responsibilityController.getUsersByActivity(activityId);
  }

  scaffold() => CommonScaffold(
        appTitle: 'Add Responsibility',
        bodyData: bodyData(),
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
                  'Enter Responsibility Information',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 50),
                TextFormField(
                  onEditingComplete: () {
                    _nameFlag = validateName(_nameController.text);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      labelText: 'Name*',
                      errorText: _nameFlag
                          ? null
                          : 'DateTime field must not be empty'),
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
                          : 'DateTime field must not be empty'),
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
                    'Assign a User',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  FutureBuilder<List<User>>(
                      future: _userList,
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
                                      Radio(
                                        value: user.id,
                                        groupValue: userId,
                                        onChanged: (int value) {
                                          setState(() {
                                            userId = value;
                                          });
                                        },
                                      ),
                                      UserTile(user: user),
                                    ],
                                  );
                                },
                              )
                            : Center(child: CircularProgressIndicator());
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  new RaisedButton(
                    shape: StadiumBorder(),
                    child: _progressBarState
                        ? const CircularProgressIndicator()
                        : new Text(
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
                        responsibilityController
                            .postResponsibility(
                                context,
                                Responsibility(
                                    name: _nameController.text,
                                    date: _datetimeController.text,
                                    description: _descriptionController.text,
                                    priority: 1,
                                    isCompleted: false),
                                activityId,
                                userId)
                            .then((result) {
                          setState(() {
                            if (_progressBarState) _progressBarState = false;
                          });
                        });
                        _nameController.text = '';
                        _datetimeController.text = '';
                        _descriptionController.text = '';
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
