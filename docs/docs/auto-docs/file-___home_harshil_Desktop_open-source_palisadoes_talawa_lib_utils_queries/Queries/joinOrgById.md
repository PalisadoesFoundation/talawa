




joinOrgById method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. joinOrgById method

joinOrgById


dark\_mode

light\_mode




# joinOrgById method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
joinOrgById(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId

)

make mutation string for joiining org by ord.id.

**params**:

* `orgId`: refer org object.

**returns**:

* `String`: returns a string for client

## Implementation

```
String joinOrgById(String orgId) {
  return '''
  mutation {
    joinPublicOrganization(organizationId: "$orgId") {
        joinedOrganizations{
          _id
          name
          image
          description
          userRegistrationRequired
          creator{
            _id
            firstName
            lastName
            image
          }

        }
    }
	}
''';
}
```

 


1. [talawa](../../index.html)
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. joinOrgById method

##### Queries class





talawa
1.0.0+1






