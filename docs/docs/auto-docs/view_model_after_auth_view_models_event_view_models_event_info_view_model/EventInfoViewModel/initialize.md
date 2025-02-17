
<div>

# initialize method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
initialize({

1.  [required
    [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    args, ]

})



This function initializes the EventInfoViewModel class with the required
arguments.

**params**:

-   `args`: A map of arguments required to initialize the
    EventInfoViewModel class.

**returns**: None



## Implementation

``` language-dart
Future<void> initialize({required Map<String, dynamic> args}) async {
  event = args["event"] as Event;
  exploreEventsInstance =
      args["exploreEventViewModel"] as ExploreEventsViewModel;
  fabTitle = ;
  await ;
  await ;
  selectedCategories.;
  setState(ViewState.busy);
  attendees = event.attendees ?? [];
  setState(ViewState.idle);
}
```







1.  [talawa](../../index.md)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.md)
4.  initialize method

##### EventInfoViewModel class







