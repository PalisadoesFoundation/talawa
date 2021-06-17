import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

class CreateEventForm extends StatelessWidget {
  const CreateEventForm({Key? key, required this.model}) : super(key: key);
  final CreateEventViewModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.title),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.045,
            ),
            Flexible(
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: model.eventTitleTextController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Add Event Title',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.013,
        ),
        Row(
          children: [
            const Icon(Icons.place),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.045,
            ),
            Flexible(
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  controller: model.eventLocationTextController,
                  decoration: InputDecoration(
                    hintText: 'Where is the event?',
                    labelText: 'Add Location',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * 0.013,
        ),
        Row(
          children: [
            const Icon(Icons.view_headline),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.045,
            ),
            Flexible(
              child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: model.eventDescriptionTextController,
                  maxLines: 10,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Describe the event',
                    labelText: 'Add Description',
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
