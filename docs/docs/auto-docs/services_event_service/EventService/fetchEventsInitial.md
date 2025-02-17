
<div>

# fetchEventsInitial method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Fetches the initial set of events, loading from the cache first, and
then refreshing the feed.

This method loads events from the cache, adds them to the event stream,
and then triggers a feed refresh to fetch the latest events from the API
and update the stream accordingly.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  _events = await ;
  _eventStreamController.add(_events);
  ;
}
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  fetchEventsInitial method

##### EventService class







