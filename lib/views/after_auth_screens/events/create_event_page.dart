import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_form.dart';
import 'package:talawa/widgets/date_time_picker.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TimeOfDay _eventStartTime = TimeOfDay.now();
  TimeOfDay _eventEndTime = TimeOfDay.now();
  DateTime _eventStartDate = DateTime.now();
  DateTime _eventEndDate = DateTime.now();
  bool isPublicSwitch = true;
  bool isRegisterableSwitch = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle _subtitleTextStyle =
        Theme.of(context).textTheme.headline5!.copyWith(fontSize: 16);
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              navigationService.pop();
            },
            child: const Icon(Icons.close)),
        title: Text(
          'Add Event',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Add',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 16),
              )),
        ],
      ),
      body: SingleChildScrollView(
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
                  TextButton(
                      onPressed: () {},
                      child: Text("Add Image", style: _subtitleTextStyle))
                ],
              ),
              const Divider(),
              const CreateEventForm(),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.013,
              ),
              const Divider(),
              Text('Select Start Date and Time', style: _subtitleTextStyle),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.013,
              ),
              DateTimeTile(
                  child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Color(0xff524F4F),
                    size: 19,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.045,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final _date =
                          await customDatePicker(initialDate: _eventStartDate);
                      setState(() {
                        _eventStartDate = _date;
                      });
                    },
                    child: Text(
                      "${_eventStartDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.schedule,
                    color: Color(0xff524F4F),
                    size: 19,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.045,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final _time =
                          await customTimePicker(initialTime: _eventStartTime);

                      setState(() {
                        _eventStartTime = _time;
                      });
                    },
                    child: Text(
                      _eventStartTime.format(context),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.026,
              ),
              Text(
                'Select End Date and Time',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 16),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.013,
              ),
              DateTimeTile(
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Color(0xff524F4F),
                      size: 19,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.045,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final _date =
                            await customDatePicker(initialDate: _eventEndDate);
                        setState(() {
                          _eventEndDate = _date;
                        });
                      },
                      child: Text(
                        "${_eventEndDate.toLocal()}".split(' ')[0],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.schedule,
                      color: Color(0xff524F4F),
                      size: 19,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.045,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final _time =
                            await customTimePicker(initialTime: _eventEndTime);

                        setState(() {
                          _eventEndTime = _time;
                        });
                      },
                      child: Text(
                        _eventEndTime.format(context),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
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
                  Text('Does not repeat', style: _subtitleTextStyle)
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.026,
              ),
              const Divider(),
              Row(
                children: [
                  Text('Keep Public', style: _subtitleTextStyle),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.023,
                  ),
                  Switch(
                    value: isPublicSwitch,
                    onChanged: (value) {
                      setState(() {
                        isPublicSwitch = value;
                      });
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                  const Spacer(),
                  Text('Keep Registerable', style: _subtitleTextStyle),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.023,
                  ),
                  Switch(
                    value: isRegisterableSwitch,
                    onChanged: (value) {
                      setState(() {
                        isRegisterableSwitch = value;
                      });
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
