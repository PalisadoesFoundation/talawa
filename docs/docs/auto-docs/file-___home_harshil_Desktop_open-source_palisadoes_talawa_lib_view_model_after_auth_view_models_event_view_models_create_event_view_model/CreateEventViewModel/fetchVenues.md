




fetchVenues method - CreateEventViewModel class - create\_event\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/create\_event\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. fetchVenues method

fetchVenues


dark\_mode

light\_mode




# fetchVenues method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
fetchVenues()

Fetches the list of venues registered to an organisation.

**params**:
None

**returns**:

* `Future<List<Venue>>`: Returns the list of venues in an organisation.

## Implementation

```
Future<List<Venue>> fetchVenues() async {
  final String query = queries.venueListQuery();
  final QueryResult result = await databaseFunctions.gqlAuthQuery(
    query,
    variables: {
      "orgId": _currentOrg.id,
    },
  );

  if (result.data == null) {
    return [];
  }
  final data = result.data!;
  final List<dynamic> venuesList = data['getVenueByOrgId'] as List<dynamic>;

  final List<Venue> venues = venuesList.map((venue) {
    return Venue.fromJson(venue as Map<String, dynamic>);
  }).toList();

  return venues;
}
```

 


1. [talawa](../../index.html)
2. [create\_event\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3. [CreateEventViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4. fetchVenues method

##### CreateEventViewModel class





talawa
1.0.0+1






