
<div>

# toJson method

</div>


[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
dynamic\>]]




Converts the Attendee instance to a map structure..

This method is used to convert the Attendee instance to a map structure
that can be converted to a JSON object.

**params**: None

**returns**:

-   `Map<String, dynamic>`: A map structure that can be converted to a
    JSON object.



## Implementation

``` language-dart
Map<String, dynamic>  {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = this.id;
  data['firstName'] = this.firstName;
  data['lastName'] = this.lastName;
  data['image'] = this.image;
  return data;
}
```







1.  [talawa](../../index.md)
2.  [event_model](../../models_events_event_model/)
3.  [Attendee](../../models_events_event_model/Attendee-class.md)
4.  toJson method

##### Attendee class







