
<div>

# Event.fromJson constructor

</div>


Event.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



## Implementation

``` language-dart
factory Event.fromJson(
  Map<String, dynamic> json,
) {
  return Event(
    id: json['_id'] as String,
    title: json['title'] as String?,
    description: json['description'] as String?,
    location: json['location'] as String?,
    recurring: json['recurring'] as bool?,
    allDay: json['allDay'] as bool?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    startTime: json['startTime'] as String?,
    endTime: json['endTime'] as String?,
    isPublic: json['isPublic'] as bool?,
    isRegistered: json['isRegistered'] as bool?,
    isRegisterable: json['isRegisterable'] as bool?,
    creator: json['creator'] == null
        ? null
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    organization: json['organization'] == null
        ? null
        : OrgInfo.fromJson(json['organization'] as Map<String, dynamic>),
    admins: json['admins'] == null
        ? null
        : (json['admins'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .,
    attendees: (json["attendees"] as List<dynamic>?)?.isEmpty ?? true
        ? null
        : (json['attendees'] as List<dynamic>?)
            ?.map(
              (e) => Attendee.fromJson(e as Map<String, dynamic>),
            )
            .,
  );
}
```







1.  [talawa](../../index.html)
2.  [event_model](../../models_events_event_model/)
3.  [Event](../../models_events_event_model/Event-class.html)
4.  Event.fromJson factory constructor

##### Event class







