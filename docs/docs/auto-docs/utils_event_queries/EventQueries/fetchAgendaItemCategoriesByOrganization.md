




fetchAgendaItemCategoriesByOrganization method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. fetchAgendaItemCategoriesByOrganization method

fetchAgendaItemCategoriesByOrganization


dark\_mode

light\_mode




# fetchAgendaItemCategoriesByOrganization method


String
fetchAgendaItemCategoriesByOrganization(

1. String organizationId

)

Creates a GraphQL query for fetching agenda item categories by organization.

**params**:

* `organizationId`: The ID of the organization to fetch agenda item categories for.

**returns**:

* `String`: Returns a GraphQL query string to fetch agenda item categories.

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. fetchAgendaItemCategoriesByOrganization method

##### EventQueries class





talawa
1.0.0+1






