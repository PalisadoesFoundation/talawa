
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

The framework calls this method in a number of different situations. For
example:

-   After calling
    [initState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/initState.html).
-   After calling
    [didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html).
-   After receiving a call to
    [setState](https://api.flutter.dev/flutter/widgets/State/setState.html).
-   After a dependency of this
    [State](https://api.flutter.dev/flutter/widgets/State-class.html)
    object changes (e.g., an
    [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
    referenced by the previous
    [build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.html)
    changes).
-   After calling
    [deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html)
    and then reinserting the
    [State](https://api.flutter.dev/flutter/widgets/State-class.html)
    object into the tree at another location.

This method can potentially be called in every frame and should not have
any side effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget\'s
constructor, the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html),
and the internal state of this
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object.

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. The
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
argument is always the same as the `context` property of this
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
and will remain the same for the lifetime of this object. The
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
argument is provided redundantly here so that this method matches the
signature for a
[WidgetBuilder](https://api.flutter.dev/flutter/widgets/WidgetBuilder.html).

## Design discussion

### Why is the [build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.html) method on [State](https://api.flutter.dev/flutter/widgets/State-class.html), and not [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)?

Putting a `Widget build(BuildContext context)` method on
[State](https://api.flutter.dev/flutter/widgets/State-class.html) rather
than putting a `Widget build(BuildContext context, State state)` method
on
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
gives developers more flexibility when subclassing
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html).

For example,
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html)
is a subclass of
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
that introduces an abstract `Widget build(BuildContext context)` method
for its subclasses to implement. If
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
already had a
[build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.html)
method that took a
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
argument,
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html)
would be forced to provide its
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
to subclasses even though its
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
is an internal implementation detail of
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html).

Conceptually,
[StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
could also be implemented as a subclass of
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
in a similar manner. If the
[build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.html)
method were on
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
rather than
[State](https://api.flutter.dev/flutter/widgets/State-class.html), that
would not be possible anymore.

Putting the
[build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.html)
function on
[State](https://api.flutter.dev/flutter/widgets/State-class.html) rather
than
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
also helps avoid a category of bugs related to closures implicitly
capturing `this`. If you defined a closure in a
[build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.html)
function on a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html),
that closure would implicitly capture `this`, which is the current
widget instance, and would have the (immutable) fields of that instance
in scope:

``` language-dart
// (this is not valid Flutter code)
class MyButton extends StatefulWidgetX {
  MyButton({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, State state) {
    return SpecialWidget(
      handler: () { print('color: $color'); },
    );
  }
}
```

For example, suppose the parent builds `MyButton` with `color` being
blue, the `$color` in the print function refers to blue, as expected.
Now, suppose the parent rebuilds `MyButton` with green. The closure
created by the first build still implicitly refers to the original
widget and the `$color` still prints blue even through the widget has
been updated to green; should that closure outlive its widget, it would
print outdated information.

In contrast, with the
[build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.html)
function on the
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, closures created during
[build](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState/build.html)
implicitly capture the
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
instance instead of the widget instance:

``` language-dart
class MyButton extends StatefulWidget {
  const MyButton({super.key, this.color = Colors.teal});

  final Color color;
  // ...
}

class MyButtonState extends State<MyButton> {
  // ...
  @override
  Widget build(BuildContext context) {
    return SpecialWidget(
      handler: () { print('color: ${widget.color}'); },
    );
  }
}
```

Now when the parent rebuilds `MyButton` with green, the closure created
by the first build still refers to
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, which is preserved across rebuilds, but the framework has
updated that
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object\'s
[widget](https://api.flutter.dev/flutter/widgets/State/widget.html)
property to refer to the new `MyButton` instance and `${widget.color}`
prints green, as expected.

See also:

-   [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html),
    which contains the discussion on performance considerations.



## Implementation

``` language-dart
@override
Widget build(BuildContext context) {
  final navigationServiceLocal = locator<NavigationService>();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 1,
      centerTitle: true,
      leading: GestureDetector(
        onTap: navigationServiceLocal.pop,
        child: const Icon(Icons.close),
      ),
      title: Text(
        AppLocalizations.of(context)!.strictTranslate('Add Agenda Item'),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
      ),
      actions: [
        TextButton(
          key: const Key('addButton'),
          onPressed: () {
            final List<String> categoryIds =
                selectedCategories.map((category) => category.id!).;

            widget.model.createAgendaItem(
              title: titleController.text,
              duration: durationController.text,
              description: descController.text,
              urls: urls,
              categories: categoryIds,
              attachments: attachments,
            );
            Navigator.of(context).;
          },
          child: Text(
            key: const Key('add_agenda'),
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
              DropdownButtonFormField<AgendaCategory>(
                key: const Key('create_agenda_item_category_dropdown'),
                value: selectedCategories.isNotEmpty
                    ? selectedCategories.first
                    : null,
                onChanged: (AgendaCategory? category) {
                  if (category != null) {
                    _onCategorySelected(category);
                  }
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!
                      .strictTranslate('Select Categories'),
                  border: const ,
                ),
                items: widget.model.categories
                    .map<DropdownMenuItem<AgendaCategory>>(
                        (AgendaCategory category) {
                  return DropdownMenuItem<AgendaCategory>(
                    value: category,
                    child: Text(category.name!),
                  );
                }).,
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: selectedCategories.map((category) {
                  return Chip(
                    label: Text(category.name!),
                    onDeleted: () => _removeCategory(category),
                    deleteIconColor: Colors.redAccent,
                  );
                }).,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.013),
              TextFormField(
                key: const Key('create_event_agenda_tf1'),
                textInputAction: TextInputAction.next,
                controller: titleController,
                keyboardType: TextInputType.name,
                maxLength: 20,
                focusNode: titleFocus,
                validator: (value) =>
                    Validator.validateEventForm(value!, 'Title'),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!
                      .strictTranslate('Add Agenda Item Title'),
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
              SizedBox(height: SizeConfig.screenHeight! * 0.013),
              TextFormField(
                key: const Key('create_event_agenda_tf2'),
                keyboardType: TextInputType.multiline,
                controller: descController,
                focusNode: descFocus,
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
              SizedBox(height: SizeConfig.screenHeight! * 0.013),
              TextFormField(
                key: const Key('create_event_agenda_duration'),
                controller: durationController,
                focusNode: durationFocus,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!
                      .strictTranslate('Duration (mm:ss)'),
                  hintText: '00:00',
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  border: const ,
                  prefixIcon: Container(
                    transform: Matrix4.translationValues(
                      -SizeConfig.screenWidth! * 0.027,
                      0.0,
                      0.0,
                    ),
                    child: const Icon(
                      Icons.timer,
                      size: 25,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!
                        .strictTranslate('Please enter a duration');
                  }
                  // Add additional validation for mm:ss format if needed
                  return null;
                },
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.013),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: urlController,
                      focusNode: urlFocus,
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!
                            .strictTranslate('Add URL'),
                        labelStyle: Theme.of(context).textTheme.titleMedium,
                        border: const ,
                        prefixIcon: Container(
                          transform: Matrix4.translationValues(
                            -SizeConfig.screenWidth! * 0.027,
                            0.0,
                            0.0,
                          ),
                          child: const Icon(
                            Icons.add_link_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addUrl,
                    child: Text(
                      key: const Key('add_url'),
                      AppLocalizations.of(context)!.strictTranslate('Add'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: urls.map((url) {
                  return Chip(
                    label: Text(url),
                    onDeleted: () => _removeUrl(url),
                    deleteIconColor: Colors.redAccent,
                  );
                }).,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.013),
              ElevatedButton.icon(
                key: const Key('addAttachmentButton'),
                onPressed: () => _pickAttachment(fromCamera: false),
                icon: const Icon(Icons.attach_file),
                label: Text(
                  AppLocalizations.of(context)!
                      .strictTranslate('Add Attachments'),
                ),
              ),
              const ,
              const SizedBox(height: 10),
              GridView.builder(
                key: const Key('attachmentGridView'),
                shrinkWrap: true,
                physics: const ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: attachments.length,
                itemBuilder: (context, index) {
                  final base64String = attachments[index];
                  final imageData = base64Decode(base64String);
                  return Stack(
                    key: Key('attachmentItem_$index'),
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        key: Key('attachmentImage_$index'),
                        child: Image.memory(
                          imageData,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          key: Key('attachmentCloseButton_$index'),
                          onTap: () => _removeAttachment(base64String),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.013),
            ],
          ),
        ),
      ),
    ),
  );
}
```







1.  [talawa](../../index.html)
2.  [create_agenda_item_page](../../views_after_auth_screens_events_create_agenda_item_page/)
3.  [CreateAgendaItemPageState](../../views_after_auth_screens_events_create_agenda_item_page/CreateAgendaItemPageState-class.html)
4.  build method

##### CreateAgendaItemPageState class







