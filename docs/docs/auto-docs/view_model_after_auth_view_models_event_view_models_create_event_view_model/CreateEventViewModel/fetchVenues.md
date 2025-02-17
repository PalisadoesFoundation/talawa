
<div>

# fetchVenues method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Venue](../../models_events_event_venue/Venue-class.html)]\>]]\>]]




Fetches the list of venues registered to an organisation.

**params**: None

**returns**:

-   `Future<List<Venue>>`: Returns the list of venues in an
    organisation.



## Implementation

``` language-dart
Future<List<Venue>>  async {
  final String query = queries.;
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
  }).;

  return venues;
}
```







1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  fetchVenues method

##### CreateEventViewModel class







