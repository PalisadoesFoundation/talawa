
<div>

# AgendaCategory.fromJson constructor

</div>


AgendaCategory.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json]

)



Creates a new `AgendaCategory` instance from a JSON map.



## Implementation

``` language-dart
factory AgendaCategory.fromJson(Map<String, dynamic> json) {
  return AgendaCategory(
    id: json['_id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
  );
}
```







1.  [talawa](../../index.md)
2.  [event_agenda_category](../../models_events_event_agenda_category/)
3.  [AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.md)
4.  AgendaCategory.fromJson factory constructor

##### AgendaCategory class







