


# Event.fromJson constructor







Event.fromJson([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)





## Implementation

```dart
factory Event.fromJson(
  Map<String, dynamic> json,
) {
  return Event(
    id: json['_id'] as String,
    title: json['title'] as String?,
    description: json['description'] as String?,
    attendees: json['attendees'] as String?,
    location: json['location'] as String?,
    longitude: json['longitude'] as double?,
    latitude: json['latitude'] as double?,
    recurring: json['recurring'] as bool?,
    allDay: json['allDay'] as bool?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    startTime: json['startTime'] as String?,
    endTime: json['endTime'] as String?,
    recurrence: json['recurrence'] as String?,
    isPublic: json['isPublic'] as bool?,
    isRegistered: json['isRegistered'] as bool?,
    isRegisterable: json['isRegisterable'] as bool?,
    creator: json['creator'] == null
        ? null
        //Creating a new User instance from a map structure.
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    organization: json['organization'] == null
        ? null
        //Creating a new OrgInfo instance from a map structure.
        : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
    admins: json['admins'] == null
        ? null
        : (json['admins'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList(),
    registrants: (json['registrants'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>, fromOrg: false))
        .toList(),
  );
}
```







