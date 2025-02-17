::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [fetchVenues]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Venue](../../models_events_event_venue/Venue-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[fetchVenues]{.name}()
:::

::: {.section .desc .markdown}
Fetches the list of venues registered to an organisation.

**params**: None

**returns**:

-   `Future<List<Venue>>`: Returns the list of venues in an
    organisation.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  fetchVenues method

##### CreateEventViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
