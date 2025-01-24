




venueListQuery method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. venueListQuery method

venueListQuery


dark\_mode

light\_mode




# venueListQuery method


String
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
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. venueListQuery method

##### Queries class





talawa
1.0.0+1






