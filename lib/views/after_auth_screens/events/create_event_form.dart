import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

class CreateEventForm extends StatefulWidget {
  const CreateEventForm({Key? key}) : super(key: key);

  @override
  _CreateEventFormState createState() => _CreateEventFormState();
}

class _CreateEventFormState extends State<CreateEventForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
      ),
    );
  }
}
