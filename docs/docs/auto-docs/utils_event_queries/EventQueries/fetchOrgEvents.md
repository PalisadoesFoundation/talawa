


# fetchOrgEvents method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) fetchOrgEvents
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)








## Implementation

```dart
String fetchOrgEvents(String orgId) {
  return """
    query {
      eventsByOrganization(id: "$orgId"){
        _id
        organization {
          _id
          image
        }
        title
        description
        isPublic
        isRegisterable
        recurring
        recurrance
        startDate
        endDate
        allDay
        startTime
        endTime
        location
        creator{
          _id
          firstName
          lastName
        }
        admins {
          firstName
          lastName
        }
        registrants {
          user {
            _id
          }
        }
      }
    }
  """;
}
```







