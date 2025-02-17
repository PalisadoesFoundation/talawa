
<div>

# fetchOrgById method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
fetchOrgById(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    orgId]

)



fetching org details with the help of id.

**params**:

-   `orgId`: Org identifier

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  fetchOrgById method

##### Queries class







