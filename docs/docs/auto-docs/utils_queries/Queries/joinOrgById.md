
<div>

# joinOrgById method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
joinOrgById(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    orgId]

)



make mutation string for joiining org by ord.id.

**params**:

-   `orgId`: refer org object.

**returns**:

-   `String`: returns a string for client



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  joinOrgById method

##### Queries class







