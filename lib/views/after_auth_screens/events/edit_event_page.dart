// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/edit_events_form.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/date_time_picker.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';

/// EditEventPage returns a widget that has mutable state _EditEventPageState.
class EditEventPage extends StatefulWidget {
  const EditEventPage({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  _EditEventPageState createState() => _EditEventPageState();
}

/// _EditEventPageState returns a widget to edit the
/// event that is being posted by the current user.
class _EditEventPageState extends State<EditEventPage> {
  @override
  Widget build(BuildContext context) {
    final TextStyle subtitleTextStyle =
        Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16);
    return BaseView<EditEventViewModel>(
      onModelReady: (model) => model.initialize(widget.event),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            // returns a header for the page.
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 1,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                navigationService.pop();
              },
              child: const Icon(Icons.close),
            ),
            // Title of the app bar(header).
            title: Text(
              'Edit Event',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
            actions: [
              // Button for "Done".
              TextButton(
                onPressed: () {
                  model.updateEvent();
                },
                child: Text(
                  'Done',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            // SingleChildScrollView is a box in which a single widget can be scrolled.
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.image,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.036,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Add Image", style: subtitleTextStyle),
                      )
                    ],
                  ),
                  const Divider(),
                  EditEventForm(
                    // EditEventForm returns a widget of a Form for editing the event.
                    // This widget is exported from `lib/views/after_auth_screens/events/edit_events_form.dart`.
                    model: model,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.013,
                  ),
                  const Divider(),
                  Text('Select Start Date and Time', style: subtitleTextStyle),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.013,
                  ),
                  // DateTimeTile is custom widget that returns a tile to select date and time.
                  // You can learn more about DateTimeTile from [here](lib/widgets/date_time_picker.dart).
                  DateTimeTile(
                    // variables and member functions initialisation.
                    date: "${model.eventStartDate.toLocal()}".split(' ')[0],
                    time: model.eventStartTime.format(context),
                    setDate: () async {
                      final date = await customDatePicker(
                        initialDate: model.eventStartDate,
                      );
                      setState(() {
                        model.eventStartDate = date;
                      });
                    },
                    setTime: () async {
                      final time = await customTimePicker(
                        initialTime: model.eventStartTime,
                      );

                      setState(() {
                        model.eventStartTime = time;
                      });
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.026,
                  ),
                  Text(
                    'Select End Date and Time',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.013,
                  ),
                  DateTimeTile(
                    date: "${model.eventEndDate.toLocal()}".split(' ')[0],
                    time: model.eventEndTime.format(context),
                    setDate: () async {
                      final date = await customDatePicker(
                        initialDate: model.eventEndDate,
                      );
                      setState(() {
                        model.eventEndDate = date;
                      });
                    },
                    setTime: () async {
                      final time = await customTimePicker(
                        initialTime: model.eventEndTime,
                      );

                      setState(() {
                        model.eventEndTime = time;
                      });
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.026,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.restore),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.045,
                      ),
                      Text('Does not repeat', style: subtitleTextStyle)
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.026,
                  ),
                  const Divider(),
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Keep Public', style: subtitleTextStyle),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.005,
                            ),
                            Switch(
                              value: model.isPublicSwitch,
                              onChanged: (value) {
                                setState(() {
                                  model.isPublicSwitch = value;
                                  print(model.isPublicSwitch);
                                });
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Keep Registerable',
                              style: subtitleTextStyle,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.005,
                            ),
                            Switch(
                              value: model.isRegisterableSwitch,
                              onChanged: (value) {
                                setState(() {
                                  model.isRegisterableSwitch = value;
                                  print(model.isRegisterableSwitch);
                                });
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
