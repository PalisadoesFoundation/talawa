::::::::: {#dartdoc-main-content .main-content above-sidebar="views_after_auth_screens_events_event_info_body/EventInfoBody-class-sidebar.html" below-sidebar=""}
<div>

# [build]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[build]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#build-param-context .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
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
[build](../../views_after_auth_screens_events_event_info_body/EventInfoBody/build.html)
method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
Widget build(BuildContext context) {
  // fetching the event data from model
  final model = Provider.of<EventInfoViewModel>(context);
  final event = model.event;
  // Slivers are special-purpose widgets that can be combined using a
  //CustomScrollView to create custom scroll effects. A SliverToBoxAdapter
  //is a basic sliver that creates a bridge back to one of the usual box-based widgets.
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal! * 15,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        // event title
                        event.title!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 26),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: SizeConfig.screenWidth! * 0.002,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (model.event.creator!.id == userConfig.currentUser.id)
                        ? IconButton(
                            onPressed: () => navigationService.pushScreen(
                              "/editEventPage",
                              arguments: model.event,
                            ),
                            icon: const Icon(Icons.edit),
                          )
                        : Container(),
                    const Icon(Icons.chat_bubble_outline),
                  ],
                ),
              ),
            ],
          ),
          Text(
            // Display event creator full name.
            "${AppLocalizations.of(context)!.strictTranslate("Created by")}: ${event.creator!.firstName} ${event.creator!.lastName}",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.011,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.calendar_today,
                size: 13,
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.027,
              ),
              Text(
                // Display start and end date of the Event.
                "${event.startDate} - ${event.endDate}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              // If event type is public then renders lock_open icon else renders lock icon.
              event.isPublic!
                  ? Icon(
                      Icons.lock_open,
                      size: 13,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : Icon(
                      Icons.lock,
                      size: 13,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.027,
              ),
              // If event type is public then renders 'public'
              // else renders 'private' text translated into the app language.
              event.isPublic!
                  ? Text(
                      AppLocalizations.of(context)!.strictTranslate('public'),
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : Text(
                      AppLocalizations.of(context)!
                          .strictTranslate('private'),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.011,
          ),
          if (event.startTime != null && event.endTime != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // display schedule icon with the start and end date of the time.
                const Icon(
                  Icons.schedule,
                  size: 12,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.025,
                ),
                Text(
                  "${event.startTime} - ${event.endTime}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.011,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.place,
                size: 12,
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.027,
              ),
              Text(
                event.location!,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 3,
              ),
              const Spacer(),
            ],
          ),
          const Divider(),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.013,
          ),
          Text(
            AppLocalizations.of(context)!.strictTranslate("Description"),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 16),
          ),
          SizedBox(width: SizeConfig.screenWidth! * 0.013),
          Text(
            // Display the Description of the event if not null.
            event.description!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.013),
          Text(
            AppLocalizations.of(context)!.strictTranslate("Admins"),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 16),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 2,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: event.admins!.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomListTile(
                key: Key(
                  '${AppLocalizations.of(context)!.strictTranslate("Admins")}$index',
                ),
                index: index,
                type: TileType.user,
                userInfo: event.admins![index],
                onTapUserInfo: () {},
              );
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.013,
          ),
          Text(
            AppLocalizations.of(context)!.strictTranslate("Attendees"),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 16),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 2,
          ),
          if (model.isBusy)
            // if the model is still fetching the attendees details then display Circular Progress Indicator Icon.
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Center(child: CircularProgressIndicator()),
            )
          else
            // else if the model fetched the attendees details successfully
            //then renders all the attendees in ListView.
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: model.attendees.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomListTile(
                  key: Key(
                    'Attendee$index',
                  ),
                  index: index,
                  type: TileType.attendee,
                  attendeeInfo: model.attendees[index],
                  onTapAttendeeInfo: () {},
                );
              },
            ),
        ],
      ),
    ),
  );
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_info_body](../../views_after_auth_screens_events_event_info_body/)
3.  [EventInfoBody](../../views_after_auth_screens_events_event_info_body/EventInfoBody-class.html)
4.  build method

##### EventInfoBody class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
