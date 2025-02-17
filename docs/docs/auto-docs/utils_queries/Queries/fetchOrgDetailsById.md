
<div>

# fetchOrgDetailsById method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
fetchOrgDetailsById(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    orgId]

)



query to fetch org details.

**params**:

-   `orgId`: org identifier

**returns**:

-   `String`: query in string form, to be passed on to graphql client.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  fetchOrgDetailsById method

##### Queries class







