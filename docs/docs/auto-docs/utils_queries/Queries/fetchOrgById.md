




fetchOrgById method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. fetchOrgById method

fetchOrgById


dark\_mode

light\_mode




# fetchOrgById method


String
fetchOrgById(

1. String orgId

)

fetching org details with the help of id.

**params**:

* `orgId`: Org identifier

**returns**:

* `String`: mutation in string form, to be passed on to graphql client.

## Implementation

```
String fetchOrgById(String orgId) {
  return '''
  query{
    organizations(id: "$orgId"){
      image
      _id
      name
      image
      userRegistrationRequired
      creator{
        firstName
        lastName
      }
    }
  }
''';
}
```

 


1. [talawa](../../index.html)
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. fetchOrgById method

##### Queries class





talawa
1.0.0+1






