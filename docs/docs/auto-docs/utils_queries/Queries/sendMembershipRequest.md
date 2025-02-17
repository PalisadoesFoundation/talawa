
<div>

# sendMembershipRequest method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
sendMembershipRequest(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    orgId]

)



mutation to send the member request.

**params**:

-   `orgId`: refer org object

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.



## Implementation

``` language-dart
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







1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  sendMembershipRequest method

##### Queries class







