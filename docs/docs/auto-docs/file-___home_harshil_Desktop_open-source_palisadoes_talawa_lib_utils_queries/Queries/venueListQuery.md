




venueListQuery method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. venueListQuery method

venueListQuery


dark\_mode

light\_mode




# venueListQuery method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
venueListQuery()

Query to get the list of Venues in an organisation.

**params**:
None

**returns**:

* `String`: Query in string form, to be passed to graphql client.

## Implementation

```
String venueListQuery() {
  return """
  query GetVenueByOrgId(\$orgId: ID!, \$first: Int, \$orderBy: VenueOrderByInput, \$where: VenueWhereInput) {
    getVenueByOrgId(orgId: \$orgId, first: \$first, orderBy: \$orderBy, where: \$where) {
      _id
      capacity
      name
      description
      imageUrl
      organization {
        _id
      }
    }
  }
""";
}
```

 


1. [talawa](../../index.html)
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. venueListQuery method

##### Queries class





talawa
1.0.0+1






