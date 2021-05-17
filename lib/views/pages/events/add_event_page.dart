import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:talawa/utils/uidata.dart';
import 'package:intl/intl.dart';
import 'package:talawa/view_models/page_view_model/add_event_page_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/pages/events/events.dart';
import 'package:talawa/views/widgets/show_progress.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  //main build starts from here
  @override
  Widget build(BuildContext context) {
    return BaseView<AddEventPageViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Event',
            style: TextStyle(color: Colors.white),
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
            recurrencedropdown(model),
            dateButton(model),
            timeButton('Start Time', model.startEndTimes['Start Time'], model),
            timeButton('End Time', model.startEndTimes['End Time'], model),
          ],
        ),
        floatingActionButton: addEventFab(model),
      ),
    );
  }

  //widget to get the date button
  Widget dateButton(AddEventPageViewModel model) {
    return ListTile(
      onTap: () {
        model.selectDate(context);
      },
      leading: Text(
        'Date',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      trailing: Text(
        '${DateFormat.yMMMd().format(model.dateRange.start)} | ${DateFormat.yMMMd().format(model.dateRange.end)} ',
        style: const TextStyle(fontSize: 16, color: UIData.secondaryColor),
      ),
    );
  }

  //widget to get the time button
  Widget timeButton(String name, DateTime time, AddEventPageViewModel model) {
    return AbsorbPointer(
        absorbing: model.switchVals['All Day'],
        child: ListTile(
          onTap: () {
            model.selectTime(context, name, TimeOfDay.fromDateTime(time));
          },
          leading: Text(
            name,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          trailing: Text(
            TimeOfDay.fromDateTime(time).format(context),
            style: TextStyle(
                color: !model.switchVals['All Day']
                    ? UIData.secondaryColor
                    : Colors.grey),
          ),
        ));
  }

  //widget to add the event
  Widget addEventFab(AddEventPageViewModel model) {
    return FloatingActionButton(
      backgroundColor: UIData.secondaryColor,
      onPressed: () async {
        if (model.titleController.text.isEmpty ||
            model.descriptionController.text.isEmpty ||
            model.locationController.text.isEmpty) {
          if (model.titleController.text.isEmpty) {
            model.setValidateTitle(true);
          }
          if (model.descriptionController.text.isEmpty) {
            model.setValidateDescription(true);
          }
          if (model.locationController.text.isEmpty) {
            model.setValidateLocation(true);
          }
          Fluttertoast.showToast(
              msg: 'Fill in the empty fields',
              backgroundColor: Colors.grey[500]);
        } else {
          showProgress(context, 'Creating New Event . . .',
              isDismissible: false);
          await model.createEvent();
          hideProgress();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Events()),
              (route) => false);
        }
      },
      child: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }

  Widget inputField(String name, TextEditingController controller,
      AddEventPageViewModel model) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          maxLines: name == 'Description' ? null : 1,
          controller: controller,
          decoration: InputDecoration(
              errorText: name == 'Title'
                  ? model.validateTitle
                      ? "Field Can't Be Empty"
                      : null
                  : name == 'Description'
                      ? model.validateDescription
                          ? "Field Can't Be Empty"
                          : null
                      : name == 'Location'
                          ? model.validateLocation
                              ? "Field Can't Be Empty"
                              : null
                          : null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.teal)),
              hintText: name),
        ));
  }

  Widget switchTile(String name, AddEventPageViewModel model) {
    return SwitchListTile(
        activeColor: UIData.secondaryColor,
        value: model.switchVals[name],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          name,
          style: TextStyle(color: Colors.grey[600]),
        ),
        onChanged: (val) {
          model.setSwitchVals(name, val);
        });
  }

  Widget recurrencedropdown(AddEventPageViewModel model) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Text(
        'Recurrence',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      trailing: AbsorbPointer(
        absorbing: !model.switchVals['Recurring'],
        child: DropdownButton<String>(
          style: TextStyle(
              color: model.switchVals['Recurring']
                  ? UIData.secondaryColor
                  : Colors.grey),
          value: model.recurrance,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String newValue) {
            model.setRecurrance(newValue);
          },
          items: model.recurranceList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
