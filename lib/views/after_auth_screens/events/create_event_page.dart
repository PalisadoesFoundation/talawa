import 'package:flutter/material.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_form.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/add_members_bottom_sheet.dart';
import 'package:talawa/widgets/date_time_picker.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';
import 'package:talawa/widgets/member_name_tile.dart';
import 'package:talawa/widgets/recurrence_dialog.dart';

/// CreateEventPage returns a widget that has mutable state _CreateEventPageState.
class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

/// _CreateEventPageState returns a widget for a Page to Creatxe the Event in the Organization.
class _CreateEventPageState extends State<CreateEventPage> {
  /// Recurrence label of recurrence selection button.
  String recurrenceLabel = Recurrance.once;
  @override
  Widget build(BuildContext context) {
    final TextStyle subtitleTextStyle =
        Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16);
    final navigationServiceLocal = locator<NavigationService>();
    return BaseView<CreateEventViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        print(model.recurrance);
        return Scaffold(
          // AppBar is the header of the page
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 1,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                // ignore: undefined_method
                navigationServiceLocal.pop();
              },
              child: const Icon(Icons.close),
            ),
            title: Text(
              // text translation to the app language.
              AppLocalizations.of(context)!.strictTranslate('Add Event'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
            actions: [
              TextButton(
                key: const Key('addButton'),
                onPressed: () {
                  if (userConfig.loggedIn) {
                    model.createEvent();
                  } else {
                    navigationService.pop();
                    MainScreenViewModel.scaffoldKey.currentState?.openDrawer();
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.strictTranslate('Add'),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
            ],
          ),
          body: Scrollbar(
            thickness: 2,
            child: SingleChildScrollView(
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
                          key: const Key('txt_btn_cep'),
                          onPressed: () {
                            model.getImageFromGallery();
                          },
                          child: Text(
                            AppLocalizations.of(context)!
                                .strictTranslate("Add Image"),
                            style: subtitleTextStyle,
                          ),
                        ),
                      ],
                    ),
                    // If the image for the event is selected or not null.
                    model.imageFile != null
                        ? Container(
                            // Container for rendering the selected image
                            height: 300,
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Image.file(
                                  model.imageFile!,
                                  fit: BoxFit.fitWidth,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: IconButton(
                                    onPressed: () => model.removeImage(),
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    const Divider(),
                    CreateEventForm(
                      // CreateEventForm returns a widget of a Form for creating events.
                      // This widget is exported from `lib/views/after_auth_screens/events/create_event_form.dart`.
                      model: model,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    const Divider(),
                    Text(
                      // translation of the text to app language.
                      AppLocalizations.of(context)!
                          .strictTranslate('Select Start Date and Time'),
                      style: subtitleTextStyle,
                    ),
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
                        if (date.isBefore(DateTime.now())) {
                          navigationServiceLocal.showSnackBar(
                            "Cannot create events having date prior than today ",
                          );
                        }
                        setState(() {
                          model.eventStartDate = date;
                        });
                      },
                      setTime: () async {
                        print(model.eventStartDate);
                        final time = await customTimePicker(
                          initialTime: model.eventStartTime,
                        );
                        // print(model.eventStartTime);
                        final validationError = Validator.validateEventTime(
                          time,
                          model.eventEndTime,
                        );
                        print('hi');
                        if (validationError != null) {
                          navigationService.showTalawaErrorSnackBar(
                            'Start time must be before end time',
                            MessageType.error,
                          );
                        } else {
                          setState(() {
                            model.eventStartTime = time;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.026,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .strictTranslate('Select End Date and Time'),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    DateTimeTile(
                      key: const Key('key for test cep'),
                      date: "${model.eventEndDate?.toLocal() ?? DateTime.now()}"
                          .split(' ')[0],
                      time: model.eventEndTime.format(context),
                      setDate: () async {
                        final date = await customDatePicker(
                          initialDate: model.eventEndDate ?? DateTime.now(),
                        );
                        final startDate = model.eventStartDate;
                        if (startDate.compareTo(date) < 0) {
                          setState(() {
                            model.eventEndDate = date;
                          });
                        } else {
                          // ignore: undefined_method
                          navigationServiceLocal.showSnackBar(
                            "End Date cannot be after start date ",
                          );
                        }
                      },
                      setTime: () async {
                        final time = await customTimePicker(
                          initialTime: model.eventEndTime,
                        );
                        final validationError = Validator.validateEventTime(
                          model.eventStartTime,
                          time,
                        );
                        final showSnackBar =
                            navigationService.showTalawaErrorSnackBar;
                        if (validationError != null) {
                          showSnackBar(
                            'Start time must be before end time',
                            MessageType.error,
                          );
                        } else {
                          setState(() {
                            model.eventEndTime = time;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.026,
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          const Icon(Icons.restore),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.045,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate(recurrenceLabel),
                            style: subtitleTextStyle,
                          ),
                        ],
                      ),
                      onTap: () async {
                        final String? selectedReccurence;
                        selectedReccurence = await showDialog(
                          context: context,
                          builder: (context) {
                            return ShowRecurrenceDialog(
                              model: model,
                              initialRecurrence: recurrenceLabel,
                            );
                          },
                        );
                        setState(() {
                          recurrenceLabel = selectedReccurence!;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.026),
                    const Divider(),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate('Keep Registerable'),
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate('All day'),
                                style: subtitleTextStyle,
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth! * 0.005,
                              ),
                              Switch(
                                // Switch to select the visibility of the event.
                                value: model.isAllDay,
                                onChanged: (value) {
                                  setState(() {
                                    model.isAllDay = value;
                                    print(model.isAllDay);
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
                                AppLocalizations.of(context)!
                                    .strictTranslate('Keep Public'),
                                style: subtitleTextStyle,
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth! * 0.005,
                              ),
                              Switch(
                                // Switch to select the visibility of the event.
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
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.026),
                    const Divider(),
                    InkWell(
                      key: const Key('inwell_cep2'),
                      onTap: () {
                        EventBottomSheet().addUserBottomSheet(
                          context: context,
                          model: model,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate("Add Members"),
                            style: subtitleTextStyle,
                          ),
                          Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      children: model.selectedMembers
                          .map(
                            (user) => MemberNameTile(
                              userName: "${user.firstName!} ${user.lastName!}",
                              userImage: user.image,
                              onDelete: () {
                                model.removeUserFromList(
                                  userId: user.id!,
                                );
                              },
                            ),
                          )
                          .toList()
                          .cast<Widget>(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
