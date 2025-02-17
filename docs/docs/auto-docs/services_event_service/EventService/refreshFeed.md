
<div>

# refreshFeed method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Refreshes the event feed by fetching the latest events from the API and
updating the event stream.

This method retrieves the latest events using the
`getNewFeedAndRefreshCache` method and adds the new events to the event
stream.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  _events = await ;
  _eventStreamController.add(_events);
}
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  refreshFeed method

##### EventService class







