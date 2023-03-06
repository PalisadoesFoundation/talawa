// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

/// CreateEventForm returns a widget of a Form for creating events in the organization.
/// This widget is used in CreateEventPage widget.
class CreateEventForm extends StatelessWidget {
  const CreateEventForm({Key? key, required this.model}) : super(key: key);
  final CreateEventViewModel model;
  @override
  Widget build(BuildContext context) {
    // Form class is a container for grouping together multiple form field widgets.
    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text field for event title.
          TextFormField(
            key: const Key('create_event_form_tff1'),
            textInputAction: TextInputAction.next,
            controller: model.eventTitleTextController,
            keyboardType: TextInputType.name,
            maxLength: 20,
            focusNode: model.titleFocus,
            validator: (value) => Validator.validateEventForm(value!, 'Title'),
            decoration: InputDecoration(
              // placeholder of the text field
              labelText: 'Add Event Title',
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
          // Text field for the location.
          TextFormField(
            key: const Key('create_event_form_tff2'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.streetAddress,
            controller: model.eventLocationTextController,
            focusNode: model.locationFocus,
            validator: (value) =>
                Validator.validateEventForm(value!, 'Location'),
            decoration: InputDecoration(
              hintText: 'Where is the event?',
              labelText: 'Add Location',
              labelStyle: Theme.of(context).textTheme.titleMedium,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              suffix: GestureDetector(
                key: const Key('gesture_cef_test'),
                onTap: () => navigationService.pushScreen(
                  Routes.mapScreen,
                  arguments: {
                    'model': model,
                    // initalize the map screen with a marker at this location
                    'latitude': 37.42796133580664,
                    'longitude': -122.085749655962,
                  },
                ),
                child: Text(
                  AppLocalizations.of(context)!
                      .strictTranslate('Choose on map'),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16),
                ),
              ),
              prefixIcon: Container(
                transform: Matrix4.translationValues(
                  -SizeConfig.screenWidth! * 0.027,
                  0.0,
                  0.0,
                ),
                child: const Icon(
                  Icons.place,
                  size: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.013,
          ),
          // Text field for event description.
          TextFormField(
            key: const Key('create_event_form_tff3'),
            keyboardType: TextInputType.multiline,
            controller: model.eventDescriptionTextController,
            focusNode: model.descriptionFocus,
            validator: (value) =>
                Validator.validateEventForm(value!, 'Description'),
            maxLines: 10,
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'Describe the event',
              labelText: 'Add Description',
              labelStyle: Theme.of(context).textTheme.titleMedium,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              prefixIcon: Container(
                transform: Matrix4.translationValues(
                  -SizeConfig.screenWidth! * 0.027,
                  0.0,
                  0.0,
                ),
                child: const Icon(
                  Icons.view_headline,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
