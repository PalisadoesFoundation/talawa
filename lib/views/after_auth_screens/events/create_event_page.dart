import 'package:flutter/material.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_event_form.dart';
import 'package:talawa/views/after_auth_screens/events/venue_bottom_sheet.dart';
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
  CreateEventPageState createState() => CreateEventPageState();
}

/// _CreateEventPageState returns a widget for a Page to Creatxe the Event in the Organization.
class CreateEventPageState extends State<CreateEventPage> {
  /// venue selected by the user.
  Venue? selectedVenue;

  /// Handles the selection and deselection of categories.
  ///
  /// **params**:
  /// * `date`: Date for event
  /// * `model`: Model to be updated
  ///
  /// **returns**:
  ///   None
  void dateUpdater1(DateTime date, CreateEventViewModel model) {
    if (date.isBefore(DateTime.now())) {
      navigationService.showSnackBar(
        "Cannot create events having date prior than today",
      );
    } else {
      setState(() {
        if (model.eventStartDate != date) {
          model.eventStartDate = date;
          model.recurrenceStartDate = date;
          model.recurrenceLabel = 'Does not repeat';
          model.isRecurring = false;
          model.frequency = Frequency.weekly;
          model.weekDays = {};
          model.weekDayOccurenceInMonth = null;
        }
      });
    }
  }

  /// Handles the selection and deselection of categories.
  ///
  /// **params**:
  /// * `time`: Time for event
  /// * `model`: Model to be updated
  ///
  /// **returns**:
  ///   None
  void timeUpdater1(TimeOfDay time, CreateEventViewModel model) {
    final validationError = Validator.validateEventTime(
      time,
      model.eventEndTime,
    );

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
  }

  /// Handles the selection and deselection of categories.
  ///
  /// **params**:
  /// * `date`: Date for event
  /// * `model`: Model to be updated
  ///
  /// **returns**:
  ///   None
  void dateUpdater2(DateTime date, CreateEventViewModel model) {
    final startDate = model.eventStartDate;

    if (startDate.compareTo(date) < 0) {
      setState(() {
        if (model.eventEndDate != date) {
          model.eventEndDate = date;
          model.recurrenceLabel = 'Does not repeat';
          model.recurrenceEndDate = null;
          model.isRecurring = false;
          model.frequency = Frequency.weekly;
          model.weekDays = {};
          model.weekDayOccurenceInMonth = null;
        }
      });
    } else {
      navigationService.showSnackBar(
        "End Date cannot be after start date",
      );
    }
  }

  /// Handles the selection and deselection of categories.
  ///
  /// **params**:
  /// * `time`: Time for event
  /// * `model`: Model to be updated
  ///
  /// **returns**:
  ///   None
  void timeUpdater2(TimeOfDay time, CreateEventViewModel model) {
    final validationError = Validator.validateEventTime(
      model.eventStartTime,
      time,
    );
    final showSnackBar = navigationService.showTalawaErrorSnackBar;
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
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle subtitleTextStyle =
        Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16);
    final navigationServiceLocal = locator<NavigationService>();
    return BaseView<CreateEventViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          // AppBar is the header of the page
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 1,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () => navigationServiceLocal.pop(),
              child: const Icon(Icons.close),
            ),
            title: Text(
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
                    Scaffold.maybeOf(context)?.openDrawer();
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
                    model.imageFile != null
                        ? Container(
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
                      model: model,
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.013),
                    const Divider(),
                    GestureDetector(
                      onTap: () async {
                        final List<Venue> venues = await model.fetchVenues();
                        if (!context.mounted) return;
                        final Venue? selected =
                            await showModalBottomSheet<Venue>(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return VenueBottomSheet(venues: venues);
                          },
                        );
                        if (selected != null) {
                          setState(() {
                            selectedVenue = selected;
                          });
                        }
                      },
                      child: selectedVenue == null
                          ? Container(
                              height: 50.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.add_location),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .strictTranslate('Add Venue'),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 100.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  if (selectedVenue!.imageUrl!.isNotEmpty)
                                    Image.network(
                                      selectedVenue!.imageUrl!.replaceAll(
                                        'http://localhost:4000',
                                        GraphqlConfig.orgURI!
                                            .replaceFirst('/graphql', ''),
                                      ),
                                    )
                                  else
                                    Image.asset(
                                      'assets/images/defaultImg.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          selectedVenue!.name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          'Capacity: ${selectedVenue!.capacity}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedVenue = null;
                                          });
                                        },
                                        icon: const Icon(Icons.cancel),
                                      ),
                                      const Icon(Icons.edit),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
                                  });
                                },
                                thumbColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (states) =>
                                      Theme.of(context).colorScheme.primary,
                                ),
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
                                  });
                                },
                                thumbColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (states) =>
                                      Theme.of(context).colorScheme.primary,
                                ),
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
                                value: model.isPublicSwitch,
                                onChanged: (value) {
                                  setState(() {
                                    model.isPublicSwitch = value;
                                  });
                                },
                                thumbColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (states) =>
                                      Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    const Divider(),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    Text(
                      AppLocalizations.of(context)!.strictTranslate(
                        model.isAllDay
                            ? 'Select Start Date'
                            : 'Select Start Date and Time',
                      ),
                      style: subtitleTextStyle,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    // DateTimeTile is custom widget that returns a tile to select date and time.
                    DateTimeTile(
                      key: const Key("dateTimeTileFirst"),
                      isAllDay: model.isAllDay,
                      date: "${model.eventStartDate.toLocal()}".split(' ')[0],
                      time: model.eventStartTime.format(context),
                      setDate: () async {
                        final date = await customDatePicker(
                          initialDate: model.eventStartDate,
                        );
                        dateUpdater1(date, model);
                      },
                      setTime: () async {
                        final time = await customTimePicker(
                          initialTime: model.eventStartTime,
                        );
                        timeUpdater1(time, model);
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.026,
                    ),
                    Text(
                      AppLocalizations.of(context)!.strictTranslate(
                        model.isAllDay
                            ? 'Select End Date'
                            : 'Select End Date and Time',
                      ),
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
                      isAllDay: model.isAllDay,
                      date: "${model.eventEndDate.toLocal()}".split(' ')[0],
                      time: model.eventEndTime.format(context),
                      setDate: () async {
                        final date = await customDatePicker(
                          initialDate: model.eventEndDate,
                        );
                        dateUpdater2(date, model);
                      },
                      setTime: () async {
                        final time = await customTimePicker(
                          initialTime: model.eventEndTime,
                        );
                        timeUpdater2(time, model);
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.026,
                    ),
                    InkWell(
                      key: const Key('inkwell_recurrLabel'),
                      child: Row(
                        children: [
                          const Icon(Icons.restore),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.045,
                          ),
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .strictTranslate(model.recurrenceLabel),
                              style: subtitleTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
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
                            );
                          },
                        );
                        setState(() {
                          if (selectedReccurence != null) {
                            model.recurrenceLabel = selectedReccurence;
                          }
                        });
                      },
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
