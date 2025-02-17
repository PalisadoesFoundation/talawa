
<div>

# Attendee.fromJson constructor

</div>


Attendee.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



## Implementation

``` language-dart
Attendee.fromJson(Map<String, dynamic> json) {
  id = json['_id'] as String?;
  firstName = json['firstName'] as String?;
  lastName = json['lastName'] as String?;
  image = json['image'] as String?;
}
```







1.  [talawa](../../index.html)
2.  [event_model](../../models_events_event_model/)
3.  [Attendee](../../models_events_event_model/Attendee-class.html)
4.  Attendee.fromJson constructor

##### Attendee class







