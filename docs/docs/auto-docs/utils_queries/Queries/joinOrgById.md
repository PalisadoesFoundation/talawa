




joinOrgById method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. joinOrgById method

joinOrgById


dark\_mode

light\_mode




# joinOrgById method


String
joinOrgById(

1. String orgId

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
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. joinOrgById method

##### Queries class





talawa
1.0.0+1






