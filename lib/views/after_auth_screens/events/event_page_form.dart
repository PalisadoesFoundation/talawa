import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_model.dart';
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
  @override
  Widget build(BuildContext context) {
    if (widget.event != null) {
      return BaseView<EditEventViewModel>(
        onModelReady: (model) => model.initialize(widget.event!),
        builder: (context, model, child) => _formUi(context, model),
      );
    } else {
      return BaseView<CreateEventViewModel>(
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
            onPressed: model.executeIfLoggedIn,
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
                      controller: model.eventTitleTextController,
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
                      controller: model.eventLocationTextController,
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
                      controller: model.eventDescriptionTextController,
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
                  time: model.eventStartTime.format(context),
                  setDate: model.pickStartDate,
                  setTime: model.pickStartTime,
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
                  time: model.eventEndTime.format(context),
                  setDate: model.pickEndDate,
                  setTime: model.pickEndTime,
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
