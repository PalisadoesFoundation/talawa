
<div>

# fetchAgendaItemCategoriesByOrganization method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
fetchAgendaItemCategoriesByOrganization(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    organizationId]

)



Creates a GraphQL query for fetching agenda item categories by
organization.

**params**:

-   `organizationId`: The ID of the organization to fetch agenda item
    categories for.

**returns**:

-   `String`: Returns a GraphQL query string to fetch agenda item
    categories.



## Implementation

``` language-dart
String fetchAgendaItemCategoriesByOrganization(String organizationId) {
  return """
  query {
    agendaItemCategoriesByOrganization(organizationId: "$organizationId") {
      _id
      name
      description

    }
  }
""";
}
```







1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  fetchAgendaItemCategoriesByOrganization method

##### EventQueries class







