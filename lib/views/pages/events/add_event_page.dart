import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/services/app_localization.dart';

import 'package:intl/intl.dart';
import 'package:talawa/view_models/page_view_model/add_event_page_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/pages/events/events.dart';
import 'package:talawa/views/widgets/event_widgets.dart';
import 'package:talawa/views/widgets/show_progress.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final EventWidgets _eventWidgets = EventWidgets();

  //main build starts from here
  @override
  Widget build(BuildContext context) {
    return BaseView<AddEventPageViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).translate('New Event'),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 100),
          children: <Widget>[
            inputField('Title', model.titleController, model),
            inputField('Description', model.descriptionController, model),
            inputField('Location', model.locationController, model),
            switchTile('Make Public', model),
            switchTile('Make Registerable', model),
            switchTile('Recurring', model),
            switchTile('All Day', model),
            _eventWidgets.recurrenceDropdown(
              recurringSwitchVal: model.switchVals['Recurring'],
              context: context,
              recurranceList: model.recurranceList,
              recurrance: model.recurrance,
              onChanged: (String newValue) {
                model.setRecurrance(newValue);
              },
            ),
            //widget to get the date button
            _eventWidgets.dateButton(
              context: context,
              dateText:
                  '${DateFormat.yMMMd().format(model.dateRange.start)} | ${DateFormat.yMMMd().format(model.dateRange.end)} ',
              onTap: () {
                model.selectDate(context);
              },
            ),
            // dateButton(model),
            timeButton('Start Time', model.startEndTimes['Start Time'], model),
            timeButton('End Time', model.startEndTimes['End Time'], model),
          ],
        ),
        floatingActionButton: _eventWidgets.addEventFab(
          onPressed: () async {
            bool isEmpty = false;
            if (model.titleController.text.isEmpty) {
              model.setValidateTitle(true);
              isEmpty = true;
            }
            if (model.descriptionController.text.isEmpty) {
              model.setValidateDescription(true);
              isEmpty = true;
            }
            if (model.locationController.text.isEmpty) {
              model.setValidateLocation(true);
              isEmpty = true;
            }
            if (isEmpty) {
              Fluttertoast.showToast(
                  msg: 'Fill in the empty fields',
                  backgroundColor: Colors.grey[500]);
              return;
            }

            showProgress(context,
                '${AppLocalizations.of(context).translate("Creating New Event")} . . .',
                isDismissible: false);
            await model.createEvent();
            hideProgress();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Events()),
                (route) => false);
          },
        ),
      ),
    );
  }

  //widget to get the time button
  Widget timeButton(String name, DateTime time, AddEventPageViewModel model) {
    return _eventWidgets.timeButton(
      context: context,
      name: AppLocalizations.of(context).translate('Start Time'),
      timeText: TimeOfDay.fromDateTime(time).format(context),
      allDaySwitchVal: model.switchVals['All Day'],
      onTap: () {
        model.selectTime(context, name, TimeOfDay.fromDateTime(time));
        debugPrint(time.toString());
      },
    );
  }

  Widget inputField(String name, TextEditingController controller,
      AddEventPageViewModel model) {
    return _eventWidgets.inputField(
      context: context,
      name: name,
      controller: controller,
      errorText: name == 'Title'
          ? model.validateTitle
              ? "Field Can't Be Empty"
              : null
          : name == 'Description'
              ? model.validateDescription
                  ? AppLocalizations.of(context)
                      .translate("Field Can't Be Empty")
                  : null
              : name == 'Location'
                  ? model.validateLocation
                      ? AppLocalizations.of(context)
                          .translate("Field Can't Be Empty")
                      : null
                  : null,
    );
  }

  Widget switchTile(String name, AddEventPageViewModel model) {
    return _eventWidgets.switchTile(
      context: context,
      name: name,
      switchValue: model.switchVals[name],
      onChanged: (val) {
        model.setSwitchVals(name, val);
      },
    );
  }
}
