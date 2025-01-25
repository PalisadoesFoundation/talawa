




Venue.fromJson constructor - Venue - event\_venue library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_venue.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_venue/)
3. [Venue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_venue/Venue-class.html)
4. Venue.fromJson factory constructor

Venue.fromJson


dark\_mode

light\_mode




# Venue.fromJson constructor


Venue.fromJson(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json

)

Creates a `Venue` instance from a JSON object.

The `json` parameter is a map containing the venue data.

Returns an instance of `Venue`.


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_venue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_venue/)
3. [Venue](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_venue/Venue-class.html)
4. Venue.fromJson factory constructor

##### Venue class





talawa
1.0.0+1






