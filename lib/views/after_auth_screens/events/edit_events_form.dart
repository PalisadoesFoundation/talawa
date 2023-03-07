// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';

/// EditEventForm returns a widget of a Form for editing an event.
/// This widget is used in EditEventPage widget.
class EditEventForm extends StatelessWidget {
  const EditEventForm({Key? key, required this.model}) : super(key: key);
  final EditEventViewModel model;
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
            textInputAction: TextInputAction.next,
            controller: model.eventTitleTextController,
            keyboardType: TextInputType.name,
            maxLength: 20,
            focusNode: model.titleFocus,
            validator: (value) => Validator.validateEventForm(value!, 'Title'),
            decoration: InputDecoration(
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
              suffixIcon: IconButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(model.titleFocus);
                },
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.013,
          ),
          // Text field for the location.
          TextFormField(
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
              suffixIcon: IconButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(model.locationFocus);
                },
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.013,
          ),
          // Text field for event description.
          TextFormField(
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
              suffixIcon: IconButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(model.descriptionFocus);
                },
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
