




fetchOrgById method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. fetchOrgById method

fetchOrgById


dark\_mode

light\_mode




# fetchOrgById method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
fetchOrgById(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId

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
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. fetchOrgById method

##### Queries class





talawa
1.0.0+1






