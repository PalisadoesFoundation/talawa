
<div>

# EventVolunteer.fromJson constructor

</div>


EventVolunteer.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



## Implementation

``` language-dart
factory EventVolunteer.fromJson(Map<String, dynamic> json) {
  return EventVolunteer(
    id: json['_id'] as String?,
    creator: json['creator'] != null
        ? User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          )
        : null,
    event: json['event'] != null
        ? Event.fromJson(json['event'] as Map<String, dynamic>)
        : null,
    group: json['group'] != null
        ? EventVolunteerGroup.fromJson(json['group'] as Map<String, dynamic>)
        : null,
    isAssigned: json['isAssigned'] as bool?,
    isInvited: json['isInvited'] as bool?,
    response: json['response'] as String?,
    user: json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>, fromOrg: true)
        : null,
  );
}
```







1.  [talawa](../../index.html)
2.  [event_volunteer](../../models_events_event_volunteer/)
3.  [EventVolunteer](../../models_events_event_volunteer/EventVolunteer-class.html)
4.  EventVolunteer.fromJson factory constructor

##### EventVolunteer class







