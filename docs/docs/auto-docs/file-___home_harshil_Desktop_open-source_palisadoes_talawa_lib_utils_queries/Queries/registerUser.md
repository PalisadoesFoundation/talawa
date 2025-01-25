




registerUser method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. registerUser method

registerUser


dark\_mode

light\_mode




# registerUser method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
registerUser(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) firstName,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) lastName,
3. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) email,
4. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) password,
5. [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? selectedOrganization,

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
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. registerUser method

##### Queries class





talawa
1.0.0+1






