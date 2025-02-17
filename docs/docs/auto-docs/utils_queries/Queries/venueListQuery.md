
<div>

# venueListQuery method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Query to get the list of Venues in an organisation.

**params**: None

**returns**:

-   `String`: Query in string form, to be passed to graphql client.



## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  venueListQuery method

##### Queries class







