




sendMembershipRequest method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. sendMembershipRequest method

sendMembershipRequest


dark\_mode

light\_mode




# sendMembershipRequest method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
sendMembershipRequest(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId

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
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. sendMembershipRequest method

##### Queries class





talawa
1.0.0+1






