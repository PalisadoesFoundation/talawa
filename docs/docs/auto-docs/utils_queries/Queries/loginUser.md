




loginUser method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. loginUser method

loginUser


dark\_mode

light\_mode




# loginUser method


String
loginUser(

1. String email,
2. String password

)

mutation to login the user.

**params**:

* `email`: user's data
* `password`: user's data

**returns**:

* `String`: mutation in string form, to be passed on to graphql client.

## Implementation

```
String loginUser(String email, String password) {
  return """
      mutation {
        login(data: {email: "$email", password: "$password"}){
          appUserProfile{
            adminFor{
              _id
              name
            }
            createdOrganizations{
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
          user{
            _id
            firstName
            lastName
            email
            image
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
            membershipRequests{
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
          refreshToken
          accessToken
        }
      }
  """;
}
```

 


1. [talawa](../../index.html)
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. loginUser method

##### Queries class





talawa
1.0.0+1






