
<div>

# Venue.fromJson constructor

</div>


Venue.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



Creates a `Venue` instance from a JSON object.

The `json` parameter is a map containing the venue data.

Returns an instance of `Venue`.



## Implementation

``` language-dart
factory Venue.fromJson(Map<String, dynamic> json) {
  return Venue(
    id: json['_id'] as String?,
    capacity: json['capacity'] as int?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String? ?? '',
    name: json['name'] as String?,
    organizationId:
        (json['organization'] as Map<String, dynamic>?)?['_id'] as String?,
  );
}
```







1.  [talawa](../../index.html)
2.  [event_venue](../../models_events_event_venue/)
3.  [Venue](../../models_events_event_venue/Venue-class.html)
4.  Venue.fromJson factory constructor

##### Venue class







