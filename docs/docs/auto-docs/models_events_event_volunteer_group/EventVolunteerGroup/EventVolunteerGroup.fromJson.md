
<div>

# EventVolunteerGroup.fromJson constructor

</div>


EventVolunteerGroup.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



## Implementation

``` language-dart
factory EventVolunteerGroup.fromJson(Map<String, dynamic> json) {
  return EventVolunteerGroup(
    id: json['_id'] as String?,
    createdAt: json['createdAt'] as String?,
    creator: json['creator'] == null
        ? null
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    event: json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
    leader: json['leader'] == null
        ? null
        : User.fromJson(
            json['leader'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    name: json['name'] as String?,
    updatedAt: json['updatedAt'] as String?,
    volunteers: (json['volunteers'] as List<dynamic>?)
        ?.map((e) => EventVolunteer.fromJson(e as Map<String, dynamic>))
        .,
    volunteersRequired: json['volunteersRequired'] as int?,
  );
}
```







1.  [talawa](../../index.html)
2.  [event_volunteer_group](../../models_events_event_volunteer_group/)
3.  [EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.html)
4.  EventVolunteerGroup.fromJson factory constructor

##### EventVolunteerGroup class







