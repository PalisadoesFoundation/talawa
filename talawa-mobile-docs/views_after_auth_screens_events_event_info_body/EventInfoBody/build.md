


# build method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) build
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>Describes the part of the user interface represented by this widget.</p>
<p>The framework calls this method when this widget is inserted into the tree
in a given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> and when the dependencies of this widget change
(e.g., an <a href="https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html">InheritedWidget</a> referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.</p>
<p>The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling <a href="https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html">Widget.canUpdate</a>.</p>
<p>Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>.</p>
<p>The given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.</p>
<p>The implementation of this method must only depend on:</p>
<ul>
<li>the fields of the widget, which themselves must not change over time,
and</li>
<li>any ambient state obtained from the <code>context</code> using
<a href="https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html">BuildContext.dependOnInheritedWidgetOfExactType</a>.</li>
</ul>
<p>If a widget's <a href="../../views_after_auth_screens_events_event_info_body/EventInfoBody/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
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
                "${event.startDate!} - ${event.endDate!}",
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
                "${event.startTime!} - ${event.endTime!}",
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
              // If the event location is not null then display the location
              //on the map with the reference of latitude and longitude provided for the event.
              if (event.latitude != null && event.longitude != null)
                GestureDetector(
                  onTap: () => navigationService.pushScreen(
                    Routes.mapScreen,
                    arguments: {
                      "latitude": event.latitude,
                      "longitude": event.longitude,
                    },
                  ),
                  child: Text(
                    'View on map',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 3,
                  ),
                ),
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
            color: Theme.of(context).colorScheme.onBackground,
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
            color: Theme.of(context).colorScheme.onBackground,
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
              itemCount: model.registrants.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomListTile(
                  key: Key(
                    '${AppLocalizations.of(context)!.strictTranslate("Attendee")}$index',
                  ),
                  index: index,
                  type: TileType.user,
                  userInfo: model.registrants[index],
                  onTapUserInfo: () {},
                );
              },
            )
        ],
      ),
    ),
  );
}
```







