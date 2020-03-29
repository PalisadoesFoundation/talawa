import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/responsibility_controller.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:intl/intl.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/view_models/vm_add_responsibility.dart';

class AddResponsibilityForm extends StatefulWidget {
  final int activityId;
  const AddResponsibilityForm({Key key, this.activityId}) : super(key: key);
  @override
  AddResponsibilityFormState createState() => AddResponsibilityFormState();
}

class AddResponsibilityFormState extends State<AddResponsibilityForm> {
  final _formKey = GlobalKey<FormState>();
  AddResponsibilityViewModel model = new AddResponsibilityViewModel();
  PageController _pageController = PageController(initialPage: 0);
  Validator val = new Validator();
  bool _progressBarState = false;
  String userListErrorText = '';
  static final format = DateFormat("yyyy-MM-dd HH:mm");

  void toggleProgressBarState() {
    _progressBarState = !_progressBarState;
  }

  gotoResponsibilityInfo() {
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
    return Form(
        key: _formKey,
        autovalidate: true,
        child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            pageSnapping: true,
            onPageChanged: (page) {
              if (!_formKey.currentState.validate())
                gotoResponsibilityInfo();
              else
                _formKey.currentState.save();
            },
            children: <Widget>[respInfo(), userInfo()]));
  }

  respInfo() => Center(
      child: Container(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
              constraints: BoxConstraints(
                  maxWidth: 300.0, minWidth: 250.0, minHeight: 350.0),
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Text(
                    'Enter Responsibility Information',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    validator: (value) {
                      return val.validateTitle(value);
                    },
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      prefixIcon: Icon(Icons.title),
                      labelText: "Title",
                      alignLabelWithHint: true,
                      hintText: 'Organize bridal arrangements',
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
                      return val.validateDateTime(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      labelText: 'Due Date/Time*',
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
                      return val.validateDescription(value);
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
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          model.activityId = widget.activityId;
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
            Consumer<ResponsibilityController>(builder: (context, controller, child) {
              return FutureBuilder<List<User>>(
                  future: controller.getUsersByActivity(context, widget.activityId),
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
                                  RadioListTile(
                                    title: Text(user.email),
                                    value: user.id,
                                    groupValue: model.userId,
                                    onChanged: (int value) {
                                      setState(() {
                                        model.userId = value;
                                      });
                                    },
                                  )
                                ],
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  });
            }),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                width: 180,
                child: Consumer<ResponsibilityController>(builder: (context, controller, child) {
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
                      setState(() {
                        toggleProgressBarState();
                        if (_formKey.currentState.validate())
                          Provider.of<ResponsibilityController>(context, listen: false).postResponsibility(context, model);
                        else
                          gotoUserInfo();
                        toggleProgressBarState();
                      });
                    },
                  );
                })),
          ],
        ),
      ));
}
