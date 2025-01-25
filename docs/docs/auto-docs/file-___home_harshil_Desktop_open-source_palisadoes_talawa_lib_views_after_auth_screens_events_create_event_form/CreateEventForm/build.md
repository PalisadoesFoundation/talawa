




build method - CreateEventForm class - create\_event\_form library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/events/create\_event\_form.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_create_event_form/)
3. [CreateEventForm](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_create_event_form/CreateEventForm-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
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
            hintText: AppLocalizations.of(context)!
                .strictTranslate('Where is the event?'),
            labelText:
                AppLocalizations.of(context)!.strictTranslate('Add Location'),
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
            hintText: AppLocalizations.of(context)!
                .strictTranslate('Describe the event'),
            labelText: AppLocalizations.of(context)!
                .strictTranslate('Add Description'),
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
```

 


1. [talawa](../../index.html)
2. [create\_event\_form](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_create_event_form/)
3. [CreateEventForm](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_create_event_form/CreateEventForm-class.html)
4. build method

##### CreateEventForm class





talawa
1.0.0+1






