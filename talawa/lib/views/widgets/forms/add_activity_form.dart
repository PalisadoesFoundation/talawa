import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/vm_add_activity.dart';
import 'package:intl/intl.dart';

import '../user_tile.dart';

class AddActivityForm extends StatefulWidget {
  @override
  AddActivityFormState createState() {
    return AddActivityFormState();
  }
}

class AddActivityFormState extends State<AddActivityForm> {
  final _formKey = GlobalKey<FormState>();
  AddActivityViewModel model = new AddActivityViewModel(admin: 1, users: []);
  PageController _pageController = PageController(initialPage: 0);
  ActivityController _activityController = new ActivityController();
  bool _progressBarState = false;
  bool activityValidateFlag = false;
  String userListErrorText = '';
  static final format = DateFormat("yyyy-MM-dd HH:mm");

  String _validateTitle(String value) {
    if (value.length < 4) {
      return 'Title must be at least 4 characters.';
    }

    return null;
  }

  String _validateDateTime(DateTime value) {
    if (value == null) {
      return 'Date field must not be left blank.';
    }

    return null;
  }

  String _validateDescription(String value) {
    if (value.length < 5 || value.length > 50) {
      return 'Description field must range between\n 5 and 30 characters';
    }

    return null;
  }

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  gotoActivityInfo() {
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 600),
      curve: Curves.bounceOut,
    );
  }

  gotoUserInfo() {
    _pageController.animateToPage(
      1,
      duration: Duration(milliseconds: 600),
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: _pageController,
        // physics:new NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        children: <Widget>[activityInfo(), userInfo()]);
  }

  activityInfo() => Center(
      child: Container(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
              constraints: BoxConstraints(
                  maxWidth: 300.0, minWidth: 250.0, minHeight: 350.0),
              child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Enter Activity Information',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            validator: (value) {
                              return _validateTitle(value);
                            },
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              prefixIcon: Icon(Icons.title),
                              labelText: "Title",
                              alignLabelWithHint: true,
                              hintText: 'Juan\'s Wedding Rehersal',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onSaved: (value) {
                              model.title = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DateTimeField(
                            validator: (value) {
                              return _validateDateTime(value);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              labelText: 'Date/Time*',
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
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
                            onSaved: (value) {
                              model.datetime = value.toString();
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              return _validateDescription(value);
                            },
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              prefixIcon: Icon(Icons.text_fields),
                              labelText: "Description",
                              focusColor: UIData.quitoThemeColor,
                            ),
                            onSaved: (value) {
                              model.description = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            width: 150,
                            child: RaisedButton(
                              padding: EdgeInsets.all(12.0),
                              shape: StadiumBorder(),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Next",
                                  ),
                                  Icon(Icons.expand_more)
                                ],
                              ),
                              color: Colors.white,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  activityValidateFlag = true;
                                  gotoUserInfo();
                                }
                              },
                            ),
                          ),
                        ],
                      ))))));

  userInfo() => Container(
      margin: EdgeInsets.all(30),
      child: SingleChildScrollView(child: Column(
        children: <Widget>[
          Text(
            'Select Users',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 30),
          FutureBuilder<List<User>>(
              future: _activityController.getAvailableUsers(1),
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
                              UserTile(user: user, userIds: model.users)
                            ],
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              }),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            width: 180,
            child: RaisedButton(
              padding: EdgeInsets.all(12.0),
              shape: StadiumBorder(),
              child: _progressBarState
                  ? const CircularProgressIndicator()
                  : Text(
                      'Save details',
                    ),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  toggleProgressBarState();
                  if (!activityValidateFlag) {
                    gotoActivityInfo();
                  }
                  else {
                    _activityController.postActivity(context, model);
                  } 
                  toggleProgressBarState();
                });
              },
            ),
          ),
        ],
      ),));
}
