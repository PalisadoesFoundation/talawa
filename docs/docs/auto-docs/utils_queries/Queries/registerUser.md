




registerUser method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. registerUser method

registerUser


dark\_mode

light\_mode




# registerUser method


String
registerUser(

1. String firstName,
2. String lastName,
3. String email,
4. String password,
5. String? selectedOrganization,

)

Mutation to register a user.

**params**:

* `firstName`: user's data.
* `lastName`: user's data.
* `email`: user's data.
* `password`: user's data.
* `selectedOrganization`: ID of the selected organization.

**returns**:

* `String`: Return the mutation in string type to be passed to graphql client.

## Implementation

```
String registerUser(
  String firstName,
  String lastName,
  String email,
  String password,
  String? selectedOrganization,
) {
  return """
      mutation{
        signUp(data: {firstName: "$firstName", lastName: "$lastName", email: "$email", password: "$password", selectedOrganization: "$selectedOrganization"})
        {
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
4. registerUser method

##### Queries class





talawa
1.0.0+1






