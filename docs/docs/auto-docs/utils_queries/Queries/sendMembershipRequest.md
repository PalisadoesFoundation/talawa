




sendMembershipRequest method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. sendMembershipRequest method

sendMembershipRequest


dark\_mode

light\_mode




# sendMembershipRequest method


String
sendMembershipRequest(

1. String orgId

)

mutation to send the member request.

**params**:

* `orgId`: refer org object

**returns**:

* `String`: mutation in string form, to be passed on to graphql client.

## Implementation

```
String sendMembershipRequest(String orgId) {
  return '''
    mutation {
        sendMembershipRequest(organizationId: "$orgId"){
          organization{
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
4. sendMembershipRequest method

##### Queries class





talawa
1.0.0+1






