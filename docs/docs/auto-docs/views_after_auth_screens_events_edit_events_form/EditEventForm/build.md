
<div>

# build method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
build(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]
    context]

)


override




Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the
tree in a given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
and when the dependencies of this widget change (e.g., an
[InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
referenced by this widget changes). This method can potentially be
called in every frame and should not have any side effects beyond
building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget\'s
constructor and from the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. A given widget might be built
with multiple different
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

-   the fields of the widget, which themselves must not change over
    time, and
-   any ambient state obtained from the `context` using
    [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget\'s
[build](../../views_after_auth_screens_events_edit_events_form/EditEventForm/build.html)
method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.



## Implementation

``` language-dart
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
```







1.  [talawa](../../index.html)
2.  [edit_events_form](../../views_after_auth_screens_events_edit_events_form/)
3.  [EditEventForm](../../views_after_auth_screens_events_edit_events_form/EditEventForm-class.html)
4.  build method

##### EditEventForm class







