import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/model/activity.dart';
import 'package:talawa/utils/validator.dart';
import 'package:intl/intl.dart';

class EditActivityForm extends StatelessWidget {
  int activityId;
  final _formKey = GlobalKey<FormState>();
  Activity oldModel;
  Activity newModel = new Activity();
  static final format = DateFormat("yyyy-MM-dd HH:mm");
  EditActivityForm({this.activityId});
  @override
  build(BuildContext context) {
    return AlertDialog(
        content: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Consumer<ActivityController>(
                  builder: (context, controller, child) {
                    return FutureBuilder(
                      future: controller.getActivity(context, activityId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          oldModel = snapshot.data;
                          return Column(
                            children: <Widget>[
                              Text(
                                'Edit',
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                initialValue: oldModel.title,
                                validator: (value) =>
                                    Validator.validateTitle(value),
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Title",
                                  alignLabelWithHint: true,
                                  hintText: 'Bridal Appointment',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                onSaved: (value) {
                                  newModel.title = value;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DateTimeField(
                                initialValue: oldModel.datetime,
                                validator: (value) =>
                                    Validator.validateDateTime(value),
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
                                      initialDate:
                                          currentValue ?? DateTime.now(),
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
                                  newModel.datetime = value;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                initialValue: oldModel.description,
                                validator: (value) =>
                                    Validator.validateDescription(value),
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Description",
                                  alignLabelWithHint: true,
                                  hintText: 'More detailed information',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                onSaved: (value) {
                                  newModel.description = value;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 30.0),
                                width: double.infinity,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(12.0),
                                  shape: StadiumBorder(),
                                  child: Text(
                                    "Submit",
                                  ),
                                  color: Colors.white,
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();
                                    print('checking');
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      await controller.updateActivity(
                                          context, oldModel, newModel);
                                    }
                                  },
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  },
                ))));
  }
}
