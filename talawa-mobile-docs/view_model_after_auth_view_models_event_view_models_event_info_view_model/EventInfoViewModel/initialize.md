


# initialize method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> initialize
({required [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> args})





<p>initialise with the event data fetched from the model.</p>



## Implementation

```dart
Future<void> initialize({required Map<String, dynamic> args}) async {
  event = args["event"] as Event;
  exploreEventsInstance =
      args["exploreEventViewModel"] as ExploreEventsViewModel;
  fabTitle = getFabTitle();
  setState(ViewState.busy);
  final fetchRegistrantsByEventQueryResult = await locator<EventService>()
      .fetchRegistrantsByEvent(event.id!) as QueryResult;
  final registrantsJsonList = fetchRegistrantsByEventQueryResult
      .data!['registrantsByEvent'] as List<Object?>;
  registrants = registrantsJsonList
      .map(
        (registrantJson) => User.fromJson(
          registrantJson! as Map<String, dynamic>,
          fromOrg: true,
        ),
      )
      .toList();
  setState(ViewState.idle);
}
```







