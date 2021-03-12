import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/note_controller.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_add_activity.dart';
import 'package:intl/intl.dart';
import 'package:talawa/views/widgets/checkbox_user_tile.dart';

class AddActivityForm extends StatelessWidget {
  AddActivityViewModel model = new AddActivityViewModel(users: []);
  BuildContext _context;
  final _formKey = GlobalKey<FormState>();
  PageController _pageController = PageController(initialPage: 0);
  bool _progressBarState = false;
  static final format = DateFormat("yyyy-MM-dd HH:mm");

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
    _context = context;
    return Form(
        key: _formKey,
        autovalidate: true,
        child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            pageSnapping: true,
            onPageChanged: (page) {
              if (!_formKey.currentState.validate())
                gotoActivityInfo();
              else
                _formKey.currentState.save();
            },
            children: <Widget>[activityInfo(), userInfo()]));
  }

  activityInfo() => Center(
      child: Container(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
              constraints: BoxConstraints(
                  maxWidth: 300.0, minWidth: 250.0, minHeight: 350.0),
              child: SingleChildScrollView(
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
                    validator: (value) => Validator.validateTitle(value),
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
                    validator: (value) => Validator.validateDateTime(value),
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
                    validator: (value) => Validator.validateDescription(value),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: "Description",
                      focusColor: UIData.primaryColor,
                    ),
                    onSaved: (value) {
                      model.description = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                        FocusScope.of(_context).unfocus();
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          gotoUserInfo();
                        }
                      },
                    ),
                  ),
                ],
              )))));

  userInfo() => Container(
      margin: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Select Users',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Consumer2<ActivityController, AuthController>(
              builder: (context, activityController, authController, child) {
                return FutureBuilder<List<User>>(
                    future: activityController.getAvailableUsers(
                        context, authController.currentUserId),
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
                                    CheckboxUserTile(
                                        user: user, userList: model.users)
                                  ],
                                );
                              },
                            )
                          : Center(child: CircularProgressIndicator());
                    });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                width: 180,
                child: Consumer<ActivityController>(
                  builder: (context, controller, child) {
                    return RaisedButton(
                      padding: EdgeInsets.all(12.0),
                      shape: StadiumBorder(),
                      child: _progressBarState
                          ? const CircularProgressIndicator()
                          : Text(
                              'Save details',
                            ),
                      color: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          model.admin = Provider.of<AuthController>(_context,
                                  listen: false)
                              .currentUserId;
                          controller.postActivity(_context, model);
                        } else
                          gotoUserInfo();
                      },
                    );
                  },
                )),
          ],
        ),
      ));
}
