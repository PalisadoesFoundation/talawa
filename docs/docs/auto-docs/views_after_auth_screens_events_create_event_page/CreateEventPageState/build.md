
<div>

# build method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
build(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    context]

)


override




Describes the part of the user interface represented by this widget.

The framework calls this method in a number of different situations. For
example:

-   After calling
    [initState](https://api.flutter.dev/flutter/widgets/State/initState.html).
-   After calling
    [didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html).
-   After receiving a call to
    [setState](https://api.flutter.dev/flutter/widgets/State/setState.html).
-   After a dependency of this
    [State](https://api.flutter.dev/flutter/widgets/State-class.html)
    object changes (e.g., an
    [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.md)
    referenced by the previous
    [build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
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

### Why is the [build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md) method on [State](https://api.flutter.dev/flutter/widgets/State-class.html), and not [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)?

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
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
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
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
method were on
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
rather than
[State](https://api.flutter.dev/flutter/widgets/State-class.html), that
would not be possible anymore.

Putting the
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
function on
[State](https://api.flutter.dev/flutter/widgets/State-class.html) rather
than
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
also helps avoid a category of bugs related to closures implicitly
capturing `this`. If you defined a closure in a
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
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
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
function on the
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, closures created during
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
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
  final TextStyle subtitleTextStyle =
      Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16);
  final navigationServiceLocal = locator<NavigationService>();
  return BaseView<CreateEventViewModel>(
    onModelReady: (model) => model.,
    builder: (context, model, child) {
      return Scaffold(
        // AppBar is the header of the page
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 1,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => navigationServiceLocal.,
            child: const Icon(Icons.close),
          ),
          title: Text(
            AppLocalizations.of(context)!.strictTranslate('Add Event'),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
          ),
          actions: [
            TextButton(
              key: const Key('addButton'),
              onPressed: () {
                if (userConfig.loggedIn) {
                  model.;
                } else {
                  navigationService.;
                  MainScreenViewModel.scaffoldKey.currentState?.;
                }
              },
              child: Text(
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
                  Row(
                    children: [
                      const Icon(
                        Icons.image,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.036,
                      ),
                      TextButton(
                        key: const Key('txt_btn_cep'),
                        onPressed: () {
                          model.;
                        },
                        child: Text(
                          AppLocalizations.of(context)!
                              .strictTranslate("Add Image"),
                          style: subtitleTextStyle,
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
                                  onPressed: () => model.,
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ,
                  const ,
                  CreateEventForm(
                    model: model,
                  ),
                  SizedBox(height: SizeConfig.screenHeight! * 0.013),
                  const ,
                  GestureDetector(
                    onTap: () async {
                      final List<Venue> venues = await model.;
                      if (!context.mounted) return;
                      final Venue? selected =
                          await showModalBottomSheet<Venue>(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return VenueBottomSheet(venues: venues);
                        },
                      );
                      if (selected != null) {
                        setState(() {
                          selectedVenue = selected;
                        });
                      }
                    },
                    child: selectedVenue == null
                        ? Container(
                            height: 50.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                const Icon(Icons.add_location),
                                const SizedBox(width: 10.0),
                                Text(
                                  AppLocalizations.of(context)!
                                      .strictTranslate('Add Venue'),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 100.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                if (selectedVenue!.imageUrl!.isNotEmpty)
                                  Image.network(
                                    selectedVenue!.imageUrl!.replaceAll(
                                      'http://localhost:4000',
                                      GraphqlConfig.orgURI!
                                          .replaceFirst('/graphql', ''),
                                    ),
                                  )
                                else
                                  Image.asset(
                                    'assets/images/defaultImg.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        selectedVenue!.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(
                                        'Capacity: ${selectedVenue!.capacity}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedVenue = null;
                                        });
                                      },
                                      icon: const Icon(Icons.cancel),
                                    ),
                                    const Icon(Icons.edit),
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ),
                  const ,
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
                              style: subtitleTextStyle,
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
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .strictTranslate('All day'),
                              style: subtitleTextStyle,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.005,
                            ),
                            Switch(
                              // Switch to select the visibility of the event.
                              value: model.isAllDay,
                              onChanged: (value) {
                                setState(() {
                                  model.isAllDay = value;
                                });
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .strictTranslate('Keep Public'),
                              style: subtitleTextStyle,
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
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.013,
                  ),
                  const ,
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.013,
                  ),
                  Text(
                    AppLocalizations.of(context)!.strictTranslate(
                      model.isAllDay
                          ? 'Select Start Date'
                          : 'Select Start Date and Time',
                    ),
                    style: subtitleTextStyle,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.013,
                  ),
                  // DateTimeTile is custom widget that returns a tile to select date and time.
                  DateTimeTile(
                    key: const Key("dateTimeTileFirst"),
                    isAllDay: model.isAllDay,
                    date: "${model.eventStartDate.}".split(' ')[0],
                    time: model.eventStartTime.format(context),
                    setDate: () async {
                      final date = await customDatePicker(
                        initialDate: model.eventStartDate,
                      );
                      dateUpdater1(date, model);
                    },
                    setTime: () async {
                      final time = await customTimePicker(
                        initialTime: model.eventStartTime,
                      );
                      timeUpdater1(time, model);
                    },
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
                    key: const Key('key for test cep'),
                    isAllDay: model.isAllDay,
                    date: "${model.eventEndDate.}".split(' ')[0],
                    time: model.eventEndTime.format(context),
                    setDate: () async {
                      final date = await customDatePicker(
                        initialDate: model.eventEndDate,
                      );
                      dateUpdater2(date, model);
                    },
                    setTime: () async {
                      final time = await customTimePicker(
                        initialTime: model.eventEndTime,
                      );
                      timeUpdater2(time, model);
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.026,
                  ),
                  InkWell(
                    key: const Key('inkwell_recurrLabel'),
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
                            style: subtitleTextStyle,
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
                  SizedBox(height: SizeConfig.screenHeight! * 0.026),
                  const ,
                  InkWell(
                    key: const Key('inwell_cep2'),
                    onTap: () {
                      .addUserBottomSheet(
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
                          style: subtitleTextStyle,
                        ),
                        Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    children: model.selectedMembers
                        .map(
                          (user) => MemberNameTile(
                            userName: "${user.firstName!} ${user.lastName!}",
                            userImage: user.image,
                            onDelete: () {
                              model.removeUserFromList(
                                userId: user.id!,
                              );
                            },
                          ),
                        )
                        .
                        .cast<Widget>(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
```







1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  build method

##### CreateEventPageState class







