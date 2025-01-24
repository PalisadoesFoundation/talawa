




fetchOrgDetailsById method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. fetchOrgDetailsById method

fetchOrgDetailsById


dark\_mode

light\_mode




# fetchOrgDetailsById method


String
fetchOrgDetailsById(

1. String orgId

)

query to fetch org details.

**params**:

* `orgId`: org identifier

**returns**:

* `String`: query in string form, to be passed on to graphql client.

## Implementation

```
String fetchOrgDetailsById(String orgId) {
  return '''
  query{
    organizations(id: "$orgId"){
      image
      _id
      name
      admins{
        _id
      }
      description
      userRegistrationRequired
      creator{
        _id
        firstName
        lastName
      }
      members{
        _id
        firstName
        lastName
        image
      }
    }
  }
''';
}
```

 


1. [talawa](../../index.html)
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. fetchOrgDetailsById method

##### Queries class





talawa
1.0.0+1






