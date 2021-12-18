import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

class CreateEventForm extends StatelessWidget {
  const CreateEventForm({Key? key, required this.model}) : super(key: key);
  final CreateEventViewModel model;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: model.eventTitleTextController,
            keyboardType: TextInputType.name,
            maxLength: 20,
            focusNode: model.titleFocus,
            validator: (value) {
              final String? val = Validator.validateEventForm(value!, 'Title');
              if (val != null) {
                return AppLocalizations.of(context)!.translate(val);
              }

              return null;
            },
            decoration: InputDecoration(
              labelText:
                  AppLocalizations.of(context)!.translate('Add Event Title'),
              isDense: true,
              labelStyle: Theme.of(context).textTheme.subtitle1,
              focusedBorder: InputBorder.none,
              counterText: "",
              enabledBorder: InputBorder.none,
              prefixIcon: Container(
                transform: Matrix4.translationValues(
                  -SizeConfig.screenWidth! * 0.027,
                  0.0,
                  0.0,
                ),
                child: const Icon(Icons.title, size: 25),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.013,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.streetAddress,
            controller: model.eventLocationTextController,
            focusNode: model.locationFocus,
            validator: (value) {
              final String? val =
                  Validator.validateEventForm(value!, 'Location');
              if (val != null) {
                return AppLocalizations.of(context)!.translate(val);
              }

              return null;
            },
            decoration: InputDecoration(
              hintText:
                  '${AppLocalizations.of(context)!.translate("Where is the event")}?',
              labelText:
                  AppLocalizations.of(context)!.translate('Add Location'),
              labelStyle: Theme.of(context).textTheme.subtitle1,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              prefixIcon: Container(
                transform: Matrix4.translationValues(
                  -SizeConfig.screenWidth! * 0.027,
                  0.0,
                  0.0,
                ),
                child: const Icon(Icons.place, size: 25),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.013,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            controller: model.eventDescriptionTextController,
            focusNode: model.descriptionFocus,
            validator: (value) {
              final String? val =
                  Validator.validateEventForm(value!, 'Description');
              if (val != null) {
                return AppLocalizations.of(context)!.translate(val);
              }

              return null;
            },
            maxLines: 10,
            minLines: 1,
            decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context)!.translate('Describe the event'),
              labelText:
                  AppLocalizations.of(context)!.translate('Add Description'),
              labelStyle: Theme.of(context).textTheme.subtitle1,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              prefixIcon: Container(
                transform: Matrix4.translationValues(
                  -SizeConfig.screenWidth! * 0.027,
                  0.0,
                  0.0,
                ),
                child: const Icon(Icons.view_headline, size: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
