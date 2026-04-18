import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/time_value.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/base_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/add_members_bottom_sheet.dart';
import 'package:talawa/widgets/event_date_time_tile.dart';
import 'package:talawa/widgets/member_name_tile.dart';
import 'package:talawa/widgets/recurrence_dialog.dart';
import 'package:talawa/widgets/venue_selector.dart';

/// EventPageForm returns a widget that has mutable state _EventPageFormState.
class EventPageForm extends StatefulWidget {
  const EventPageForm({super.key, this.event});

  /// event to be edited, if null a new event is created.
  final Event? event;

  @override
  EventPageFormState createState() => EventPageFormState();
}

/// _EventPageFormState returns a widget for a Page to Create the Event in the Organization.
class EventPageFormState extends State<EventPageForm> {
  // ── Text controllers owned by the View.
  // The ViewModel holds plain String fields; these controllers are the UI bridge.
  late final TextEditingController _titleController;
  late final TextEditingController _locationController;
  late final TextEditingController _descriptionController;

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Formats a [TimeValue] into a locale-aware 12h/24h string using
  /// Flutter's `TimeOfDay.format()`. The View is responsible for all
  /// Flutter-specific formatting.
  String _formatTime(BuildContext context, TimeValue tv) {
    return TimeOfDay(hour: tv.hour, minute: tv.minute).format(context);
  }

  /// Shows the date picker and passes the result back to the ViewModel.
  Future<void> _pickStartDate(BaseEventViewModel model) async {
    final date = await showDatePicker(
      context: context,
      initialDate: model.eventStartDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (date != null && date != model.eventStartDate) {
      model.setStartDate(date);
    }
  }

  /// Shows the time picker and passes the result back to the ViewModel.
  Future<void> _pickStartTime(BaseEventViewModel model) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: model.eventStartTime.hour,
        minute: model.eventStartTime.minute,
      ),
    );
    if (picked != null) {
      model.setStartTime(TimeValue(hour: picked.hour, minute: picked.minute));
    }
  }

  /// Shows the date picker for end date and passes the result to the ViewModel.
  Future<void> _pickEndDate(BaseEventViewModel model) async {
    final date = await showDatePicker(
      context: context,
      initialDate: model.eventEndDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (date != null && date != model.eventEndDate) {
      model.setEndDate(date);
    }
  }

  /// Shows the time picker for end time and passes the result to the ViewModel.
  Future<void> _pickEndTime(BaseEventViewModel model) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: model.eventEndTime.hour,
        minute: model.eventEndTime.minute,
      ),
    );
    if (picked != null) {
      model.setEndTime(TimeValue(hour: picked.hour, minute: picked.minute));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.event != null) {
      return BaseView<EditEventViewModel>(
        onModelReady: (model) {
          model.initialize(widget.event!);
          _titleController = TextEditingController(text: model.eventTitle);
          _locationController =
              TextEditingController(text: model.eventLocation);
          _descriptionController =
              TextEditingController(text: model.eventDescription);
        },
        builder: (context, model, child) => _formUi(context, model),
      );
    } else {
      return BaseView<CreateEventViewModel>(
        onModelReady: (model) {
          _titleController = TextEditingController(text: model.eventTitle);
          _locationController =
              TextEditingController(text: model.eventLocation);
          _descriptionController =
              TextEditingController(text: model.eventDescription);
        },
        builder: (context, model, child) => _formUi(context, model),
      );
    }
  }

  /// Builds the main UI form with the provided event view model.
  ///
  /// **params**:
  /// * `context`: The BuildContext for the widget.
  /// * `model`: The BaseEventViewModel instance for managing event data.
  ///
  /// **returns**:
  /// * `Scaffold`: A Scaffold widget containing the event form UI.
  Scaffold _formUi(BuildContext context, BaseEventViewModel model) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
          onTap: model.navigateBack,
          child: const Icon(Icons.close),
        ),
        title: Text(
          (model is CreateEventViewModel)
              ? AppLocalizations.of(context)!.strictTranslate('Add Event')
              : AppLocalizations.of(context)!.strictTranslate('Edit Event'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Sync controller text → model fields before executing
              model.eventTitle = _titleController.text;
              model.eventLocation = _locationController.text;
              model.eventDescription = _descriptionController.text;
              model.executeIfLoggedIn();
            },
            child: Text(
              model is CreateEventViewModel
                  ? AppLocalizations.of(context)!.strictTranslate('Add')
                  : AppLocalizations.of(context)!.strictTranslate('Update'),
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
                      onPressed: () {
                        model.getImageFromGallery();
                      },
                      child: Text(
                        AppLocalizations.of(context)!
                            .strictTranslate("Add Image"),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 16),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _titleController,
                      onChanged: (v) => model.eventTitle = v,
                      keyboardType: TextInputType.name,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .strictTranslate('Add Event Title'),
                        isDense: true,
                        labelStyle: Theme.of(context).textTheme.titleMedium,
                        focusedBorder: InputBorder.none,
                        counterText: "",
                        enabledBorder: InputBorder.none,
                        prefixIcon: Container(
                          transform: Matrix4.translationValues(
                            -SizeConfig.screenWidth! * 0.027,
                            0.0,
                            0.0,
                          ),
                          child: const Icon(
                            Icons.title,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      controller: _locationController,
                      onChanged: (v) => model.eventLocation = v,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .strictTranslate('Where is the event?'),
                        labelText: AppLocalizations.of(context)!
                            .strictTranslate('Add Location'),
                        labelStyle: Theme.of(context).textTheme.titleMedium,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.place,
                          size: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.013,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      controller: _descriptionController,
                      onChanged: (v) => model.eventDescription = v,
                      maxLines: 10,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .strictTranslate('Describe the event'),
                        labelText: AppLocalizations.of(context)!
                            .strictTranslate('Add Description'),
                        labelStyle: Theme.of(context).textTheme.titleMedium,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.view_headline,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.013),
                const Divider(),
                if (model is CreateEventViewModel)
                  VenueSelectionWidget(model: model),
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
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 16),
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
                            activeColor: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('All day'),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 16),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.005,
                          ),
                          Switch(
                            value: model.isAllDay,
                            onChanged: (value) {
                              setState(() {
                                model.isAllDay = value;
                              });
                            },
                            activeColor: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Keep Public'),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 16),
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
                            activeColor: Theme.of(context).colorScheme.primary,
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
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.013,
                ),
                DateTimeTile(
                  isAllDay: model.isAllDay,
                  date: "${model.eventStartDate.toLocal()}".split(' ')[0],
                  time: _formatTime(context, model.eventStartTime),
                  setDate: () => _pickStartDate(model),
                  setTime: () => _pickStartTime(model),
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
                  isAllDay: model.isAllDay,
                  date: "${model.eventEndDate.toLocal()}".split(' ')[0],
                  time: _formatTime(context, model.eventEndTime),
                  setDate: () => _pickEndDate(model),
                  setTime: () => _pickEndTime(model),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.026,
                ),
                if (model is CreateEventViewModel ||
                    (model is EditEventViewModel &&
                        model.wasRecurringOriginally)) ...[
                  InkWell(
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
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 16),
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
                ],
                SizedBox(height: SizeConfig.screenHeight! * 0.026),
                const Divider(),
                if (model is CreateEventViewModel)
                  InkWell(
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 16),
                        ),
                        Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                if (model is CreateEventViewModel)
                  Wrap(
                    children: model.selectedMembers
                        .map(
                          (user) => MemberNameTile(
                            userName: user.name ?? "No Name",
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
  }
}
